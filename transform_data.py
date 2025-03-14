# -*- coding: utf-8 -*-

import logging
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, regexp_replace, concat_ws

# ✅ Initialize Logger
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")
logger = logging.getLogger(__name__)

# ✅ Start Spark Session
spark = SparkSession.builder.appName("transform_data").enableHiveSupport().getOrCreate()

# ✅ Define Hive Database & Tables
HIVE_DB = "default"
SOURCE_TABLE = "tfl_tube_status"
TARGET_TABLE = "tfl_cleandata"

logger.info("Loading data from source table: {}.{}".format(HIVE_DB, SOURCE_TABLE))


# ✅ Load Data from Hive
df = spark.sql("SELECT * FROM {}.{}".format(HIVE_DB, SOURCE_TABLE))

# ✅ Clean 'linestatus' Column
df = (
    df.withColumn("linestatus", regexp_replace(concat_ws(",",col("linestatus")), r'\\', ''))  # Remove escape characters
    .withColumn("linestatus", regexp_replace(concat_ws(",",col("linestatus")), r'["\[\]]', ''))  # Remove quotes and brackets
)

logger.info("Data transformation completed successfully")

# ✅ Write Transformed Data Back to Hive
df.write.mode("overwrite").saveAsTable("{}.{}".format(HIVE_DB, TARGET_TABLE))

logger.info("Transformed data saved to {}.{}".format(HIVE_DB, TARGET_TABLE))

# ✅ Stop Spark Session
spark.stop()
logger.info("Spark session stopped successfully")
