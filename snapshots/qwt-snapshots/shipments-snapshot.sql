{% snapshot trf_shipments_snapshot %}

{{  config 
    (target_database='qwt',
    target_schema = 'snapshots',
    unique_key = "ORDERID||'-'||LINENO",

    strategy='timestamp',
    updated_at='SHIPMENTDATE',)
}}

select c.* from  {{ ref("stg_shipments") }} c
--inner join  {{ ref("shippers")}} d on c.SHIPPERID=d.divisionid

{% endsnapshot %}