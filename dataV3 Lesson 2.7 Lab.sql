-- Instructions
USE sakila;


-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT 
    film.film_id,
    film.title,
    film_category.category_id,
    category.name
FROM
    film
        INNER JOIN
    film_category ON film.film_id = film_category.film_id
        INNER JOIN
    category ON film_category.category_id = category.category_id
ORDER BY film_id ASC;



-- Display the total amount rung up by each staff member in August of 2005.
	SELECT CONCAT(s.first_name,' ',s.last_name) AS 'Staff Member', sum(p.amount) AS 'Total Amount'
	FROM payment AS p
	JOIN staff AS s
	ON p.staff_id = s.staff_id
	WHERE payment_date LIKE '2005-08%'
	GROUP BY p.staff_id;



-- Which actor has appeared in the most films?
SELECT 
    a.last_name, COUNT(*) AS cnt
FROM
    actor a
        JOIN
    film_actor m ON a.actor_id = m.actor_id
GROUP BY a.actor_id , a.last_name
ORDER BY COUNT(*) DESC; 



-- Most active customer (the customer that has rented the most number of films)
SELECT 
    cust.customer_id, last_name, COUNT(*) AS Total_Rentals
FROM
    rental AS r
        INNER JOIN
    customer AS cust ON r.customer_id = cust.customer_id
GROUP BY clust.customer_id , last_name
ORDER BY Total_Rentals DESC;



-- Display the first and last names, as well as the address, of each staff member.
SELECT CONCAT(s.first_name,' ',s.last_name) AS 'Staff Member',



-- List each film and the number of actors who are listed for that film.



-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

