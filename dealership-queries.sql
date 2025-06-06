use dealership;

select *
from dealerships;

select *
from vehicles
left join inventory
	on vehicles.VIN = inventory.VIN
where dealership_id = 1;

select *
from vehicles
where VIN = '1HGCM82633A004352';

select dealerships.dealership_id, dealerships.name, dealerships.address, dealerships.phone
from dealerships
join inventory
	on dealerships.dealership_id = inventory.dealership_id
join vehicles
	on inventory.VIN = vehicles.VIN
where vehicles.color = 'Blue' and vehicles.make = 'Honda' and vehicles.model = 'Civic';

select sales_contracts.sale_date, vehicles.VIN, customers.name as 'customer_name', dealerships.name as 'dealership_name'
from sales_contracts
join vehicles
	on sales_contracts.VIN = vehicles.VIN
join customers
	on sales_contracts.customer_id = customers.customer_id
join inventory
	on vehicles.VIN = inventory.VIN
join dealerships
	on inventory.dealership_id = dealerships.dealership_id
where sales_contracts.sale_date like '202506%';