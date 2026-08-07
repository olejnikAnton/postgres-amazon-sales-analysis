select count(*),
count(*) - count(a."CustomerID"),
count(*) - count(a."OrderID"),
count(*) - count(a."ProductID"),
count(*) - count(a."SellerID")
from amazon a; 

select * from amazon a limit 10;

select min(a."OrderDate"), max(a."OrderDate" ) from amazon a;

select a."OrderID",
a."ProductID",
count(a."OrderID") as Duplicate
from amazon a
group by a."OrderID", a."ProductID" 
having Count(*)>1;

select a."OrderID" 
from amazon a
where a."Quantity" <=0 or
a."UnitPrice"<=0 or
a."Discount" <0 or a."Discount" >= 100;

select a."OrderStatus",
count(a."OrderStatus" ) as Count_Status
from amazon a
group by a."OrderStatus"
order by a."OrderStatus" desc;

