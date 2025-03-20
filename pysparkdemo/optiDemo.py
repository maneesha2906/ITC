from pyspark.sql import SparkSession

# Initialize Spark session
spark = SparkSession.builder \
    .appName("PerformanceTuningExample") \
    .config("spark.sql.shuffle.partitions", "200") \
    .config("spark.executor.memory", "4g") \
    .config("spark.executor.cores", "2") \
    .getOrCreate()

# Example DataFrame loading (optimize input format like Parquet)
df = spark.read.parquet("data/large_dataset.parquet")

# Example of caching data that will be reused
df.cache()

# Example of repartitioning to improve parallelism
df_repartitioned = df.repartition(100)

# Example of join strategy (Broadcast Join for small dataset)
small_df = spark.read.parquet("data/small_dataset.parquet")
broadcast_df = spark.broadcast(small_df)

# Perform a join with broadcast
joined_df = df_repartitioned.join(broadcast_df, "key")

# Perform an action (triggers the execution)
joined_df.collect()

# Display execution plan
joined_df.explain()

# View Spark UI to analyze DAG, stages, tasks, execution plan, and logs
