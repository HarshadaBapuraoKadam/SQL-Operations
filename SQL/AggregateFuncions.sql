/* COUNT */

select count(*) from customers;
select count(phone_number) from customers;
select count(distinct city) from customers;
select count(*) from customers where city='pune';

/* MIN/MAX */

select MIN(id) from customers;
select MAX(name) from customers;
SELECT MIN(phone_number) from customers;
SELECT MAX(city) from customers;

/* SUBQUERY */

SELECT * from customers where id=(select MIN(id) from customers);
select * from customers where name=(select Min(name) from customers);

/* MIN/MAX WITH GROUP BY */

select id, name, min(phone_number) from customers group by id, name;
select id, name, max(phone_number) from customers group by id, name;
select city, min(id) from customers GROUP BY city;
/* SUM & SUM WITH GROUP BY */

select sum(id) from customers;
select concat(id,' ',name) as info ,sum(phone_number) from customers GROUP BY info;
select sum(phone_number) from customers;

/* AVG AND AVG WITH GROUP BY */

select avg(id) from customers;
select city, avg(id) from customers GROUP BY city;

/* CHALLENGES */

select count(*) from customers;
select city, count(name) from customers group by city;
select sum(id) from customers;
select city, avg(id) from customers GROUP BY city;
select name,id from customers where id=(select max(id)from customers);
select id, city from customers where id=(select max(id)from customers) group by city ;
select city, count(name) customers,avg(id) from customers GROUP BY city;
