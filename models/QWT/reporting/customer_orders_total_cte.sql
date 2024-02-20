{{config(materialized='view' , schema='reporting' )}}


with customers as 
(select a.customerid,a.COMPANYNAME,a.CONTACTNAME,a.CITY from {{ref("dim_customers")}} a),

orders as (select ORDERID , customerid,ORDERDATE , LINESALESAMOUNT from {{ ref("fct_orders")}} ),

customer_orders as (
     select a.COMPANYNAME as COMPANYNAME,
     a.CONTACTNAME as CONTACTNAME ,
     a.CITY as city,
    min(b.ORDERDATE) as firstorder_date, 
    max(b.ORDERDATE) as recentorder_date,
    count(b.ORDERID) as Totalorders, 
    sum(b.LINESALESAMOUNT) as Totalsales
    from customers a
    inner join orders b on a.customerid=b.customerid group by 1,2,3 ),
    --select * from customer_orders

    final as (select * from customer_orders)
    select * from final


