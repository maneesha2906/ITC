import requests

# API URL (Example: JSONPlaceholder fake API)
url = "https://api.tfl.gov.uk/Line/Mode/tube/Status"

# Sending GET request
response = requests.get(url)

# Check if request was successful (status code 200)
if response.status_code == 200:
    data = response.json()  # Convert response to JSON
    print(data[:10])  # Print first 2 items
else:
    print("Error:", response.status_code)


