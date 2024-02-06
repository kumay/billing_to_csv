# SET Period of time
$START = "2024-01-01"
$END = "2024-01-31"

# SET APIKEY and Secret here
$APIKEY = "XXXXXXXXXXXXXXXX"
$SECRET = "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"

# Preparing for Basic Authorization
$APISERC = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes("${APIKEY}:${SECRET}"))

# JSON output
# Invoke-RestMethod -Method GET `
#   -Uri "https://api.confluent.cloud/billing/v1/costs?start_date=$START&end_date=$END" `
#   -Headers @{ Authorization = "Basic $APISERC" } `
#   -OutFile "./sample.json"

# CSV output
Invoke-RestMethod -Method GET `
  -Uri "https://api.confluent.cloud/billing/v1/costs?start_date=$START&end_date=$END" `
  -Headers @{ Authorization = "Basic $APISERC" } | `
  Select-Object -ExpandProperty data | `
  ForEach-Object {
    [PSCustomObject]@{
      amount = $_.amount
      discount_amount = $_.discount_amount
      price = $_.price
      start_date = $_.start_date
      end_date = $_.end_date
      line_type = $_.line_type
      network_access_type = $_.network_access_type
      original_amount = $_.original_amount
      product = $_.product
      quantity = $_.quantity
      resource_display_name = $_.resource.display_name
      resource_environment_id = $_.resource.environment.id
      resource_id = $_.resource.id
      unit = $_.unit
    }
  } | Export-Csv -Path "billing-$START-$END.ps1.csv" -NoTypeInformation
