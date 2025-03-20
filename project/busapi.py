import requests
import json

url = "https://api.tfl.gov.uk/Line/Mode/bus/"
# Contains real-time bus arrival data


# TfL API URL for bus lines
try:
    # Fetch data from TfL API
    response = requests.get(url)
    response.raise_for_status()  # Raise an error for bad responses (4xx, 5xx)

    # Parse JSON response
    data = response.json()

    # Loop through each line and print the bus line name
    for line in data:
        print(f"Bus Line: {line['name']} - ID: {line['id']}")

except requests.exceptions.RequestException as e:
    print("Error fetching data:", e)
except json.JSONDecodeError:
    print("Error decoding JSON response")
