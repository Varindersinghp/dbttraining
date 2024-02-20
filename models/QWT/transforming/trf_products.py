#import snowflake.snowpark.functions as if

def product_profit(x,y):
    return x-y

def model(dbt, session):
    dbt.config(materialized = "table", schema="transforming")
    product_df = dbt.ref("stg_products")

    product_df = product_df.withColumn("Profit",product_profit(product_df.UNITPRICE,product_df.UNITCOST))
   # product_df = product_df.withColumn("ProductAvailabilty",if (product_df.UNITPRICEUNITSINSTOCK>product_df.UNITSONORDER): "yes" else: "No"

    return product_df