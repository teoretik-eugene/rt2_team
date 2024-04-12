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
