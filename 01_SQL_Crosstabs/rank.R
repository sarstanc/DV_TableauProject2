df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"SELECT * FROM APD_INCIDENTS"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

spread(df, DNAME, N)

# RANK - Popular crime

df <- data.frame(fromJSON(getURL(URLencode(gsub("\n", " ", '129.152.144.84:5001/rest/native/?query=
"select CRIME_TYPE , count(*) n from APD_INCIDENTS group by CRIME_TYPE ORDER by N desc"
')),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/ORCL.usuniversi01134.oraclecloud.internal', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE))); tbl_df(df)

spread(df, DNAME, N)