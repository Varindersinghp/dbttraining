{{config(materialized='table' , schema=env_var('DBT_TRANSFORMDB','TRANSFORMING') )}}

select 
orderid,
orderdate,
month(orderdate) as ordermonth,
year(orderdate) as orderyear,
CustomerID,
employeeid,
shipperid,
freight
  from {{ref("stg_orders")}}