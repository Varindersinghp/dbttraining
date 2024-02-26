import snowflake.snowpark.functions as F

def model(dbt, session):

    dbt.config(materialized = "incremental")

    # Getting Source Name from Source File - dbsources.yml
    df = dbt.source("raw_qwt", "orders")
    
    if dbt.is_incremental:

        # only new rows compared to max in current table
        max_from_this = f"select max(orderdate) from {dbt.this}"
        df = df.filter(df.orderdate >= session.sql(max_from_this).collect()[0][0])

        # or only rows from the past 3 days
        #df = df.filter(df.orderdate >= F.dateadd("day", F.lit(-3), F.current_timestamp()))

    return df