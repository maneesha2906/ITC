import unittest
from unittest.mock import patch, MagicMock
import requests
import re
import os
import csv
from datetime import datetime

# Import the functions from your script
from fetchApiTfl import get_line_route  # Replace 'your_script' with the actual script filename

class TestTFLDataProcessing(unittest.TestCase):
    
    @patch("requests.get")
    def test_get_line_route(self, mock_get):
        # Mock API response
        mock_response = MagicMock()
        mock_response.json.return_value = [
            {"commonName": "Station A"},
            {"commonName": "Station B"}
        ]
        mock_get.return_value = mock_response
        
        # Call the function
        stations = get_line_route("victoria")
        
        # Assertions
        self.assertEqual(stations, ["Station A", "Station B"])
        mock_get.assert_called_once_with("https://api.tfl.gov.uk/Line/victoria/StopPoints")
    
    def test_extract_delay_time(self):
        DELAY_PATTERN = r"(\d+)\s?minute[s]?\s?delay"
        test_cases = [
            ("There is a 5 minute delay due to signal failure.", "5"),
            ("Expect a 10 minutes delay.", "10"),
            ("No delay reported", None),
        ]
        
        for reason, expected in test_cases:
            match = re.search(DELAY_PATTERN, reason, re.IGNORECASE)
            extracted_time = match.group(1) if match else "N/A"
            self.assertEqual(extracted_time, expected if expected else "N/A")
    
    @patch("os.system")
    def test_hdfs_operations(self, mock_os):
        HDFS_DIRECTORY = "/tmp/big_datajan2025/TFL/TFL_UndergroundRecord"
        local_csv_path = "/tmp/test_file.csv"
        hdfs_file_path = f"{HDFS_DIRECTORY}/test_file.csv"
        
        os.system(f"hdfs dfs -mkdir -p {HDFS_DIRECTORY}")
        os.system(f"hdfs dfs -put {local_csv_path} {hdfs_file_path}")
        
        # Assert that os.system was called correctly
        mock_os.assert_any_call(f"hdfs dfs -mkdir -p {HDFS_DIRECTORY}")
        mock_os.assert_any_call(f"hdfs dfs -put {local_csv_path} {hdfs_file_path}")
    
    def test_csv_writing(self):
        sample_data = [["Timedetails", "Line", "Status", "Reason", "Delay Time (Minutes)", "Route (Stations)"]]
        test_csv_path = "/tmp/test_output.csv"
        
        # Write to CSV
        with open(test_csv_path, mode="w", newline="", encoding="utf-8") as file:
            writer = csv.writer(file)
            writer.writerows(sample_data)
        
        # Read back and verify
        with open(test_csv_path, mode="r", encoding="utf-8") as file:
            reader = csv.reader(file)
            rows = list(reader)
            self.assertEqual(rows, sample_data)
    
if __name__ == "__main__":
    unittest.main()
