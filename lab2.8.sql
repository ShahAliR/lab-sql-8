
-- Lab | SQL Join (Part II)   -- In this lab, you will be using the Sakila database of movie rentals.

-- 1.Write a query to display for each store its store ID, city, and country.
 
 
SELECT s.store_id, co.country_id, c.city
FROM sakila.store s
INNER JOIN sakila.address a
ON a.address_id = s.address_id
INNER JOIN sakila.city c 
ON a.city_id = c.city_id
INNER JOIN  sakila.country co
ON co.country_id = c.country_id;

 
 
-- 2.Write a query to display how much business, in dollars, each store brought in.


SELECT st.store_id, SUM(p.amount) AS 'Revenue'
FROM sakila.staff st
JOIN sakila.payment p
USING (staff_id)
GROUP BY st.store_id;
 

-- 3.Which film categories are longest?


SELECT fc.category_id, MAX(f.length) 
FROM sakila.film f
JOIN sakila.film_category fc
USING (film_id)
GROUP BY category_id
ORDER BY MAX(f.length) DESC;
-- 4.Display the most frequently rented movies in descending order.

select f.title, count(*) as frequency
from sakila.rental r
join sakila.inventory i
using(inventory_id)
join sakila.film f
using (film_id)
group by f.title
order by frequency desc;


-- 5.List the top five genres in gross revenue in descending order.
-- This is a complex query which took a long time to complete. Therfore i had to increase the connection timeout.

SELECT fc.category_id, SUM(p.amount)
FROM sakila.payment p
JOIN sakila.staff st
USING (staff_id)
join sakila.store s
using (store_id)
join sakila.inventory i
using (store_id)
join sakila.film_category fc
using (film_id)
GROUP BY category_id
ORDER BY sum(p.amount) DESC
limit 5;

-- 6.Is "Academy Dinosaur" available for rent from Store 1?

select* from sakila.rental;
select* from sakila.inventory;
select i.film_id, i.store_id, r.rental_date, r.return_date
from sakila.rental r
join sakila.inventory i
using (inventory_id)
Where i.film_id =1 and store_id = 1;

-- 7.Get all pairs of actors that worked together.
 