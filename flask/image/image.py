import requests
# import os

response = requests.get("http://data.visitkorea.or.kr/sparql?query=PREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E%0D%0APREFIX+rdf%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F1999%2F02%2F22-rdf-syntax-ns%23%3E%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E%0D%0APREFIX+dc%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Felements%2F1.1%2F%3E%0D%0APREFIX+owl%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2002%2F07%2Fowl%23%3E%0D%0APREFIX+xsd%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2001%2FXMLSchema%23%3E%0D%0APREFIX+vi%3A+%3Chttp%3A%2F%2Fwww.saltlux.com%2Ftransformer%2Fviews%23%3E%0D%0APREFIX+kto%3A+%3Chttp%3A%2F%2Fdata.visitkorea.or.kr%2Fontology%2F%3E%0D%0APREFIX+ktop%3A+%3Chttp%3A%2F%2Fdata.visitkorea.or.kr%2Fproperty%2F%3E%0D%0APREFIX+ids%3A+%3Chttp%3A%2F%2Fdata.visitkorea.or.kr%2Fresource%2F%3E%0D%0APREFIX+wgs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2003%2F01%2Fgeo%2Fwgs84_pos%23%3E%0D%0APREFIX+f%3A+%3Chttp%3A%2F%2Fwww.saltlux.com%2Fgeo%2Ffunctions%23%3E%0D%0APREFIX+foaf%3A+%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E%0D%0APREFIX+geo%3A+%3Chttp%3A%2F%2Fwww.saltlux.com%2Fgeo%2Fproperty%23%3E%0D%0APREFIX+busan%3A+%3Chttp%3A%2F%2Flod.busan.go.kr%2Fontology%2F%3E%0D%0APREFIX+kwater%3A+%3Chttp%3A%2F%2Fopendata.kwater.or.kr%2Flod%2Fdef%2F%3E%0D%0A%0D%0A%0D%0ASELECT+%3Ffoaf%0D%0AWHERE+%7B%0D%0A%09%3Fresource+a+kto%3APlace+%3B%0D%0A++++wgs%3Alat+%3Flat+%3B%0D%0A++++wgs%3Along+%3Flong+%3B%0D%0A++++foaf%3Adepiction+%3Ffoaf+.%0D%0A++FILTER%28%3Flat+%3D+37.5373270838+%26%26+%3Flong+%3D+126.9784385198%29%0D%0A%7D%0D%0A%09%09%09%09%09&format=json&timeout_second=30&btn_execute=")
print(response.text)
print(dir(response))
print(type(response.json()))
# print(response.jso)
result = response.json()
print(result['results']['bindings'])
index =1
for foaf in result['results']['bindings']:
    url = foaf['foaf']['value']
    print(url)
    split = url.split('.')
    ext = split[len(split)-1]
    res = requests.get(url)
    file_path = 'D:/images/'+'image'+str(index)+'.'+ext
    with open(file_path, 'wb') as file:
        file.write(res.content)
    index+=1