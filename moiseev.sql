1.
SELECT model, speed, hd
FROM PC
WHERE price < 500
2.
SELECT DISTINCT maker
FROM Product
WHERE type = 'Printer'
3.
SELECT model, ram, screen
FROM LAPTOP
WHERE price > 1000
4.
SELECT *
FROM Printer
WHERE color = 'y'
5.
SELECT model, speed, hd
FROM PC
WHERE (cd = '12x' or cd = '24x') and price < 600
6.
SELECT DISTINCT PRODUCT.MAKER, LAPTOP.SPEED
FROM PRODUCT
JOIN LAPTOP ON PRODUCT.MODEL = LAPTOP.MODEL
WHERE LAPTOP.HD >= 10
7.
SELECT a.model, price 
FROM (SELECT model, price 
 FROM PC 
 UNION
 SELECT model, price 
 FROM Laptop
 UNION
 SELECT model, price 
 FROM Printer
 ) AS a 
JOIN Product p ON a.model = p.model
WHERE p.maker = 'B'
8.
SELECT DISTINCT maker
FROM PRODUCT
WHERE maker not in (SELECT maker
			FROM PRODUCT
			WHERE type = 'Laptop')
AND type = 'PC'
9.
SELECT DISTINCT p.maker
FROM PRODUCT p
JOIN PC ON p.model = PC.model
WHERE PC.speed >= 450
10.
SELECT model, price  
FROM Printer  
WHERE price = (SELECT MAX(price) 
               FROM Printer
               )
11.
SELECT AVG(SPEED)
FROM PC
12.
SELECT AVG(SPEED)
FROM LAPTOP
WHERE price > 1000
13.
SELECT AVG(SPEED)
FROM PC
JOIN PRODUCT p ON pc.model = p.model
WHERE p.maker = 'A'
14.
SELECT s.class, s.name, c.country
FROM SHIPS s
JOIN CLASSES c ON c.class = s.class
WHERE c.numGuns >= 10
15.
SELECT hd
FROM PC
GROUP BY hd
HAVING count(hd) >= 2
16.
SELECT DISTINCT a.model, b.model, a.speed, a.ram
FROM PC a, PC b
WHERE a.speed = b.speed and a.ram = b.ram and a.model > b.model
17.
SELECT DISTINCT pr.type, l.model, l.speed
FROM Laptop l, (SELECT type
		FROM Product
		WHERE type = 'Laptop') pr
WHERE l.speed < (SELECT MIN(speed)
		FROM PC)
18.
SELECT DISTINCT p.maker, pr.price
FROM printer pr
JOIN Product p ON p.model = pr.model
WHERE pr.price = (SELECT MIN(price)
FROM PRINTER
WHERE color = 'y') and pr.color = 'y'
19.
SELECT p.maker, avg(l.screen)
FROM LAPTOP l
JOIN Product p ON l.model = p.model
group by p.maker
20.
SELECT maker, count(model)
FROM product
WHERE type = 'PC'
GROUP BY maker
HAVING count(model) >= 3
21.
SELECT pr.maker, max(p.PRICE)
FROM PRODUCT pr, PC p
WHERE pr.type = 'PC' and p.model = pr.model
GROUP BY pr.maker
22.
SELECT speed, avg(price)
FROM PC
WHERE speed > 600
GROUP BY speed
23.
SELECT maker
FROM Product p 
LEFT JOIN PC ON p.model = pc.model AND pc.speed> =750 
LEFT JOIN Laptop l ON p.model = l.model  AND l.speed> =750 
GROUP BY maker
HAVING COUNT(pc.model) >= 1 and COUNT(l.model) >= 1
24.
SELECT u.MODEL
FROM (SELECT MODEL, PRICE
FROM PC
UNION
SELECT MODEL, PRICE
FROM LAPTOP
UNION
SELECT MODEL, PRICE
FROM PRINTER) as u
WHERE u.price = (SELECT MAX(price)
		FROM (SELECT MODEL, PRICE
FROM PC
UNION
SELECT MODEL, PRICE
FROM LAPTOP
UNION
SELECT MODEL, PRICE
FROM PRINTER) as un)
25.
SELECT DISTINCT maker
FROM Product 
WHERE type = 'printer' AND 
      maker IN(SELECT maker 
               FROM Product 
               WHERE model IN(SELECT model 
                              FROM PC
                              WHERE speed = (SELECT MAX(speed)
                                             FROM (SELECT speed 
                                                   FROM PC 
                                                   WHERE ram=(SELECT MIN(ram)
                                                              FROM PC
                                                              )
                                                   ) AS b
                                             )AND RAM = (SELECT MIN(RAM)
							FROM PC)
                              )
               )
26.
SELECT AVG(a.price)
FROM (SELECT code, price, speed, ram, hd
	FROM PC
 	WHERE model IN (SELECT model 
 			FROM product 
 			WHERE maker='A'
 			)	
	UNION
	SELECT code, price, speed, ram, hd
	FROM LAPTOP
	WHERE model IN (SELECT model 
			FROM product 
 			WHERE maker='A'
 			)) as a
27.
SELECT p.maker, avg(pc.hd)
FROM product p
JOIN PC ON p.model = pc.model
WHERE p.maker in (SELECT maker
		FROM Product
		WHERE type = 'Printer')
GROUP BY Maker
28.
SELECT COUNT(a.qty)
FROM (SELECT COUNT(p.Maker) qty
FROM product p
GROUP BY p.maker
HAVING COUNT(p.model)=1) as a
29.
SELECT pd.point, pd.date, i.inc, o.out
FROM (SELECT point, date
	FROM INCOME_O 
	UNION 
	SELECT point, date
	FROM OUTCOME_O) as pd
LEFT JOIN INCOME_o i ON pd.point = i.point and pd.date = i.date
LEFT JOIN OUTCOME_o o ON pd.point = o.point and pd.date = o.date
30.
SELECT pd.point, pd.date, SUM(o.out), SUM(i.inc)
FROM (SELECT point, date, code
	FROM INCOME 
	UNION 
	SELECT point, date, code
	FROM OUTCOME) as pd
LEFT JOIN INCOME i ON pd.point = i.point and pd.date = i.date and pd.code = i.code
LEFT JOIN OUTCOME o ON pd.point = o.point and pd.date = o.date and pd.code = o.code
GROUP BY pd.date, pd.point
