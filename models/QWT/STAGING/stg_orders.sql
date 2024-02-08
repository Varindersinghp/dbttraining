{{config(materialized='incremental', unique_key='OrderID' )}}

select *
   from QWT.RAW.Orders 
   {% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where OrderDate > (select max(OrderDate) from {{ this }})

{% endif %}
 

