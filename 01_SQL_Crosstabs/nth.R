df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT * FROM APD_INCIDENTS"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

spread(df, DNAME, N)


# NTH - Third crime committed

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT DATE_I,TIME, CRIME_TYPE, nth_value(CRIME_TYPE, 3)
OVER (PARTITION BY DATE_I) CRIME_TYPE
FROM
(SELECT DATE_I, TIME, CRIME_TYPE
FROM APD_INCIDENTS ORDER BY DATE_I,CAST(TIME as INT))
"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)
