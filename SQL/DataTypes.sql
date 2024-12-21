/* DECIMAL(M,D) */

CREATE TABLE Items (price DECIMAL(5,2));
insert into Items VALUES (254);
insert into Items VALUES (453.37);
insert into Items VALUES (354.999);
insert into Items VALUES (876.546),(745.13);
insert into Items VALUES (8763341);

/* FLOAT & DOUBLE */

CREATE TABLE thing (price float);
insert into thing values (88.80);
insert into thing values (8862.8017);
insert into thing values (88628.81768);
insert into thing values (8862857.881768);

CREATE TABLE things (price double);
insert into things VALUES (832868.348578);
insert into things VALUES (83286862.34857817);
insert into things VALUES (8328686288801787.3485781780);

/* DATE TIME */

CREATE table people (name VARCHAR(100), DOB date, birthtime time, DTOB datetime);
insert INTO people VALUES ('Harshada', '2005-01-14', '06:30:45','2005-01-14 06:30:45' );
insert INTO people VALUES ('Harshal', '2008-09-12', '11:30:35','2008-09-12 11:30:35' );
insert INTO people VALUES ('Vandana', curdate(), curtime(), now());
select * from people;

/* DATE FORMATTING */

select name, day(DOB) from people;
select name, dayname(DOB) from people;
select name, DOB, dayname(DOB) ,date_format(birthtime,'%h') from people;
select name, DOB, dayname(DOB) ,date_format(DTOB,'%d/%m/%y') from people;

/* DATE MATH */

select datediff(now(),DOB) from people;
select DOB, DATE_ADD(DOB, interval 2 month) from people;
select DTOB, DTOB + interval 5 month + interval 7 hour from people;

/* CHALLENGES */

select curtime();
select curdate();
select dayofweek(curdate());
select dayofweek(now());
select date_format(now(), '%w');
select dayname(now());
select date_format(now(), '%W');
select curdate(), curtime();
select date_format(now(), '%m/%d/%Y  %h:%s') as time;
select date_format(now(), '%M %D at %h:%i');
create table tweets (contents varchar(100), username varchar(50), created_at timestamp default now());
insert into tweets (contents, username) values ('My first tweet','harshada63'),('Second content','harshadakadam844');
