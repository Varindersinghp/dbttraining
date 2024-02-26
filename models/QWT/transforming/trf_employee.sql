{{config(materialized='table' , schema=env_var('DBT_TRANSFORMDB','TRANSFORMING') )}}


select a.EMPID,a.FIRSTNAME,a.LASTNAME,a.TITLE,a.HIREDATE,
iff(a.reportsto is null,a.FIRSTNAME, concat(c.FIRSTNAME,'',c.LASTNAME)) as MangerName
,a.YEARSALARY,b.officecity
from {{ref("stg_employee")}} a
left join {{ref("stg_employee")}} c on a.reportsto=c.empid
inner join {{ref("stg_offices")}} b on b.office=a.office
  

