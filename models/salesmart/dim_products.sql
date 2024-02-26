{{config(materialized='view' , schema=env_var('DBT_SALESMARTDB','SALESMART') )}}

select 
d.PRODUCTID,d.PRODUCTNAME,d.QUANTITYPERUNIT,d.UNITCOST,d.UNITPRICE,d.UNITSINSTOCK,d.UNITSONORDER,
--d.PRODUCTAVAILABILITY,
d.PROFIT,
c.CATEGORYNAME,e.SUPPLIERID,e.COMPANYNAME,e.ADDRESS,e.CITY,e.COUNTRY
from 
{{ ref("categories")}} c
inner join  {{ ref("trf_products")}} d on c.CATEGORYID=d.CATEGORYID
inner join {{ ref("trf_suppliers")}} e on e.SUPPLIERID=d.SUPPLIERID