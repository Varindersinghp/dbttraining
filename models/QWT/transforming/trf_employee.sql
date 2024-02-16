{{config(materialized='table' , schema='transforming' )}}


select a.EMPID,a.FIRSTNAME,a.LASTNAME,a.TITLE,a.HIREDATE, concat(c.FIRSTNAME,'',c.LASTNAME) as MangerName
,a.YEARSALARY,b.officecity
from {{ref("stg_employee")}} a
join {{ref("stg_employee")}} c on a.reportsto=c.empid
inner join {{ref("stg_offices")}} b on b.office=a.office
  

