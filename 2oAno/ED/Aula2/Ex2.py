import requests
import json

# key = "a160d5689a03c744933afdde0038e926"      My key (doesnt work)
key = "740b3c7f06c686f5332bd67edab24109"        # Key from the teacher

# oslo coordinates
lat = 59.911491
lon = 10.757933
excludes = "minutely,hourly,alerts"
url = f'https://api.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={excludes}&appid={key}'

response = requests.get(url).json()
information = {
    "Temperature (K)": response["current"]["temp"],
    "Temperature (C)": (int)(response["current"]["temp"] - 273.15),
    "Humidity": response["current"]["humidity"],
    "Wind Speed": response["current"]["wind_speed"],
    "Current Weather": response["current"]["weather"][0]["description"],
    "Next 5 days": [f"Day {x+1} after: {response['daily'][x]['summary']} ;- Temperature (C): {(int) (response['daily'][x]['temp']['day'] - 273.15)} ;- Description: {response['daily'][x]['weather'][0]['description']}" for x in range(5)]
}

print(json.dumps(information, indent=1))