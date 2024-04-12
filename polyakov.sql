-- Задачи с сайта SQL-EX.ru

-- 1
SELECT model, speed, hd
FROM PC
WHERE price < 500

-- 2
SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer'


-- 3
SELECT 
model,
ram,
screen
FROM Laptop
WHERE price > 1000


-- 4
SELECT *
FROM Printer
WHERE color ='y'


-- 5
SELECT
model,
speed,
hd
FROM PC
WHERE cd in ('12x', '24x') 
AND price < 600


-- 6
SELECT DISTINCT 
pr.maker,
lp.speed
FROM PRODUCT as pr JOIN Laptop as lp
ON type = 'Laptop' AND pr.model = lp.model
WHERE lp.hd >= 10


-- 7
SELECT DISTINCT
Product.model,
PC.price
FROM PC JOIN Product ON Product.model = PC.model 
AND Product.maker = 'B'
UNION
SELECT DISTINCT
Product.model,
Laptop.price
FROM Laptop JOIN Product ON Product.model = Laptop.model 
AND Product.maker = 'B'
UNION
SELECT DISTINCT
Product.model,
Printer.price
FROM Printer JOIN Product ON Product.model = Printer.model 
AND Product.maker = 'B'


-- 8
----

--9
Select DISTINCT
maker
from Product JOIN PC ON PC.model = Product.model
WHERE PC.speed >= 450


-- 10
Select model, price
FROM Printer
WHERE price = (SELECT MAX(price) from Printer)


-- 11 
Select AVG(speed)
FROM PC


-- 12
SELECT AVG(speed)
FROM Laptop
Where price > 1000


--13
Select AVG(PC.speed)
FROM Product as pr JOIN PC ON pr.model = PC.model AND pr.maker = 'A'


-- 14
Select
Classes.class,
Ships.name,
Classes.country
from Classes JOIN Ships ON Classes.class = Ships.class AND Classes.numGuns >= 10


-- 15
Select hd FROM PC
Group By hd 
Having COUNT(*) >= 2


-- 16
Select pc1.model, pc2.model, pc1.speed, pc1.ram
from PC pc1 join PC pc2 
on pc1.speed = pc2.speed and pc1.ram = pc2.ram 
and pc1.model != pc2.model
order by pc1.model asc