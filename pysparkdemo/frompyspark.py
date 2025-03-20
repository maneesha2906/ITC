from pyspark.sql import SparkSession

# Step 1: Create a SparkSession (Entry Point)
spark = SparkSession.builder \
    .appName("PySpark UI Architecture Example") \
    .master("local[*]") \
    .getOrCreate()

# Step 2: Create an RDD and perform some transformations
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
rdd = spark.sparkContext.parallelize(data, 3)  # Using 3 partitions

# Step 3: Apply transformations
squared_rdd = rdd.map(lambda x: x * x)  # Square each number
filtered_rdd = squared_rdd.filter(lambda x: x % 2 == 0)  # Keep only even numbers

# Step 4: Trigger action to start the execution
result = filtered_rdd.collect()

# Step 5: Print the result
print("Processed Data:", result)

# Step 6: Check the RDD lineage (DAG)
print("RDD Lineage Graph:", filtered_rdd.toDebugString())

# Step 7: Keep Spark UI Running (default at http://localhost:4040)
# Sleep for 60 seconds to inspect the UI
import time
time.sleep(60)

# Step 8: Stop the SparkSession
spark.stop()
