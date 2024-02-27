{% snapshot trf_shipments_snapshot %}

{{  config 
    (
    unique_key = "ORDERID||'-'||LINENO",

    strategy='timestamp',
    updated_at='SHIPMENTDATE',)
}}

select c.* from  {{ ref("stg_shipments") }} c
--inner join  {{ ref("shippers")}} d on c.SHIPPERID=d.divisionid

{% endsnapshot %}