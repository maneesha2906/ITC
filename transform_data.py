# -*- coding: utf-8 -*-

import logging
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, regexp_replace

# ✅ Initialize Logger
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")
logger = logging.getLogger(__name__)

# ✅ Start Spark Session
spark = SparkSession.builder.appName("Transform_Life_Data").enableHiveSupport().getOrCreate()

# ✅ Define Hive Database & Tables
HIVE_DB = "default"
SOURCE_TABLE = "tfl_tube_status"
TARGET_TABLE = "tfl_cleandata"

logger.info(f"Loading data from source table: {HIVE_DB}.{SOURCE_TABLE}")

# ✅ Load Data from Hive
df = spark.sql(f"SELECT * FROM {HIVE_DB}.{SOURCE_TABLE}")

# ✅ Clean 'linestatus' Column
df = (
    df.withColumn("linestatus", regexp_replace(col("linestatus"), r'\\', ''))  # Remove escape characters
    .withColumn("linestatus", regexp_replace(col("linestatus"), r'["\[\]]', ''))  # Remove quotes and brackets
)

logger.info("Data transformation completed successfully")

# ✅ Write Transformed Data Back to Hive
df.write.mode("overwrite").saveAsTable(f"{HIVE_DB}.{TARGET_TABLE}")

logger.info(f"Transformed data saved to {HIVE_DB}.{TARGET_TABLE}")

# ✅ Stop Spark Session
spark.stop()
logger.info("Spark session stopped successfully")
