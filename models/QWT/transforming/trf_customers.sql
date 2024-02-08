{{config(materialized='table' , schema='transforming' , sql_header='use warehouse DBT;')}}

select CustomerID,  CompanyName ,ContactName ,City ,Country ,DivisionID ,Address ,Fax ,
Phone ,PostalCode , -- NVL(StateProvince,'NA') as StateProvince_2,
case when StateProvince is null or StateProvince=''
 then 'NA' else StateProvince end StateProvince  from {{ref("stg_customers")}}

