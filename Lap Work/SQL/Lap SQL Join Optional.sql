-- 1. Write a query to display for each store its store ID, city, and country.
select s.store_id, ci.city, co.country from country as co
inner join city as ci
on ci.country_id = co.country_id
inner join address as a
on ci.city_id = a.city_id
inner join store as s
on a.address_id = s.address_id

-- 2. Write a query to display how much business, in dollars, each store brought in.
select s.store_id, sum(p.amount) as business from payment as p
inner join staff as st
on p.staff_id = st.staff_id
inner join store as s
on s.store_id = st.store_id
group by s.store_id

-- 3. What is the average running time(length) of films by category?
select c.name, avg(f.length) as avg_run from category as c
inner join film_category as fc
on c.category_id = fc.category_id
inner join film as f
on f.film_id = fc.film_id
group by c.name

-- 4 Which film categories are longest(length)? (Hint: You can rely on question 3 output.)
select c.name, avg(f.length) as avg_run from category as c
inner join film_category as fc
on c.category_id = fc.category_id
inner join film as f
on f.film_id = fc.film_id
group by c.name
order by avg_run desc limit 1

-- 5 Display the most frequently(number of times) rented movies in descending order.
select f.title, count(r.rental_id) as num_rent from rental as r
inner join inventory as i
on r.inventory_id = i.inventory_id
inner join film as f 
on i.film_id = f.film_id
group by f.film_id
order by num_rent desc

-- 6 List the top five genres in gross revenue in descending order.
select c.name from payment as p
inner join customer as co
on co.customer_id = p.customer_id
inner join inventory as i
on co.store_id = i.store_id
inner join film_category as fc
on i.film_id = fc.film_id
inner join category as c
on c.category_id = fc.category_id
group by c.category_id
order by sum(p.amount) desc limit 5


-- 7 Is "Academy Dinosaur" available for rent from Store 1?
select f.title, i.store_id from store as s
inner join inventory as i
on s.store_id = i.store_id
inner join film as f
on i.film_id = f.film_id
where f.title = "Academy Dinosaur" and i.store_id = "1"
