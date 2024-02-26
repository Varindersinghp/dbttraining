{{config(materialized='view' , schema=env_var('DBT_SALESMARTDB','SALESMART') )}}

select 
--c.ORDERID,c.LINENO,c.SHIPPERID,c.PRODUCTID,c.EMPLOYEEID,c.SHIPMENTDATE,c.STATUS,
--c.SCD_ID, c.UPDATED_AT,c.VALID_FROM,c.VALID_TO,
c.ORDERID,c.LINENO,c.SHIPMENTDATE,c.STATUS,c.VALID_FROM,c.VALID_TO,d.COMPANYNAME
from 
{{ ref("trf_shipments_snapshot")}} c
inner join  {{ ref("shippers")}} d on c.SHIPPERID=d.ShipperID