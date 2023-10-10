-- Создаем базу данных
DROP DATABASE IF EXISTS homework_3;
CREATE DATABASE homework_3;

-- Создаем таблицу
USE homework_3;
CREATE TABLE staff (
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    post VARCHAR(45) NOT NULL,
    seniority INT NOT NULL,
    salary INT NOT NULL,
    age INT NOT NULL
    );
    
-- Наполняем таблицу данными 
INSERT INTO staff (firstname, lastname, post, seniority, salary, age)
VALUES ("Вася", "Петров", "Начальник", 40, 100000, 60),
		("Петр", "Власов", "Начальник", 8, 70000, 30),
        ("Катя", "Катина", "Инженер", 2, 70000, 19),
        ("Саша", "Сасин", "Инженер", 12, 50000, 35),
        ("Иван", "Иванов", "Рабочий", 40, 30000, 59),
        ("Петр", "Петров", "Рабочий", 20, 25000, 40),
        ("Сидр", "Сидоров", "Рабочий", 10, 20000, 35),
        ("Антон", "Антонов", "Рабочий", 8, 19000, 28),
        ("Юрий", "Юрков", "Рабочий", 5, 15000, 25),
        ("Максим", "Максимов", "Рабочий", 2, 11000, 22),
        ("Юрий", "Галкин", "Рабочий", 3, 12000, 24),
        ("Людмила", "Маркина", "Уборщик", 10, 10000, 49);
        
/* 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания;
возрастания */

-- Сортировка в порядке убывания
SELECT id, firstname, lastname, post, seniority, salary, age 
FROM staff 
ORDER BY age DESC;

-- Сортировка в порядке возрастания
SELECT id, firstname, lastname, post, seniority, salary, age 
FROM staff 
ORDER BY age;

/* 2. Выведите 5 максимальных заработных плат (salary)
 */
 
SELECT salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

/* 3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
*/

SELECT post, SUM(salary) AS sum_salary
FROM staff
GROUP BY post;

/* 4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до
49 лет включительно. */

SELECT COUNT(id) AS count_id
FROM staff
WHERE post = "Рабочий" AND age > 24 AND age <= 49;

/* 5. Найдите количество специальностей */

SELECT COUNT(DISTINCT post) AS count_post
FROM staff;

/* 6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
*/

SELECT post
FROM staff
GROUP BY post
HAVING AVG(age) < 30;
