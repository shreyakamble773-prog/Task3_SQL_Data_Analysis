Task 3: SQL for Data Analysis Dataset: olist_customers_dataset.
(All queries are ready for submission)


1.Show first 10 customers
SELECT * 
FROM olist_customers_dataset
LIMIT 10;


2.Show customer_id and customer_city (first 10 rows)
SELECT customer_id, customer_city
FROM olist_customers_dataset
LIMIT 10;


3.Customers in Sao Paulo
SELECT customer_id, customer_unique_id, customer_city, customer_state
FROM olist_customers_dataset
WHERE customer_city = 'Sao Paulo';


4.Customers ordered by city (ascending)
SELECT customer_id, customer_unique_id, customer_city, customer_state
FROM olist_customers_dataset
ORDER BY customer_city ASC;


5.Total customers per state
SELECT customer_state, COUNT(customer_id) AS total_customers
FROM olist_customers_dataset
GROUP BY customer_state;


6.Total customers per state
SELECT customer_unique_id
FROM olist_customers_dataset
WHERE customer_id IN 
(
    SELECT customer_id
    FROM olist_customers_dataset
    GROUP BY customer_id
    HAVING COUNT(*) > 1);
	

7.Total number of customers
SELECT COUNT(customer_id) AS total_customers
FROM olist_customers_dataset;


8.Total unique customers
SELECT COUNT(DISTINCT customer_unique_id) AS unique_customers
FROM olist_customers_dataset;


9.Total customers per state (descending order)
SELECT customer_state, COUNT(customer_id) AS total_customers
FROM olist_customers_dataset
GROUP BY customer_state
ORDER BY total_customers DESC;


10.Total customers per city (descending order)
SELECT customer_city, COUNT(customer_id) AS total_customers
FROM olist_customers_dataset
GROUP BY customer_city
ORDER BY total_customers DESC;


11.Self join: Customers living in the same city
SELECT a.customer_id AS customer1, b.customer_id AS customer2, a.customer_city
FROM olist_customers_dataset AS a
INNER JOIN olist_customers_dataset AS b
ON a.customer_city = b.customer_city
WHERE a.customer_id <> b.customer_id;


12.Query from the view: state-wise customer count
SELECT * 
FROM view_state_customers;