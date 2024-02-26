{{config(materialized='view' , schema='salesmart' )}}

select d.*,
c.orderdate,
c.ordermonth,
c.orderyear,
c.CustomerID,
c.employeeid,
c.freight
from 
{{ ref("trf_orders")}} c
inner join  {{ ref("trf_orderdetails")}} d on c.orderid=d.orderid