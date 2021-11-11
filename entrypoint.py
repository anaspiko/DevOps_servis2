import requests
import sys
import os

SERVICE1_URL = "http://servis1:8081"

message = sys.stdin.readline()
print("Skidam podatke s weba: " + message)

userDefinedService = os.environ.get('SERVICE1')
if userDefinedService:
    SERVICE1_URL = userDefinedService

print("Šaljem podatke na: " + SERVICE1_URL)
message = requests.get(message).text
data = ["md5", message]

print(requests.post(SERVICE1_URL, data="\n".join(data)))