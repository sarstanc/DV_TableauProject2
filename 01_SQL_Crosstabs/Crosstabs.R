df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT * FROM APD_INCIDENTS"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

spread(df, DNAME, N)

# RANK - Popular crime

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select CRIME_TYPE , count(*) n from APD_INCIDENTS group by CRIME_TYPE ORDER by N desc"
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


# NTH - Third crime committed

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT DATE_I,TIME, CRIME_TYPE, nth_value(CRIME_TYPE, 3)
OVER (PARTITION BY DATE_I) CRIME_TYPE
FROM
(SELECT DATE_I, TIME, CRIME_TYPE
FROM APD_INCIDENTS ORDER BY DATE_I,CAST(TIME as INT))
"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

# CUME_DIST - Percent of crime type
df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select CRIME_TYPE, n, cume_dist() 
OVER (order by n) cume_dist
from 
(SELECT CRIME_TYPE, count(*) n from APD_INCIDENTS group by CRIME_TYPE)
order by n desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

