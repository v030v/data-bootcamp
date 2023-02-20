CREATE TABLE `class3` (
	`InvoiceNo` VARCHAR(30), 
 `StockCode` VARCHAR(30),
 `Description` VARCHAR(255),
 `Quantity` INT(3),
 `UnitPrice` FLOAT(5,2),
 	`CustomerID` VARCHAR(30),
 `Country` VARCHAR(45),
 `InvoiceDate` DATE 
)

INSERT INTO  class3 VALUES ('536365',"85123A",
	"WHITE HANGING HEART T-LIGHT HOLDER", 6, 2.55, '17850', "United Kingdom", "2010-01-12")

SELECT * FROM class3 WHERE InvoiceNo = '536365'