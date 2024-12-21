/* DISTINCT */

select distinct city from customers;
select distinct name,city from customers;

/* ORDER BY */

select name from customers ORDER BY name ;
select name from customers ORDER BY name DESC ;
select id from customers ORDER BY id asc;
select id from customers ORDER BY id desc;
select id, name from customers ORDER BY 2,1;


/* LIMIT */

select * from customers limit 5;
select id,name from customers order by id desc limit 3;
select id,name,city from customers order by name limit 3,6;

/* LIKE */

select * from customers where name like '%a%';
select * from customers where name like '%a_';
select name , city from customers where city like 'pune';
select name , city from customers where city like '_u%';

/* CHALLENGES */

select id from customers where id like'30_';
select id, name from customers order by id desc limit 1;
SELECT concat(name, ' ', phone_number) as summary from customers ORDER BY phone_number desc limit 3;
select id, name from customers where name like'% %';
select * from customers order by 1 limit 3;
select id, name, city from customers order by 3,1;
select concat('My name is ',name,' and I am living in ',city) as address from customers order by city;


