{{config(materialized='table') }}

select ORDERID, LINENO, SHIPPERID, CUSTOMERID PRODUCTID, EMPLOYEEID,
--CAST(LEFT(SHIPMENTDATE,10) AS DATE),
cast(split_part(SHIPMENTDATE,' ',1) as DATE) as SHIPMENTDATE,
--LEFT(trim(SHIPMENTDATE),9) as SHIPMENTDATE,
STATUS
from {{env_var('DBT_SOURCEDB','QWT')}}.{{env_var('DBT_SOURCESCHEMA','RAW')}}.shipments
