-- schema


drop database if exists dealership;

create database dealership;
use dealership;

create table dealerships (
	dealership_id int auto_increment primary key not null,
	name varchar(50) not null,
	address varchar(50) not null,
	phone varchar(50) not null
);

create table vehicles (
	VIN varchar(17) primary key not null, 
    year int not null, 
    make varchar(25) not null,
    model varchar(50) not null,
    color varchar(25),
    mileage int not null, 
    SOLD bool not null default 0
);

create table inventory (
	stock_number int primary key auto_increment not null, 
    dealership_id int, 
    VIN varchar(17) not null,
    foreign key (dealership_id) references dealerships (dealership_id),
	foreign key (VIN) references vehicles (VIN)
);

create table customers (
	customer_id int primary key auto_increment not null,
    name varchar(50) not null,
    address varchar(50) not null,
    phone_number varchar(50) not null
);

create table sales_contracts (
	contract_number int primary key auto_increment not null,
    VIN varchar(17) not null,
    customer_id int,
    financing bool not null default 0,
    monthly_payments float,
    sale_date int not null, -- format as (yyyymmdd)
    foreign key (VIN) references vehicles (VIN),
    foreign key (customer_id) references customers (customer_id)
);

create table lease_contracts (
	contract_number int primary key auto_increment not null,
    VIN varchar(17) not null,
    customer_id int,
    monthly_payment float not null,
    lease_start_date int not null, -- format as (yyyymmdd)
    lease_end_date int not null, -- format as (yyyymmdd)
    foreign key (VIN) references vehicles (VIN),
    foreign key (customer_id) references customers (customer_id)
);

-- data


insert into dealerships (name, address, phone) values
('AutoHub Central', '123 Main St', '555-123-4567'),
('Speedy Motors', '456 Elm St', '555-234-5678'),
('City Cars', '789 Oak Ave', '555-345-6789');


insert into vehicles (VIN, year, make, model, color, mileage, SOLD) values
('1HGCM82633A004352', 2021, 'Honda', 'Civic', 'Blue', 15000, 0),
('1FAFP4041WF192837', 2022, 'Ford', 'Mustang', 'Red', 5000, 1),
('2T1BURHE0FC123456', 2020, 'Toyota', 'Corolla', 'White', 30000, 0),
('1N4AL3AP9JC567890', 2023, 'Nissan', 'Altima', 'Black', 2000, 1),
('WBA8E9G54GNU12345', 2021, 'BMW', '328i', 'Silver', 12000, 0);


insert into inventory (dealership_id, VIN) values
(1, '1HGCM82633A004352'),
(2, '1FAFP4041WF192837'),
(1, '2T1BURHE0FC123456'),
(3, '1N4AL3AP9JC567890'),
(2, 'WBA8E9G54GNU12345');


insert into customers (name, address, phone_number) values
('Alice Johnson', '100 River Rd', '555-111-2222'),
('Bob Smith', '200 Pine St', '555-222-3333'),
('Carol White', '300 Maple Ave', '555-333-4444');


insert into sales_contracts (VIN, customer_id, financing, monthly_payments, sale_date) values
('1FAFP4041WF192837', 1, 1, 350.00, 20250315),
('1N4AL3AP9JC567890', 2, 0, NULL, 20250601);


insert into lease_contracts (VIN, customer_id, monthly_payment, lease_start_date, lease_end_date) values
('WBA8E9G54GNU12345', 3, 499.99, 20250420, 20280420);
