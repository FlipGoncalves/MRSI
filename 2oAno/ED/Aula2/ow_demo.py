import requests
import json
import pprint

# API endpoint and your API key
api_key = "a6492eefc9f313061e65e2a58bf56d3b"
url = f"https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&&appid=740b3c7f06c686f5332bd67edab24109"

# Make the request to the API
response = requests.get(url)

# Check if the request was successful (status code 200)
if response.status_code == 200:
    # Parse the response JSON
    weather_data = response.json()

    #print json keys

    print(weather_data.keys())

    # Pretty print the data
    #pprint.pprint(weather_data)
    
    # Print the current weather description
    print(weather_data['current']['weather'][0]['description'])

    # Print the temperature
    print(weather_data['current']['temp'])

    # Tranform the temperature from Kelvin to Celsius
    temp_celsius = weather_data['current']['temp'] - 273.15
    print(temp_celsius)

    # Print the humidity
    print(weather_data['current']['humidity'])

    # Print the wind speed
    print(weather_data['current']['wind_speed'])

    #print the weather forecast for the next 5 days
    for day in weather_data['daily']:
        print(day['weather'][0]['description'])
        print(day['temp']['day'])
        print(day['humidity'])
        print(day['wind_speed'])
        print("\n")
    
    
else:
    print(f"Failed to retrieve data: {response.status_code}")
