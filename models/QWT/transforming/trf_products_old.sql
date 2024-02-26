{{config(materialized='table' , schema='transforming' , sql_header='use warehouse DBT;')}}

select ProductID , ProductName ,SupplierID ,CategoryID ,QuantityPerUnit ,UnitCost,
UnitPrice ,UnitsInStock ,UnitsOnOrder,
case when  (UnitsInStock - UnitsOnOrder)>0 then 'Yes' else 'No' end as productavailability,
 (UnitPrice - UnitCost) as profit
   from {{ref("stg_products")}}

