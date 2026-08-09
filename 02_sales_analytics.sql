select date_trunc('month', a."OrderDate"::timestamp ) as sales_month,
sum(a."TotalAmount") as Total_revenue,
count(distinct a."OrderID") as Unique_orders,
Round(avg(a."TotalAmount"::numeric ), 2) as Avg_revenue
from amazon a 
where a."OrderStatus" = 'Delivered'
group by date_trunc('month', a."OrderDate"::timestamp)
order by sales_month asc;

select a."PaymentMethod" ,
count(a."PaymentMethod") as order_count
from amazon a
group by a."PaymentMethod" 
order by order_count desc limit 1;

select a."PaymentMethod",
sum(a."TotalAmount") as order_revenue
from amazon a
group by a."PaymentMethod"
order by order_revenue desc limit 1;

select a."Brand",
Round(avg(a."Discount")::numeric,2),
sum(a."TotalAmount") as Total_revenue
from amazon a
group by a."Brand" 
order by total_revenue desc limit 10;

select a."Category",
Round(avg(a."UnitPrice")::numeric, 2),
Round(avg(a."ShippingCost")::numeric, 2)
from amazon a
group by a."Category";

select a."City",
sum(a."TotalAmount") as total
from amazon a
group by a."City" 
order by total desc limit 10;

select 
Round(sum(case
	when a."OrderStatus" in ('Cancelled', 'Returned') then 1
	else 0
end)::numeric* 100.0/count(*),2)  AS problematic_orders_pct
from amazon a; 