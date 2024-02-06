#!/bin/bash

# SET Period of time
START=2024-01-01
END=2024-01-31

# SET APIKEY and Secret here
APIKEY=XXXXXXXXXXXXXXXXXXX
SECRET=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY

# Preparing for Basic Authorization
APISERC=`echo -n "${APIKEY}:${SECRET}"`
CREDS=`echo -n ${APISERC} | base64 -w 0`

# Data Type to be expected
# {
#   "amount": 6.1344,
#   "discount_amount": 0,
#   "end_date": "2024-01-29",
#   "granularity": "DAILY",
#   "line_type": "KSQL_NUM_CSUS",
#   "network_access_type": "INTERNET",
#   "original_amount": 6.1344,
#   "price": 0.255553,
#   "product": "KSQL",
#   "quantity": 24,
#   "resource": {
#     "display_name": "test_ksqlDB_cluster",
#     "environment": {
#       "id": "env-xxxyyy"
#     },
#     "id": "lksqlc-zzziii"
#   },
#   "start_date": "2024-01-28",
#   "unit": "CSU-hour"
# }

# JSON output
# curl -X GET \
#   "https://api.confluent.cloud/billing/v1/costs?start_date=$START&end_date=$END" \
#   -H "Authorization: Basic $CREDS" \
#   -o ./sample.json

# CSV output
curl -X GET \
  "https://api.confluent.cloud/billing/v1/costs?start_date=$START&end_date=$END" \
  -H "Authorization: Basic $CREDS" \
  | jq -r '[".amount", ".discount_amount", ".price", ".start_date", ".end_date", ".line_type", ".network_access_type", ".original_amount", ".product", ".quantity", ".resource.display_name", ".resource.environment.id", ".resource.id", ".unit"],
           (.data[] | [
              .amount, 
              .discount_amount, 
              .price,
              .start_date, 
              .end_date, 
              .line_type, 
              .network_access_type, 
              .original_amount, 
              .product, 
              .quantity,
              .resource.display_name,
              .resource.environment.id,
              .resource.id,
              .unit]) | @csv' \
  > "billing-$START-$END.csv"
