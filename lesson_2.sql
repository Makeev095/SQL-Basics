/* 1. Используя операторы языка SQL,
создайте таблицу “sales”. Заполните ее данными.
*/

-- Создаем базу данных
DROP DATABASE IF EXISTS homework_2;
CREATE DATABASE homework_2;

-- Создаем таблицу sales
USE homework_2;
CREATE TABLE sales (
	id  INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
    );

-- Наполняем таблицу данными
INSERT INTO sales (order_date, count_product)
VALUES ("2022-01-01", 156),
		("2022-01-02", 180),
        ("2022-01-03", 21),
        ("2022-01-04", 124),
        ("2022-01-05", 341);

/* 2. Для данных таблицы “sales” укажите тип
заказа в зависимости от кол-ва :
меньше 100 - Маленький заказ
от 100 до 300 - Средний заказ
больше 300 - Большой заказ
*/

-- Изменяем таблицу, добавляем категорию и обновляем таблицу 
-- Вариант №1
ALTER TABLE sales
ADD COLUMN order_type VARCHAR(45);
UPDATE sales SET order_type ='Маленький заказ' WHERE count_product < 100;
UPDATE sales SET order_type ='Средний заказ' WHERE count_product BETWEEN 100 AND 300;
UPDATE sales SET order_type ='Большой заказ' WHERE count_product > 300;

-- Вариант №2 (Но тут идет выборка, не знаю правильно или нет в условии говорилось просто указать тип в зависимости от кол-ва)
SELECT
id AS 'Номер',
order_date AS 'Дата создания заказа',
count_product AS 'Кол-во продуктов',
CASE
WHEN count_product < 100 THEN 'Маленький заказ'
WHEN count_product BETWEEN 100 AND 300
THEN 'Средний заказ'
WHEN count_product > 300 THEN 'Большой заказ'
ELSE 'Не определено'
END AS 'Тип'
FROM sales;

-- Вариант № 3 (Тоже выборка, но через IF)
SELECT
id AS 'Номер',
order_date AS 'Дата создания заказа',
count_product AS 'Кол-во продуктов',
IF (count_product < 100, 'Маленький заказ',
IF (count_product between 100 AND 300, 'Средний заказ',
IF (count_product > 300, 'Большой заказ', 'Не определено')
)
) AS 'Тип'
FROM sales;

/* 3. Создайте таблицу “orders”, заполните ее значениями
Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
*/

-- Создаем таблицу orders
CREATE TABLE orders (
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(10) NOT NULL,
    amount DOUBLE NOT NULL,
    order_status VARCHAR(10) NOT NULL);
    
-- Наполняем таблицу значениями
INSERT INTO orders (employee_id, amount, order_status)
VALUES ("e03", 15.00, "OPEN"),
		("e01", 25.50, "OPEN"),
        ("e05", 100.70, "CLOSED"),
        ("e02", 22.18, "OPEN"),
        ("e04", 9.50, "CANCELLED");

-- Выведем столбец full_order_status в зависимости от поля order_status
-- Вариант №1 (Через CASE)

SELECT 
id AS "Номер",
employeer_id AS "Номер заказчика",
amount AS "Кол-во",
CASE
WHEN order_status = "OPEN" THEN "Order is in open state"
WHEN order_status = "CLOSED" THEN "Order is closed"
WHEN order_status = "CANCELLED" THEN "Order is cancelled"
END AS "full_order_status"
FROM orders;

-- Вариант № 2 (Через IF)
SELECT 
id AS "Номер",
employeer_id AS "Номер заказчика",
amount AS "Кол-во",
IF (order_status = "OPEN", "Order is in open state",
IF (order_status = "CLOSED", "Order is closed",
IF (order_status = "CANCELLED", "Order is cancelled", 'Не определено')
)
) AS 'full_order_status'
FROM orders;