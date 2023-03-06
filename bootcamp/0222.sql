DESC stock_day;

SELECT ISU_SRT_CD, ISU_ABBRV FROM KRX ;

SELECT B.ISU_SRT_CD, B.ISU_ABBRV, A.result
FROM KRX AS B 
JOIN (SELECT symbol, max(close)- min(close) AS result
FROM stock_day
GROUP BY symbol
ORDER BY result DESC) AS A
ON A.symbol = B.ISU_SRT_CD
ORDER BY  result DESC;

TRUNCATE TABLE stock_day;