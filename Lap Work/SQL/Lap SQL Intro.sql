/* 
Review the tables in the database.
Explore tables by selecting all columns from each table or using the in built review features for your client.
Select one column from a table. Get film titles.
Select one column from a table and alias it. Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film, but this is a good time to think about how you might get that information in the future.
5.1 Find out how many stores does the company have?
5.2 Find out how many employees staff does the company have?
5.3 Return a list of employee first names only? */

use sakila; 

-- 1 & 2
select * from actor
select * from address
select * from category
select * from city
select * from country
select * from customer
select * from film
select * from film_actor
select * from film_category
select * from film_text
select * from inventory
select * from language
select * from payment
select * from rental
select * from staff
select * from store

-- 3
select title from film

-- 4
select name as language from language
-- languages: English, Italian, Japanese, Mandarin, French, German

-- 5.1
select store_id from store
-- there are 2 stores

-- 5.2 and 5.3
select staff_id from staff
select * from staff
-- there are 2 staff members named Mike and Jon


