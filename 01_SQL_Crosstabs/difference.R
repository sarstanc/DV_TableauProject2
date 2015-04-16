df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT * FROM APD_INCIDENTS"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

spread(df, DNAME, N)


# DIFFERENCE - Duration of peace

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select CRIME_TYPE, DATE_I, TIME, LAG(TIME)
OVER (PARTITION BY DATE_I order by TIME) Prev
OVER (PARTITION BY DATE_I order by TIME) - TIME

from 
(SELECT CRIME_TYPE, DATE_I, TIME FROM APD_INCIDENTS ORDER BY DATE_I,TIME)
"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)
