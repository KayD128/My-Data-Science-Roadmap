# What is the monthly revenue trend over the past year?
select orders.order_id, orders.order_date, round(sum(order_items.list_price - (order_items.list_price * order_items.discount)), 2) from orders
join order_items on orders.order_id=order_items.order_id WHERE year(orders.order_date) = 2016 group by orders.order_id;

# What is the average discount per product category across all orders?
select products.product_name, products.category_id, order_items.product_id, round(avg(order_items.discount), 3) 
from order_items left join products on order_items.product_id=products.product_id
group by order_items.product_id;

# What is the average discount per product category across all orders?
select order_items.product_id, products.product_name, avg(discount) as Average_disc from order_items
left join products on order_items.product_id=products.product_id group by product_id order by product_id asc; 

# Which customers live in the state of California?
select customer_id, first_name, last_name, state from customers where state = 'CA';

# Which 5 customers have spent the most overall?
select orders.customer_id, customers.first_name, customers.last_name, round(sum(order_items.list_price), 2) as 'amount spent' 
from order_items 
join orders on order_items.order_id=orders.order_id 
join customers on orders.customer_id=customers.customer_id group by orders.customer_id 
order by round(sum(order_items.list_price), 2) desc 
limit 5;

# What are the names and prices of all products in the "Electronics" category?
select product_name, list_price from products where category_id=5;

# Which store has the highest quantity of products in stock and what is that total quantity?
select stocks.store_id, sum(quantity) as total_quantity, stores.store_name from stocks left join stores
on stocks.store_id=stores.store_id group by store_id order by total_quantity desc limit 1;

# How many orders has each staff member handled?
select count(order_id), orders.staff_id, first_name, last_name from orders left join staffs
on orders.staff_id=staffs.staff_id group by orders.staff_id;

# Which staff member has processed the most orders?
select orders.staff_id, staffs.first_name, staffs.last_name, count(orders.staff_id) as 'No of orders' 
from orders left join staffs on orders.staff_id=staffs.staff_id group by staff_id order by count(orders.staff_id) desc;

# What is the total revenue generated from each product (based on order_items)?
select order_items.product_id, products.product_name, round(sum(order_items.list_price - (order_items.list_price * order_items.discount)), 2) as 'revenue' 
from order_items left join products on order_items.product_id=products.product_id group by product_id
order by product_id asc;