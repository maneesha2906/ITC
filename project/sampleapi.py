import urllib.request
import json
import pandas as pd

try:
    # API URL
    url = "https://api.tfl.gov.uk/Line/Route?serviceTypes=Regular"

    # Request headers
    hdr = {
        'Cache-Control': 'no-cache'
    }

    # Create request object
    req = urllib.request.Request(url, headers=hdr)

    # Send GET request and get the response
    req.get_method = lambda: 'GET'
    response = urllib.request.urlopen(req)

    # Check the HTTP response code (200 means successful)
    print("Response Code:", response.getcode())

    # Read and decode the response to JSON
    data = json.load(response)  # Directly parse JSON from the response

    # Convert the JSON data to a pandas DataFrame
    df = pd.DataFrame(data)

    # Save the DataFrame to an Excel file
    excel_filename = "api_response.xlsx"
    df.to_excel(excel_filename, index=False, engine='openpyxl')

    print(f"✅ Data saved to {excel_filename}")

except Exception as e:
    print(f"❌ An error occurred: {e}")
