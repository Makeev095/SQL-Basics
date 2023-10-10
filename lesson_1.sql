/* Создайте таблицу с мобильными телефонами (mobile_phones),
используя графический интерфейс. Заполните БД данными. Добавьте
скриншот на платформу в качестве ответа на ДЗ
*/

-- Создаю базу данных
DROP DATABASE IF EXISTS homework_1;
CREATE DATABASE homework_1;
USE homework_1;

-- создаю таблицу мобильных телефонов
CREATE TABLE phones(
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    product_name VARCHAR(45) NOT NULL,
    manufacturer VARCHAR(45) NOT NULL,
    product_count INT NOT NULL,
    price INT NOT NULL
    );
    
-- заполняю таблицу значениями
INSERT INTO phones (product_name, manufacturer, product_count, price)
VALUES("IPhone X", "Apple", "3", "76000");

INSERT INTO phones (product_name, manufacturer, product_count, price)
VALUES("IPhone 8", "Apple", "2", "51000");

INSERT INTO phones (product_name, manufacturer, product_count, price)
VALUES("Galaxy S9", "Samsung", "2", "56000");

INSERT INTO phones (product_name, manufacturer, product_count, price)
VALUES("Galaxy S8", "Samsung", "1", "41000");

INSERT INTO phones (product_name, manufacturer, product_count, price)
VALUES("P20 Pro", "Huawei", "5", "36000");

/* Выведите название, производителя и цену для товаров, количество
которых превышает 2
*/

-- вывожу название производителя и цену товара, колличество которых превышает 2
SELECT manufacturer, price WHERE product_count > 2;

/* Выведите весь ассортимент товаров марки “Samsung” */

-- вывожу ассортимент товаром марки Samsung
SELECT product_name, product_count, price WHERE manufacture = "Samsung";

/* 4. (по желанию)* С помощью регулярных выражений найти:
4.1. Товары, в которых есть упоминание "Iphone"
4.2. Товары, в которых есть упоминание "Samsung"
4.3. Товары, в которых есть ЦИФРЫ
4.4. Товары, в которых есть ЦИФРА "8" */

-- 4.1 
SELECT manufacturer, product_count, price WHERE product_name LIKE "%Iphone%";

-- 4.2
SELECT product_name, product_count, price WHERE manufacturer LIKE "%Samsung%";

-- 4.3
SELECT product_name, manufacturer WHERE product_count AND price RLIKE "[0-9]";

-- 4.4
SELECT product_name, manufacturer WHERE product_count AND price RLIKE "[8]";
