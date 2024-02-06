# billing_to_csv
Use confluent billing api to export csv.

#### 1. generate APIKEY and SECERT
1. Go to confluent.cloud
2. Login (Login user have to be in OrganizationAdmin Role)
3. Generate cloud API KEY
4. Download or copy generated APIKEY/SECRET pair.

#### 2. edit APIkEY and SECRET
Replace APIKEY=XXXXXXXXXXXX...X and SECRET=YYYYYYY...YY with generated credencial.
Edit START_DATE and END_DATE (END_DATE have to be later then START_DATE. i.e. END_DATE > START_DATE).

```
> vi osx.costapi.sh
APIKEY=XXXXXXXXXXXXXXXXXXX
SECRET=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
```
#### 3. execute script 

**Linux**
```
> cd <directory where costapi.sh exists>
> /costapi.sh
```

**Windows**
```
> cd <directory where costapi.ps1 exists>
> /costapi.ps1
```

#### 4. you get csv file
```
> billing-<start-date>-<end-date>.csv
```


### In case of OSX

#### 1. Install Brew
see **https://brew.sh/**

#### 2. In stall "Jq" command

`> brew install jq`

#### 3. edit APIkEY and SECRET
replace APIKEY=XXXXXXXXXXXX...X and SECRET=YYYYYYY...YY with generated credencial.
Edit START_DATE and END_DATE (END_DATE have to be later then START_DATE. i.e. END_DATE > START_DATE).
```
> vi osx.costapi.sh
APIKEY=XXXXXXXXXXXXXXXXXXX
SECRET=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY
```

#### 4. Try the shell script
```
> /osx.costapi.sh
```
#### 5. you get csv file in same directory.
```
> billing-<start-date>-<end-date>.csv
```

