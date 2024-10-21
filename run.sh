#!/bin/sh

# Read the artifactId and version from the text files
ARTIFACT_ID=$(cat /app/artifactId.txt)
VERSION=$(cat /app/version.txt)

# Construct the JAR file name
JAR_FILE="/app/${ARTIFACT_ID}-${VERSION}.jar"

# Run the Java application
echo "Running JAR: $JAR_FILE"
exec java -jar "$JAR_FILE"
