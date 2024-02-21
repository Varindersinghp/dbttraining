{{config(materialized='incremental', unique_key=['OrderID','LINENO'] )}}

select distinct a.* from {{ ref("stg_orders")}} b 
inner join qwt.raw.orderdetails a on a.orderid=b.orderid

   {% if is_incremental() %}

  -- new
  -- this filter will only be applied on an incremental run
  where OrderDate >= (select max(OrderDate) from {{ ref("stg_orders")}})

{% endif %}
 

