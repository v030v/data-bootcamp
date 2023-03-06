CREATE DATABASE test; 

USE test;

DESC newjeans;

SELECT COUNT(*) FROM (SELECT DISTINCT(InvoiceNo)
FROM newjeans) AS a;

SELECT *
FROM newjeans;

CREATE TABLE KRX(
    ISU_CD VARCHAR(200),
    ISU_SRT_CD VARCHAR(200),
    ISU_NM VARCHAR(200),
    ISU_ABBRV VARCHAR(200),
    ISU_ENG_NM VARCHAR(200),
    LIST_DD VARCHAR(200),
    MKT_TP_NM VARCHAR(200),
    SECUGRP_NM VARCHAR(200),
    SECT_TP_NM VARCHAR(200),
    KIND_STKCERT_TP_NM VARCHAR(200),
    PARVAL VARCHAR(200),
    LIST_SHRS VARCHAR(200),
    PRIMARY KEY(ISU_SRT_CD)
    );
    
SELECT * 
FROM KRX
WHERE MKT_TP_NM IN ('KOSPI', 'KOSDAQ')

SELECT * 
FROM KRX
WHERE MKT_TP_NM IN ('KOSPI', 'KOSDAQ')
AND KIND_STKCERT_TP_NM = '보통주';

create table stock_day(
    symbol varchar(200),
    stock_date date,
    close bigint,
    `before` bigint,
    open bigint,
    high bigint,
    low bigint,
    vol bigint,
    money bigint,
    primary key(symbol,stock_date)
);

SELECT * 
FROM stock_day AS b
JOIN KRX AS c 
ON c.ISU_SRT_CD = b.symbol;




convenience