import configparser
import cx_Oracle
import oci
import requests as req
import os
from oci.object_storage.models import CreateMultipartUploadDetails

cp=configparser.ConfigParser()
cp.read('adw.ini')

cx_Oracle.init_oracle_client(lib_dir=cp['ORACLE']['wallet_location'])
conn = cx_Oracle.connect(
    user=cp['ORACLE']['user'],
    password=cp['ORACLE']['password'],
    dsn=cp['ORACLE']['dsn'],
    encoding='UTF-8'
)

try :
    cursor = conn.cursor()
    cursor.execute('''
        SELECT p.no,lnt,lat 
        FROM place_loc l  
        JOIN place p ON p.no=l.no
        WHERE category!='축제/공연'
        ORDER BY p.no
        ''')
    rows = cursor.fetchall()

    for row in rows:
        no,lnt,lat = row
        res = req.get(f'http://data.visitkorea.or.kr/sparql?query=PREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+dc%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Felements%2F1.1%2F%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+vi%3A+%3Chttp%3A%2F%2Fwww.saltlux.com%2Ftransformer%2Fviews%23%3E%0D%0APREFIX+kto%3A+%3Chttp%3A%2F%2Fdata.visitkorea.or.kr%2Fontology%2F%3E%0D%0APREFIX+ktop%3A+%3Chttp%3A%2F%2Fdata.visitkorea.or.kr%2Fproperty%2F%3E%0D%0APREFIX+ids%3A+%3Chttp%3A%2F%2Fdata.visitkorea.or.kr%2Fresource%2F%3E%0D%0APREFIX+wgs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2003%2F01%2Fgeo%2Fwgs84_pos%23%3E%0D%0APREFIX+f%3A+%3Chttp%3A%2F%2Fwww.saltlux.com%2Fgeo%2Ffunctions%23%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+geo%3A+%3Chttp%3A%2F%2Fwww.saltlux.com%2Fgeo%2Fproperty%23%3E%0D%0APREFIX+busan%3A+%3Chttp%3A%2F%2Flod.busan.go.kr%2Fontology%2F%3E%0D%0APREFIX+kwater%3A+%3Chttp%3A%2F%2Fopendata.kwater.or.kr%2Flod%2Fdef%2F%3E%0D%0A%0D%0A%0D%0ASELECT+%3Ffoaf%0D%0AWHERE+%7B%0D%0A%09%3Fresource+a+kto%3APlace+%3B%0D%0A++++wgs%3Alat+%3Flat+%3B%0D%0A++++wgs%3Along+%3Flong+%3B%0D%0A++++foaf%3Adepiction+%3Ffoaf+.%0D%0A++FILTER%28%3Flat+%3D+{lat}+%26%26+%3Flong+%3D+{lnt}%29%0D%0A%7D%0D%0A%09%09%09%09%0D%0A++%09%09%09%09%0D%0A%09%09%09&format=json&timeout_second=30&btn_execute=')
        foafs = res.json()['results']['bindings']

        if len(foafs):
            index = 1
            for foaf in foafs:
                url = foaf['foaf']['value']
                split = url.split('.')
                ext = split[len(split) - 1]
                # filename = os.path.join(dirpath, query + str(startindex) + "." + ext)
                dirpath = "place/"+str(no)
                if not os.path.isdir(dirpath):
                    os.mkdir(dirpath)
                file_name = str(index) + "." + ext
                file_path = os.path.join(dirpath,file_name)
                res = req.get(url)
                image_data = res.content

                with open(file_path,'wb') as f:
                    f.write(res.content)
                index += 1
        else:
            cursor.execute("INSERT INTO has_picture VALUES(:no)",no=no)
except Exception as e:
    print(e)
finally:
    conn.commit()
    #6.연결해제
    cursor.close()
    conn.close()