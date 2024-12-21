show databases;
use demo;
show tables;
 select * from combinedemployee;

 /* concat*/
 select concat (E_name,' - ',E_dept, ' - ' , E_salary) as fullname from combinedemployee;
 select concat (E_name,' working in ',E_dept, ' has ' , E_salary, ' salary') as E_details from combinedemployee;


 /* concat_ws */

select concat_ws (' - ',E_dept,E_name,E_salary,E_age) as data from combinedemployee;

/* Substring */

select substring('Hello World', 1, 4) ;
select substr(E_dept,2,6);
select concat(substring(E_dept, 1,4),'...',E_salary,'...') as data from combinedemployee;

/* Replace */

select replace ('Hello World', 'Hell','@#$%') as rep ;
select replace (E_name, 'o', '@') as reps from combinedemployee;
select replace (E_name, 'h', 6) as reps from combinedemployee;
select replace ('create read update delete'," ",' , ') as new ;
select replace (concat(substring(E_name,1,4),' ',E_dept),' ',' & ') as mix from combinedemployee;

/* Reverse */

select reverse ('Hello World');
select reverse (E_dept) as reverse from combinedemployee;
select concat('Row',reverse('row')) as palindrome ;  -- Palindrome 
select concat (E_name,reverse(E_name)) as palindrome from combinedemployee;

/* Char_length */

select Char_length ('Hey, Harshada') as length ;
select char_length (E_name) as length , E_name from combinedemployee;
select concat(E_name , ' has ',char_length(E_name),' characters ') as name from combinedemployee;

/* UPPER / LOWER */

select upper ('HEllO WorLd');
select lower('HeY BudDy') as lower ;
select upper(E_name) as capital from combinedemployee;
select lower(E_dept) as capital from combinedemployee;
select concat('My name is ',upper(E_name),' and I am working in ', lower(E_dept),' department.') as intro from combinedemployee;

/* CHALLENGES */

select reverse(upper("Why does my cat look at me with such hatred ?")) as revup;
select replace(concat('I',' ','love',' ','cats'),' ','-') as repconc ;
select replace (E_name, ' ', '->') as replaced from combinedemployee;
select E_dept as forward, reverse(E_dept) as backward from combinedemployee;
select upper(concat(E_name,' ',E_dept)) as fullname from combinedemployee; 
select concat('I am ',E_name,' working in ',E_dept,' department having ',E_salary,' salary ') as introduction FROM combinedemployee;
select E_name,char_length(E_name) as 'charcount' from combinedemployee;
select concat(substring(E_name,1,7),'...') as name,concat('Salary is ',E_salary,' in ',upper(E_dept),' department ') as profession ,concat(E_age,' years old living at ',concat(substr(E_address,1,10),'...')) as personaldetails,E_phone from combinedemployee;
