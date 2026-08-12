select a."CustomerName", sum(a."TotalAmount") as total_amount, count(distinct a."OrderID")
from amazon a
group by a."CustomerName"
order by total_amount  desc
limit 10;

select a."CustomerID", count(*) as order_count
from amazon a 
group by a."CustomerID"
having count(*)>1;

select a."City", count(distinct a."CustomerID") as customer_count, round(avg(a."TotalAmount")::numeric, 2) as total
from amazon a 
group by a."City"
order by customer_count  desc;

with top_customers as (
    select a."CustomerID"
    from amazon a
    group by a."CustomerID"
    order by sum(a."TotalAmount") desc 
    limit 10
)
select 
    a."Brand", 
    count(*) as purchases_count, 
    sum(a."TotalAmount") as total_spent
from amazon a
where a."CustomerID" in (select "CustomerID" from top_customers)
group by a."Brand"
order by purchases_count desc
limit 1;

select 
    to_char(a."OrderDate"::timestamp, 'day') as "day_name",
    extract(isodow from a."OrderDate"::timestamp) as "day_number",
    count(a."OrderID") as "order_count",
    round(sum(a."TotalAmount")::numeric, 2) as "total_revenue"
from amazon a 
group by "day_name", "day_number"
order by "day_number" asc;
