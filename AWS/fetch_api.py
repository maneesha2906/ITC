import requests
import json
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Initialize AWS Glue Spark Context
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)

# TfL API Details (Replace with actual keys if required)
TFL_API_URL = "https://api.tfl.gov.uk/Line/Mode/tube/Status"

# Fetch data from TfL API
response = requests.get(TFL_API_URL)
if response.status_code == 200:
    tfl_data = response.json()  # Convert API response to JSON
else:
    raise Exception(f"API Request Failed: {response.status_code} - {response.text}")

# Convert JSON to Spark DataFrame
df = spark.createDataFrame(tfl_data)

# Define S3 Bucket for Data Storage (Replace with your S3 bucket name)
s3_bucket = "s3://my-glue-tfldata-bucket/tfl-data/"

# Write Data to S3 in JSON Format
df.write.mode("overwrite").json(s3_bucket)

print("✅ TfL API data successfully saved to S3!")

# Commit Glue Job
job.commit()
