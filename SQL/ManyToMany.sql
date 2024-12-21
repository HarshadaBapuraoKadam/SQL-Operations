CREATE TABLE Reviewers (
    ID int auto_increment primary key,
    first_name varchar(100),
    last_name varchar(100)
);

CREATE TABLE Series (
    ID int auto_increment primary key,
    Title varchar(100),
    released_year year(4),
    Genre varchar(100)
);

CREATE TABLE Reviews (
    ID int auto_increment primary key,
    rating decimal(2,1),
    Reviewers_id int,
    Series_id int,
    FOREIGN KEY (Reviewers_id) references Reviewers(ID),
    FOREIGN KEY (Series_id) references Series(ID)
);

INSERT INTO series (title, released_year, genre) VALUES
('Archer', 2009, 'Animation'),
('Arrested Development', 2003, 'Comedy'),
("Bob's Burgers", 2011, 'Animation'),
('Bojack Horseman', 2014, 'Animation'),
("Breaking Bad", 2008, 'Drama'),
('Curb Your Enthusiasm', 2000, 'Comedy'),
("Fargo", 2014, 'Drama'),
('Freaks and Geeks', 1999, 'Comedy'),
('General Hospital', 1963, 'Drama'),
('Halt and Catch Fire', 2014, 'Drama'),
('Malcolm In The Middle', 2000, 'Comedy'),
('Pushing Daisies', 2007, 'Comedy'),
('Seinfeld', 1989, 'Comedy'),
('Stranger Things', 2016, 'Drama');

INSERT INTO reviewers (first_name, last_name) VALUES
('Thomas', 'Stoneman'),
('Wyatt', 'Skaggs'),
('Kimbra', 'Masters'),
('Domingo', 'Cortes'),
('Colt', 'Steele'),
('Pinkie', 'Petit'),
('Marlon', 'Crafford');

INSERT INTO Reviews (Series_id, Reviewers_id, rating) VALUES
(1,1,8.0), (1,2,7.5), (1,3,8.5), (1,4,7.7), (1,5,8.9),
(2,1,8.1), (2,4,6.0), (2,3,8.0), (2,6,8.4),(2,5,9.9), (3,1,7.0), 
(3,6,7.5), (3,4,8.0), (3,3,7.1), (3,5,8.0), (4,1,7.5), (4,3,7.8),
(4,4,8.3), (4,2,7.6), (4,5,8.5), (5,1,9.5), (5,3,9.0), (5,4,9.1),
(5,2,9.3), (5,5,9.9), (6,2,6.5), (6,3,7.8), (6,4,8.8), (6,2,8.4), 
(6,5,9.1), (7,2,9.1), (7,5,9.7), (8,4,8.5), (8,2,7.8), (8,6,8.8), 
(8,5,9.3), (9,2,5.5), (9,3,6.8), (9,4,5.8), (9,6,4.3), (9,5,4.5), 
(10,5,9.9), (13,3,8.0), (13,4,7.2), (14,2,8.5), (14,3,8.9), (14,4,8.9);

/* CHALLENGES */

SELECT Title, rating from series inner join Reviews ON series.ID = Reviews.Series_id;

SELECT Title, avg(rating) as avg_rating from series inner join Reviews ON series.ID = Reviews.Series_id group by title ORDER BY avg_rating ASC;

SELECT first_name, last_name, rating FROM reviewers JOIN Reviews ON Reviewers.ID = Reviews.Reviewers_id;

SELECT title as unreviewed_series from series LEFT JOIN Reviews ON series.ID = Reviews.Series_id where rating is null;

SELECT genre, avg(rating) as avg_rating from series join Reviews ON series.ID = Reviews.Series_id group by genre;

SELECT first_name, last_name, count(concat(first_name, ' ', last_name)) as count, ifnull(min(rating), 0) as MIN, ifnull(max(rating), 0) as MAX , ifnull(avg(rating), 0) as AVG, 
    CASE WHEN avg(rating) is null THEN 'INACTIVE'
    ELSE 'ACTIVE'
    END as Status
from Reviewers left join Reviews on Reviewers.ID = Reviews.Reviewers_id GROUP BY first_name, last_name;

SELECT first_name, last_name, count(concat(first_name, ' ', last_name)) as count, ifnull(min(rating), 0) as MIN, ifnull(max(rating), 0) as MAX , ifnull(avg(rating), 0) as AVG, 
    if (count(rating)>0, 'ACTIVE', 'INACTIVE') as Status
from Reviewers left join Reviewers.ID = Reviews.Reviewers_id GROUP BY reviewers.id;

SELECT Title, rating, concat(first_name, ' ', last_name) as Reviwer from series JOIN reviewers JOIN reviews on series.ID = Reviews.Series_id and Reviewers.ID = Reviews.Reviewers_id order by title;

SELECT Title, rating, concat(first_name, ' ', last_name) as Reviwer 
    from reviewers join Reviews on Reviewers.ID = Reviews.Reviewers_id
    JOIN series ON series.ID = Reviews.Series_id
    ORDER BY title;