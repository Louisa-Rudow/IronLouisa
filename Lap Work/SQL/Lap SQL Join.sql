-- Which actor has appeared in the most films?

use sakila;

select a.first_name, a.last_name, count(f.film_id) as number_of_films from actor as a
inner join film_actor as f 
on a.actor_id = f.actor_id
group by a.actor_id
order by number_of_films Desc 
limit 1

-- Most active customer (the customer that has rented the most number of films)
select c.first_name, c.last_name, count(r.rental_id) as num_rental from customer as c
inner join rental as r 
on c.customer_id = r.customer_id
group by c.customer_id
order by num_rental Desc 
limit 1

-- List number of films per category.
select c.name, count(f.film_id) as num_rental from category as c
inner join film_category as f 
on c.category_id = f.category_id
group by c.category_id
order by c.name

-- Display the first and last names, as well as the address, of each staff member.
select s.first_name, s.last_name, a.address, a.district from staff as s
inner join address as a 
on a.address_id = s.address_id

-- 5. Display the total amount rung up by each staff member in August of 2005.
select s.first_name, s.last_name, sum(p.amount) as total_amount from staff as s
inner join payment as p
on p.staff_id = s.staff_id
where payment_date like "2005_08%"
group by s.staff_id

-- 6. List each film and the number of actors who are listed for that film.
select f.title, count(fa.actor_id) as number_of_actors from film as f
inner join film_actor as fa
on f.film_id = fa.film_id
group by f.film_id

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name. Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.
select c.last_name, c.first_name, sum(p.amount) as total_paid from customer as c
inner join payment as p
on c.customer_id = p.customer_id
group by p.customer_id
order by c.last_name

-- Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement
select f.title from rental as r
inner join inventory as i
on r.inventory_id = i.inventory_id
inner join film as f 
on i.film_id = f.film_id
group by f.film_id
order by  count(r.rental_id) desc limit 1
