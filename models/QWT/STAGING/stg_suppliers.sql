{{config(materialized='table') }}

select *
from QWT.RAW.suppliers_xml
