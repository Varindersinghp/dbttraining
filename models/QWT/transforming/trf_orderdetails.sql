{{config(materialized='table' , schema='transforming' )}}

select od.* ,
(od.UnitPrice * od.Quantity) * (1-od.Discount) as  LineSalesAmount,
(p.UnitCost * od.Quantity) as CostOfGoodsSold,
((od.UnitPrice * od.Quantity) * (1-od.Discount)) - (p.UnitCost * od.Quantity) as Margin
from {{ ref("stg_orderdetails")}} od
inner join {{ ref("stg_products")}} p on od.productid=p.productid




