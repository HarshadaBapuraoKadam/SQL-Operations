/* NOT EQUAL */

SELECT * FROM customers where city != 'Pune';
SELECT * FROM customers where name != 'Jane Smith';

/* NOT LIKE */

SELECT * FROM customers where name NOT LIKE 'J%';
SELECT * FROM customers where city NOT LIKE '%pune%';
SELECT * FROM customers where id like '30_';
SELECT * FROM customers where city not like '___';

/* GREATER THAN */

SELECT * FROM customers where age > 35;
SELECT * FROM customers where age >= 35;
SELECT * FROM customers where id >= 304 order by id ASC;
select 64 > 4 ;  -- Returns true or false 
select 198 > 654 ;  
select 'b' > 'd';
SELECT 'e' > 'a';

/* LESS THAM */

SELECT * FROM customers where age < 36;
SELECT * FROM customers where id <= 305 order by id DESC;
select (3*5) < (4*3);
select  'e' < 'j';

/* AND && */

SELECT * FROM customers where city='pune' and age > 34;
SELECT * FROM customers where age = 35 && id < 306;
SELECT 6 > -3 and 5 = 8 ;
select 35 >= 20 && 'A' = 'a';
SELECT * FROM customers where id < 307 and city like '%pune%' && age > 32 ;

/* OR || */

SELECT * FROM customers where id<306 OR city = 'pune';
select (3*7) < 65 OR (7/3) > 57 || (9+43) = 36 ;

/* BETWEEN NOT BETWEEN */

SELECT * FROM customers where id between 302 AND 307;
SELECT * FROM customers where id not between 303 AND 306;
SELECT * FROM customers where age not between 35 AND 40;
SELECT * FROM customers where age between 35 AND 40;

/* IN / NOT IN */

SELECT * FROM customers where id IN (301,306,307,304);
SELECT * FROM customers where age not in (34,39,40);
SELECT * FROM customers WHERE id %2 != 0 ;  -- To get the odd values

/* CASE */

select * ,
CASE
    when city='pune' then 'Home District'
    else 'Other then Home District'
    end  as place
from customers;    

SELECT * , 
    CASE 
        when id <= 303 then '*'
        when id <= 306 then '**'
        else '***'
        END as star
from customers;

/* CHALLENGES */

select * from customers where Age < 37;
SELECT * FROM customers where city = 'Pune' or city = 'Mumbai';
select * FROM customers where city in('pune', 'mumbai');
select * FROM customers where city = 'pune' and id > 304;
SELECT * FROM customers where AGE BETWEEN 32 and 38;
SELECT * FROM customers where name like 'J%' or name like 'C%';
SELECT * FROM customers where substr(name,1,1) in ('J', 'C');
select * ,
    CASE
        when city = 'Pune' then 'HD'
        when city = 'Mumbai' || city = 'Nagpur' then 'OHD'
        ELSE 'Not Applicable'
    end as TYPE
from customers;