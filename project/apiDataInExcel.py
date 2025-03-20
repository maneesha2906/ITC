
import requests
import pandas as pd


# API URL (Example: JSONPlaceholder fake API)
url = "https://jsonplaceholder.typicode.com/posts"

# Fetch data from API
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    data = response.json()  # Convert response to JSON
    
    # Convert JSON data to a pandas DataFrame
    df = pd.DataFrame(data)
    
    # Save DataFrame to an Excel file
    excel_filename = "apiDataInExcel.xlsx"
    df.to_excel(excel_filename, index=False, engine="openpyxl")

    print(f"✅ Data saved to {excel_filename}")
else:
    print("❌ Failed to fetch data. Status code:", response.status_code)
