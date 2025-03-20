# Import SparkSession
from pyspark.sql import SparkSession

# Create SparkSession 
# Create SparkSession 
spark = SparkSession.builder \
      .master("local[4]") \
      .appName("SparkByExamples.com") \
      .getOrCreate() 

# Create RDD from external Data source
rdd2 = spark.sparkContext.textFile(r"C:\Users\rmane\workspace\ITC\Data\name.txt")
print(rdd2.collect())