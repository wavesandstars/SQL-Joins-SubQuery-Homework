--1. List all customers who live in Texas (use JOINs)
select first_name, last_name, address.district 
from customer
inner join address
on customer.address_id = address.address_id 
where district = 'Texas'

-- 2. Get all payments above $6.99 with the Customer's Full Name
select first_name, last_name, payment.amount
from customer
inner join payment
on customer.customer_id  = payment.customer_id 
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT  first_name , last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) desc);


-- 4. List all customers that live in Nepal (use the city table)

select *
from address
where city_id IN(
	select city_id
	from city
	WHERE country_id = 66);
		
		

-- 5. Which staff member had the most transactions?

SELECT first_name, last_name
FROM staff
WHERE staff_id IN(
	SELECT staff_id
	FROM payment
	GROUP BY staff_id
	HAVING COUNT(payment_id) > 1
	ORDER BY COUNT(payment_id) desc)
	limit 1;


-- 6. How many movies of each rating are there?

select rating, count(rating)
from film 
group by rating 


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

select first_name, last_name
from customer
where customer_id IN(
	select customer_id
	from payment 
	group by customer_id 
	having count( distinct amount) > 6.99
)

-- 8. How many free rentals did our store give away?
select amount, count(amount)
from payment
group by amount
having amount = 0



