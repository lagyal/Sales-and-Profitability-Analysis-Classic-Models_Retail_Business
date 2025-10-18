create or replace view sales_data_for_power_bi as

select 
orderDate,
ord.orderNumber,
p.productName,
p.productLine,
cu.customerName,
cu.country as customer_country,
o.country as office_country,
buyPrice,
priceEach,
quantityOrdered,
quantityOrdered * priceEach as sales_value,
quantityOrdered * buyPrice as cost_of_sales
from orders ord
inner join orderdetails orddet
on ord.orderNumber = orddet.orderNumber
inner join customers cu
on ord.customerNumber = cu.customerNumber
inner join products p
on orddet.productCode = p.productCode
inner join employees emp
on cu.salesRepEmployeeNumber = emp.employeeNumber
inner join offices o
on emp.officeCode = o.officeCode