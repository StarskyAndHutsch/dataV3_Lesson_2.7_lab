USE sakila;

-- Lab | SQL Join (Part I)

-- In this lab, you will be using the Sakila database of movie rentals.

-- Instructions

-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
-- Display the total amount rung up by each staff member in August of 2005.
-- Which actor has appeared in the most films?
-- Most active customer (the customer that has rented the most number of films)
-- Display the first and last names, as well as the address, of each staff member.
-- List each film and the number of actors who are listed for that film.
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
-- List number of films per category.

-- 1. In the action category there are 64 films, Animation 66 and so on
SELECT 
    c.name, COUNT(DISTINCT (fc.film_id))
FROM
    sakila.film_category fc
        JOIN
    sakila.category c ON fc.category_id = c.category_id
GROUP BY c.name;

-- 2. Mike has rung up 33489,47 dollars and Jon has rung up 33927,04 dollars
SELECT 
    s.first_name, SUM(p.amount) AS 'total_payment'
FROM
    sakila.staff s
        JOIN
    sakila.payment p ON s.staff_id = p.staff_id
GROUP BY s.first_name;

-- 3. Susan Davis has appeared in the most films
SELECT 
    a.first_name, a.last_name, COUNT(DISTINCT (fa.film_id))
FROM
    sakila.film_actor fa
        JOIN
    sakila.actor a ON fa.actor_id = a.actor_id
GROUP BY a.first_name , a.last_name
ORDER BY COUNT(fa.film_id) DESC;

-- 4. Eleanor Hunt is the most active customer 
SELECT 
    c.first_name, c.last_name, COUNT(rental_id)
FROM
    sakila.rental r
        JOIN
    sakila.customer c ON r.customer_id = c.customer_id
GROUP BY c.first_name , c.last_name
ORDER BY COUNT(rental_id) DESC;

-- 5. Mike Hillyer lives on 23 Workhaven Lane and Jon Stephens lives on 1411 Lillydale Drive
SELECT 
    s.first_name, s.last_name, a.address
FROM
    sakila.staff s
        JOIN
    sakila.address a ON s.address_id = a.address_id
GROUP BY s.first_name , s.last_name , a.address;

-- 6. Lambs Cincinatti has the most actors with 15, second comes Boondock Ballroom with 13 actors and so on
SELECT 
    f.title, COUNT(fa.actor_id)
FROM
    sakila.film f
        JOIN
    sakila.film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY COUNT(fa.actor_id) DESC;

-- 7. The first on in the list: Rafael Abeney paid a total of 97,79 dollars. Second Nathaniel Adam paid 133,72 dollars.
SELECT 
    c.first_name, c.last_name, SUM(p.amount) AS 'total_payment'
FROM
    sakila.payment p
        JOIN
    sakila.customer c ON p.customer_id = c.customer_id
GROUP BY c.first_name , c.last_name
ORDER BY c.last_name ASC;

-- 8. In the action category there are 64 films, Animation 66 and so on (I think this is the same question as 1)
SELECT 
    c.name, COUNT(DISTINCT (fc.film_id))
FROM
    sakila.film_category fc
        JOIN
    sakila.category c ON fc.category_id = c.category_id
GROUP BY c.name;