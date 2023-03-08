import json
import urllib.request
import os
from pprint import pprint

with urllib.request.urlopen("http://api.openweathermap.org/data/2.5/weather?q=Constance,de/forecast?id=524901&APPID=3d96739d8a2d1dfe40562be3ab6466b3") as url:
    data = json.loads(url.read().decode())

#print(data)
place = data['name']
temp = data['main']['temp']
pres = data['main']['pressure']
humid = data['main']['humidity']
desc = data['weather'][0]['description']

print(desc)

#print("The temperature in", place, "reads", int(round(temp-273.15,0)), "C. We have a pressure of", pres, "mbar, a relative humidity of", humid, "percent. The weather shows", desc,".")
