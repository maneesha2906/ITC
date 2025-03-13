from pyspark.sql import SparkSession
from pyspark.sql.functions import col
from pyspark.ml.feature import StringIndexer, VectorAssembler
from pyspark.ml.classification import RandomForestClassifier
from pyspark.ml.evaluation import MulticlassClassificationEvaluator
from pyspark.ml.pipeline import Pipeline

# Step 1: Initialize Spark Session
spark = SparkSession.builder \
    .appName("LineStatusClassification") \
    .enableHiveSupport() \
    .getOrCreate()

# Step 2: Load Data from Hive Table
hive_table = " big_datajan2025.scala_tfl_undergrounddata1"
df = spark.sql(f"SELECT * FROM {hive_table}")

# Step 3: Check Schema and Data Overview
df.printSchema()
df.show(10)

# Step 4: Data Preprocessing
# Assuming 'line_status' is the target column and other relevant features are used for prediction
target_column = "line_status"
feature_columns = [col for col in df.columns if col != target_column]

# Convert target column to numerical index
label_indexer = StringIndexer(inputCol=target_column, outputCol="label")

# Assemble features into a single vector
feature_assembler = VectorAssembler(inputCols=feature_columns, outputCol="features")

# Step 5: Train-Test Split
train_df, test_df = df.randomSplit([0.8, 0.2], seed=42)

# Step 6: Train a Classification Model (Random Forest)
classifier = RandomForestClassifier(featuresCol="features", labelCol="label", numTrees=100)

# Step 7: Create Pipeline
pipeline = Pipeline(stages=[label_indexer, feature_assembler, classifier])

# Step 8: Train Model
model = pipeline.fit(train_df)

# Step 9: Make Predictions on Test Data
predictions = model.transform(test_df)

# Step 10: Evaluate Model
evaluator = MulticlassClassificationEvaluator(labelCol="label", predictionCol="prediction", metricName="accuracy")
accuracy = evaluator.evaluate(predictions)

print(f"Test Accuracy: {accuracy:.2f}")

# Step 11: Show Sample Predictions
predictions.select("line_status", "prediction").show(10)

# Stop Spark Session
spark.stop()
