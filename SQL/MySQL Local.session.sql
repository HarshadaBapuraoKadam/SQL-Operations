select reverse(upper("Why does my cat look at me with such hatred ?")) as revup;
select replace(concat('I',' ','love',' ','cats'),' ','-') as repconc ;
select replace (E_name, ' ', '->') as replaced from combinedemployee;
select E_dept as forward, reverse(E_dept) as backward from combinedemployee;
select upper(concat(E_name,' ',E_dept)) as fullname from combinedemployee; 
select concat('I am ',E_name,' working in ',E_dept,' department having ',E_salary,' salary ') as introduction FROM combinedemployee;
select E_name,char_length(E_name) as 'charcount' from combinedemployee;
select concat(substring(E_name,1,7),'...') as name,concat('Salary is ',E_salary,' in ',upper(E_dept),' department ') as profession ,concat(E_age,' years old living at ',concat(substr(E_address,1,10),'...')) as personaldetails,E_phone from combinedemployee;