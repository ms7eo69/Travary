import configparser
import cx_Oracle
import oci
import requests as req
from oci.object_storage.models import CreateMultipartUploadDetails

cp=configparser.ConfigParser()
cp.read('oos.ini')

config = {
    "user": cp['PROFILE']['user'],
    "fingerprint": cp['PROFILE']['fingerprint'],
    "tenancy": cp['PROFILE']['tenancy'],
    "region": cp['PROFILE']['region'],
    "key_file": cp['PROFILE']['key_file']
}

# Oracle Object Storage 클라이언트 생성
object_storage = oci.object_storage.ObjectStorageClient(config)
bucket_name = "Travary"
namespace_name = "axs7uaj7bfw1"

cp.read('adw.ini')

cx_Oracle.init_oracle_client(lib_dir=cp['ORACLE']['wallet_location'])
conn = cx_Oracle.connect(
    user=cp['ORACLE']['user'],
    password=cp['ORACLE']['password'],
    dsn=cp['ORACLE']['dsn'],
    encoding='UTF-8'
)

cursor = conn.cursor()
cursor.execute('''
    SELECT p.no,lnt,lat 
    FROM place_loc l  
    JOIN place p ON p.no=l.no
    WHERE category!='축제/공연'
    ORDER BY no
    ''')
rows = cursor.fetchall()
try:
    for row in rows:
        no,lnt,lat = row
        res = req.get(f'http://data.visitkorea.or.kr/sparql?query=PREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+dc%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Felements%2F1.1%2F%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+vi%3A+%3Chttp%3A%2F%2Fwww.saltlux.com%2Ftransformer%2Fviews%23%3E%0D%0APREFIX+kto%3A+%3Chttp%3A%2F%2Fdata.visitkorea.or.kr%2Fontology%2F%3E%0D%0APREFIX+ktop%3A+%3Chttp%3A%2F%2Fdata.visitkorea.or.kr%2Fproperty%2F%3E%0D%0APREFIX+ids%3A+%3Chttp%3A%2F%2Fdata.visitkorea.or.kr%2Fresource%2F%3E%0D%0APREFIX+wgs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2003%2F01%2Fgeo%2Fwgs84_pos%23%3E%0D%0APREFIX+f%3A+%3Chttp%3A%2F%2Fwww.saltlux.com%2Fgeo%2Ffunctions%23%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+geo%3A+%3Chttp%3A%2F%2Fwww.saltlux.com%2Fgeo%2Fproperty%23%3E%0D%0APREFIX+busan%3A+%3Chttp%3A%2F%2Flod.busan.go.kr%2Fontology%2F%3E%0D%0APREFIX+kwater%3A+%3Chttp%3A%2F%2Fopendata.kwater.or.kr%2Flod%2Fdef%2F%3E%0D%0A%0D%0A%0D%0ASELECT+%3Ffoaf%0D%0AWHERE+%7B%0D%0A%09%3Fresource+a+kto%3APlace+%3B%0D%0A++++wgs%3Alat+%3Flat+%3B%0D%0A++++wgs%3Along+%3Flong+%3B%0D%0A++++foaf%3Adepiction+%3Ffoaf+.%0D%0A++FILTER%28%3Flat+%3D+{lat}+%26%26+%3Flong+%3D+{lnt}%29%0D%0A%7D%0D%0A%09%09%09%09%0D%0A++%09%09%09%09%0D%0A%09%09%09&format=json&timeout_second=30&btn_execute=')
        index = 1
        for foaf in res.json()['results']['bindings']:
            url = foaf['foaf']['value']
            split = url.split('.')
            ext = split[len(split) - 1]
            object_name = "images/place/" + str(no) + "/" + str(index) + "." + ext
            max_retries = 5
            for i in range(max_retries):
                try:
                    res = req.get(url, stream=True)
                    # 이미지 데이터 가져오기
                    image_data = res.content
                    break  # 재시도 없이 성공한 경우 반복문 종료
                except (req.exceptions.ConnectionError, req.exceptions.ChunkedEncodingError) as e:
                    print(f"Connection error occurred: {e}")
                    if i < max_retries - 1:
                        print("Retrying...")
                        continue
                    else:
                        cursor.execute(f'INSERT INTO temp_lastnum VALUES('+no+')')
                        print("Max retries exceeded. Failed to retrieve the image.")

            create_multipart_upload_details = CreateMultipartUploadDetails()
            create_multipart_upload_details.object = object_name
            create_multipart_upload_details.content_type = "image/jpeg"
            multipart_upload = object_storage.create_multipart_upload(
                namespace_name=namespace_name,
                bucket_name=bucket_name,
                create_multipart_upload_details=create_multipart_upload_details
            )

            # 업로드한 이미지 파트 추가
            upload_part_response = object_storage.upload_part(
                bucket_name = bucket_name,
                namespace_name = namespace_name,
                object_name = object_name,
                upload_id = multipart_upload.data.upload_id,
                upload_part_num = index,  # 파트 번호
                upload_part_body = image_data
            )

            # Multipart 업로드 완료
            commit_multipart_upload_details = oci.object_storage.models.CommitMultipartUploadDetails()
            commit_multipart_upload_details.parts_to_commit = [
                oci.object_storage.models.CommitMultipartUploadPartDetails(
                    part_num=index,
                    etag=upload_part_response.headers["ETag"]
                )
            ]
            object_storage.commit_multipart_upload(
                namespace_name = namespace_name,
                bucket_name = bucket_name,
                object_name = object_name,
                upload_id = multipart_upload.data.upload_id,
                commit_multipart_upload_details = commit_multipart_upload_details,
            )
             # 정상적으로 응답을 못받을시 관광지의 no insert
            index += 1
except Exception as e:
    print(e)
finally:
    #6.연결해제
    cursor.close()
    conn.close()