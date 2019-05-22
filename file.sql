Выборка дилеров, кроме тех, у кого нет сайта*/
SELECT name, country, ship_address, site 
FROM users
WHERE site IS NOT NULL;
/*Выбор всей информации по диллеру из Калининграда 
из поставленной и проданной продукции*/
SELECT * FROM `products` 
WHERE id_dealer=107 
/*Выбор id ATV из таблицы products*/
SELECT DISTINCT id_model, model FROM products 
WHERE model LIKE '%ATV%'
-- Выбор из таблицы products в поисках id_cust
SELECT DISTINCT id_cust, id_model, model FROM products 
WHERE model LIKE '%ATV%' AND id_dealer=107
/*Итог поиска всех клиентов купивших ATV*/
SELECT customers.id_cust, customers.name, products.id_model, products.model, customers.email 
FROM products, customers 
WHERE products.model LIKE '%ATV%' AND customers.id_cust = products.id_cust
/*Финал где учтено все*/
SELECT customers.id_cust, customers.name, products.id_model, products.model, customers.email FROM products, customers 
WHERE products.model REGEXP 'ATV|Квадрицикл|SMC|Junior|JAM|JUMBO' AND customers.id_cust = products.id_cust AND customers.id_dealer=107
/*Вставка модели техники*/
INSERT INTO `models` (`id_model`, `model`, `warranty`, `show`) 
VALUES ('109', 'Мотобуксировщик Compact C-Z15ME-WR8', '12', '1')
/**/
SELECT customers.id_cust, customers.name, products.model, customers.email, customers.phone c FROM products, customers 
WHERE products.id_model REGEXP '37|38|39|40|75|76|77|78|79|80|81|82|83|84|85|86|87|88|89|90|91|101|102|103|104|105|108|109|110|111|112|113|114|115' AND customers.id_cust = products.id_cust AND products.id_dealer=107 and customers.id_dealer REGEXP '24|27|77|85|151|177|317'
/*add primary key in table*/
ALTER TABLE tablename ADD newid INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST;
/* copy structure table without data (maybe keys) */
CREATE TABLE NEW_TableName
LIKE OLD_TableName
/* copy table with data*/
	/* v1 */
CREATE TABLE NEW_TableName
SELECT *
FROM OLD_TableName
	/* v2 */
INSERT INTO NEW_TableName
SELECT *
FROM OLD_TableName;
/* delete data from table */
DELETE FROM `table_name` WHERE `id` = 123;
/* rename table */
RENAME TABLE OLD_TableName to NEW_TableName;
/* customers motodog dilers from moscow */
SELECT customers.id_cust, customers.name, products.model, customers.email, customers.phone, customers.address, products.sale_date 
FROM products, customers 
WHERE products.id_model REGEXP '37|38|39|40|75|76|77|78|79|80|81|82|83|84|85|86|87|88|89|90|91|101|102|103|104|105|108|109|110|111|112|113|114|115' AND customers.id_cust = products.id_cust AND products.id_dealer REGEXP '24|27|77|85|151|177|317' AND products.sale_date BETWEEN '2016-05-01' AND '2018-11-01'
GROUP BY products.sale_date
/* customers quad bike dilers from moscow id*/
SELECT customers.id_cust, customers.name, products.model, customers.email, customers.phone, customers.address 
FROM products, customers 
WHERE products.id_model REGEXP '3|6|7|9|10|12|24|25|26|41|42|43|66|106|107|' AND customers.id_cust = products.id_cust AND products.id_dealer REGEXP '24|27|77|85|151|177|317'
/* customers quad bike dilers from moscow key word*/
SELECT customers.id_cust, customers.name, products.model, customers.email, customers.phone, customers.address, products.sale_date 
FROM products, customers 
WHERE products.model REGEXP 'ATV|Квадрицикл|SMC|Junior|JAM|JUMBO' AND customers.id_cust = products.id_cust AND products.id_dealer REGEXP '24|27|77|85|151|177|317' AND products.sale_date BETWEEN '2016-05-01' AND '2018-11-01'
GROUP BY products.sale_date
/* */
INSERT INTO `snowdogs` (`article`, `model`, `vin`) 
VALUES ('S-B13MER-WR', 'Мотобуксировщик Compact S-B13MER-WR', 'Z9JSBZB04KB009182')


SELECT * from products where id_model IN ('3','4','6','7','9','10','12','24','25','26','37','38','39','40','41','42','43','44','45','46','75','76','77','78','79','80','81','82','83','84','85','86','87','88','89','90','91','101','102','103','104','105','108','109','110','111','112','113','114','115','116','117')

SELECT vin, model, id_dealer, ship_date 
FROM products 
WHERE id_model IN ('3','4','6','7','9','10','12','24','25','26','37','38','39','40','41','42','43','44','45','46','75','76','77','78','79','80','81','82','83','84','85','86','87','88','89','90','91','101','102','103','104','105','108','109','110','111','112','113','114','115','116','117') AND ship_date IS NOT null AND sale_date IS null AND ship_date BETWEEN '2013-01-01' AND '2017-12-31'

/* выбор только уникальных значений из поля */
SELECT DISTINCT(owner_id) AS owner_id FROM snowdogs ORDER BY owner_id DESC

/*меняем значение warranty_id в зависимости от model*/
UPDATE snowdogs1
SET warranty_id = (case model 
	when 'S-B13ME-WR' then 'ST' 
	when 'C-B13ME-WR' then 'CB' end) 
WHERE model in ('S-B13ME-WR', 'C-B13ME-WR')

UPDATE snowdogs1
SET warranty_id = (case model 
	when ' Standard' then 'ST' 
	when 'Compact' then 'CB' end) 
WHERE model in (' Standard', 'Compact')

UPDATE snowdogs1 
SET warranty_id = (case model 
	when 'S-B13MER-WR7' then 'ST' 
	when 'C-B13ME-WR' then 'CB' end) 
WHERE model in ('S-B13MER-WR7', 'C-B13ME-WR')

UPDATE snowdogs1
SET warranty_id = (case article 
	when 'S-B13MER-WR' then 'ST' 
	when 'S-B13MER' then 'ST' end) 
WHERE article in ('S-B13MER-WR', 'S-B13MER')