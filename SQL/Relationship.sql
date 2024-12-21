/* FOREIGN KEYS */

CREATE TABLE customers (
    ID int not null auto_increment primary key,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);
create table orders (
    ID int not null auto_increment primary key,
    order_date date,
    amount decimal (8,2),
    Customer_id int,
    foreign key (Customer_id) references customers(ID)
);
INSERT INTO customers (first_name, last_name, email) VALUES   -- Parent Table
('Boy', 'George', 'george@gmail.com'),
('George', 'Michael', 'gm@gmail.com'),
('David', 'Bowie', 'david@gmail.com'),
('Blue', 'Steele', 'blue@gmail.com'),
('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)  --Child Table
VALUES ('2016/02/10', 99.99, 1), ('2017/11/11', 35.50, 1),
('2014/12/12', 800.67, 2),
('2015/01/03', 12.50, 2),
('1999/04/11', 450.25, 5);

/* INNER JOIN */

SELECT * FROM customers INNER JOIN orders on customers.ID = orders.customer_id;

/* LEFT JOIN */

SELECT * FROM customers LEFT JOIN orders on customers.ID = orders.customer_id;

/* RIGHT JOIN */

SELECT * FROM customers RIGHT JOIN orders on customers.ID = orders.customer_id;


/* CHALLENGES */

CREATE TABLE IF NOT EXISTS Students (ID int auto_increment primary key, first_name varchar(100));  -- Parent Table

CREATE TABLE IF NOT EXISTS Papers (Student_id int, foreign key Papers(Student_id) references Students(ID), Title varchar(100), Grade int);  -- Child Table

INSERT INTO Students (first_name) VALUES
('Caleb'),
('Samantha'),
('Raj'),
('Carlos'),
('Lisa');

INSERT INTO Papers (Student_id, Title, Grade) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

Select first_name, Title, Grade FROM Students INNER JOIN Papers ON Students.ID = Papers.Student_id ORDER BY Grade Desc;

Select first_name, Title, Grade FROM Students LEFT JOIN Papers ON Students.ID = Papers.Student_id;

Select first_name, ifnull(Title, 'MISSING') as Title, ifnull (Grade, '0') as Grade FROM Students LEFT JOIN Papers ON Students.ID = Papers.Student_id;

SELECT first_name, ifnull(avg(Grade),0) as average FROM Students LEFT JOIN Papers ON Students.ID = Papers.Student_id  group by first_name ORDER BY average DESC;

SELECT first_name, ifnull(avg(Grade),0) as average,
CASE 
    WHEN avg(Grade) > 50 THEN 'PASSING'
    ELSE 'FAILING'
END as 'Passing Status'
FROM Students LEFT JOIN Papers ON Students.ID = Papers.Student_id  group by first_name ORDER BY average DESC;
