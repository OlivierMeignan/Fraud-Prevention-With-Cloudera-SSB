#!/bin/bash


CLUSTERNAME=${PREFIX}-detection-csm

URL=$(cdp datahub describe-cluster --cluster-name=${CLUSTERNAME} | egrep "/cdp-proxy-api/schema-registry/api/"|awk '{print $2}'|sed -e 's/[",]//g' )

echo $URL


echo "Create Schema"

curl -X POST "${URL}schemaregistry/schemas" -H "accept: application/json" -H "Content-Type: application/json" -d "{ \"type\": \"avro\", \"schemaGroup\": \"fraud-detection\", \"name\": \"fraud-detection\", \"description\": \"fraud-detection\", \"compatibility\": \"BACKWARD\", \"validationLevel\": \"LATEST\"}"




curl -v -u $USER:$PASS -X POST "${URL}/schemaregistry/schemas" \
     -H "accept: application/json" |
     -H "Content-Type: application/json" \
     -d "{ \"type\": \"avro\", \"schemaGroup\": \"fraud\", \"name\": \"fraud\", \"description\": \"string\", \"compatibility\": \"BACKWARD\", \"validationLevel\": \"LATEST\"}"
