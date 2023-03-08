import json
import urllib.request
import os
from pprint import pprint

with urllib.request.urlopen("http://api.openweathermap.org/data/2.5/weather?q=Constance,de/forecast?id=API_KEY") as url:
    data = json.loads(url.read().decode())

#print(data)
place = data['name']
temp = data['main']['temp']
pres = data['main']['pressure']
humid = data['main']['humidity']
desc = data['weather'][0]['description']

print(humid)

#print("The temperature in", place, "reads", int(round(temp-273.15,0)), "C. We have a pressure of", pres, "mbar, a relative humidity of", humid, "percent. The weather shows", desc,".")
