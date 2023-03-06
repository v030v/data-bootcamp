SELECT * FROM convenience
WHERE address LIKE '% 남부%'
AND 배송서비스='Y'
AND 의약품 = 'Y';

SELECT brand, COUNT(brand) AS count
FROM convenience
GROUP BY brand
ORDER BY COUNT DESC;