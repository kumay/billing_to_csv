# billing_to_csv
Use confluent billing api to export csv.

### In case of OSX

#### 1. Install Brew
see **https://brew.sh/**

#### 2. In stall "Jq" command

`> brew install jq`

#### 3. edit APIkEY and SECRET
replace APIKEY=XXXXXXXXXXXX...X and SECRET=YYYYYYY...YY with generated credencial.

```
> vi osx.costapi.sh
APIKEY=XXXXXXXXXXXXXXXXXXX
SECRET=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
```

#### 4. Try the shell script

`> /osx.costapi.sh`
