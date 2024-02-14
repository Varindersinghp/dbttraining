{{config(materialized='view' , schema='reporting' )}}


select 
e.firstname,od.ordermonth,od.orderyear, sum(od.linesalesamount) as totalsales, avg(od.margin) as profit
from {{ ref("stg_employee")}} e
inner join {{ ref("stg_offices")}} o on o.office=e.office
inner join {{ ref("fct_orders")}} od on od.employeeid=e.EMPID
--where o.officecity='Paris'
where o.officecity='{{var('city','Paris')}}'
group by e.firstname,od.ordermonth,od.orderyear order by totalsales desc limit 10


