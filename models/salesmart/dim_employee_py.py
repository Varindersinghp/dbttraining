def model(dbt, session):

    dbt.config(materialized = "table", schema="salesmart", alias="dim_employee")

    my_employee_df = dbt.ref("trf_employee")
    
    return my_employee_df