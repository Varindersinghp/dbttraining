{{config(materialized='view' ,  schema=env_var('DBT_REPORTDB','REPORTING') )}}


select a.customerid,a.COMPANYNAME,a.CONTACTNAME,a.CITY,
min(ORDERDATE) as firstorder, max(ORDERDATE) as recentorder,
count(b.QUANTITY) as Totalorders,  sum(b.LINESALESAMOUNT) as Totalsales
from  {{ ref("stg_customers")}} a
inner join {{ ref("fct_orders")}} b on a.customerid=b.customerid
group by 1,2,3,4

