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
SELECT DISTINCT maker
FROM product
WHERE type = 'pc'
EXCEPT
SELECT DISTINCT product.maker
FROM product
Where type = 'laptop'


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
Select distinct pc1.model, pc2.model, pc1.speed, pc1.ram
from PC pc1, PC pc2
where pc1.speed = pc2.speed and pc1.ram = pc2.ram
and pc1.model != pc2.model and pc1.model > pc2.model

-- 17
select distinct pr.type, l.model, l.speed
from product as pr join laptop as l on l.model = pr.model
where l.speed < all (select speed from pc)


-- 18 
select distinct maker, price from product pdct
join printer pr on pdct.model = pr.model
where color = 'y'and 
pr.price = (select min(price) from printer where color = 'y')


-- 19
Select maker, avg(screen) from product pdct
join laptop lp on pdct.model = lp.model
group by maker


-- 20
select maker, count(*) count_model from product
where type = 'PC'
group by maker
having count(*) >= 3


-- 21
Select 
maker,
max(price)
FROM Product as pr JOIN PC as pc ON pr.model = pc.model
group by maker


-- 22
select speed, avg(price) from PC
where speed > 600
group by speed


-- 23
select maker from product pdct
join laptop lp on pdct.model = lp.model
where speed >= 750
intersect
select maker from product pdct
join pc on pdct.model = pc.model
where speed >= 750


-- 24
with price_out as (
select model, price
from pc
UNION
select model, price
from Laptop
UNION
select model, price
FROM Printer
)
select model
from price_out 
where price = (select MAX(price) from price_out)


-- 25
select distinct maker
from product
where model in (select model from pc
where ram = (select min(ram) from pc)
and speed = (select max(speed) from pc
where ram = (select min(ram) from pc)))
and
maker in (select maker from product where type='printer')


-- 26
select avg(price) from 
(select maker, price, type from product pdct
join pc on pdct.model = pc.model
where maker = 'A'
union all
select maker, price, type from product pdct
join laptop lp on pdct.model = lp.model
where maker = 'A') pr


-- 27
select maker, avg(hd) Avg_hd from product pdct
join pc on pdct.model = pc.model
where maker in (select maker from product pdct where type = 'Printer')
group by maker


-- 28
select count(maker) qty from 
(select maker, count(model) model_count
from product pdct
group by maker
having count(model) = 1) mk



-- 29
select o.point, o.date, inc, out
from outcome_o o
left join income_o i on o.point = i.point and o.date = i.date
union
select i.point, i. date, inc, out
from income_o i
left join outcome_o o on i.point=o.point and i.date = o.date


--30

select point, date, sum(gp.sum_out) outcome, sum(gp.sum_inc) income
from
(select point, date, SUM(inc) as sum_inc, null as sum_out from Income Group by point, date
union
select point, date, null as sum_inc,  sum(out) sum_out from outcome
group by point, date) gp
group by point, date


