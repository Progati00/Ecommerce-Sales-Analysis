create database Ecommerce;

use Ecommerce;

select * from data;

# Extract the year and month from Order_Date for each record

SELECT YEAR(STR_TO_DATE(Order_Date, '%Y-%m-%d')) AS order_year, month(str_to_date(Order_Date, "%Y-%m-%d")) FROM data;


# Calculate the total revenue for all orders using Sales * Quantity
select sum(Sales*Quantity) as Total_Revenue FROM data;


# Find the total revenue by month, sorted by highest revenue first
select month(STR_TO_DATE(Order_Date, '%Y-%m-%d')) AS order_month, sum(Sales*Quantity) as Total_Revenue from data group by order_month
order by Total_Revenue desc;

# Count the number of orders per month for each year, sorted chronologically
SELECT YEAR(STR_TO_DATE(Order_Date, '%Y-%m-%d')) AS order_year, month(str_to_date(Order_Date, "%Y-%m-%d")) as order_month,
COUNT(*) AS order_volume FROM data GROUP BY order_year, order_month ORDER BY order_year, order_month;


# Calculate the total sales, total quantity, avg profit for all orders
select sum(Sales) as Total_Sales, sum(Quantity) as Total_Quantity, round(avg(Profit),2) as Avg_Profit FROM data;


# For each payment method, total sales, average discount, number of products sold, total shipping cost, total customers
select Payment_method, sum(Sales), avg(Discount), count(Product) as Product_count, sum(Shipping_Cost),
count(Customer_Id) as Total_customer
from data group by Payment_method order by sum(Sales);


