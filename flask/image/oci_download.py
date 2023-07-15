import oci_upload

import oci_upload

config = {
    "user": "YOUR_USER",
    "key_file": "PATH_TO_PRIVATE_KEY",
    "fingerprint": "YOUR_FINGERPRINT",
    "tenancy": "YOUR_TENANCY",
    "region": "YOUR_REGION",
}

object_storage = oci.object_storage.ObjectStorageClient(config)

bucket_name = "YOUR_BUCKET_NAME"
object_name = "image.jpg"
file_path = "PATH_TO_SAVE_IMAGE"

response = object_storage.get_object(bucket_name, object_name)
with open(file_path, "wb") as file:
    file.write(response.data.content)
    print("이미지가 성공적으로 다운로드되었습니다.")