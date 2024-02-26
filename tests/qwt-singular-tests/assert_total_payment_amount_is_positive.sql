
select ORDERID,sum(LINESALESAMOUNT) as Total_amount
from {{ ref("fct_orders")}}
group by 1 Having not(Total_amount>=0)