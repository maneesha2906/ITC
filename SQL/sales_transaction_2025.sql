create database sales;

use sales;
create table orders
(
orderId int not null,
orderDate date,
shippedDate date,
productName varchar (100),
statusDelivery varchar (50),
quanity int,
priceOfProduct int,
primary key(orderId)
);

alter table orders
modify column orderId varchar(25);

alter table orders
rename column quanity to quantity;

# Insert into sales table
insert into orders
(orderId, orderDate, shippedDate, productName, statusDelivery, quantity, priceOfProduct)
values
('0001','2025-02-11','2025-03-10','Honda crv', 'delivered', 2, 20000),
('0002','2025-04-09','2025-05-14','Mercedes Benz', 'delivered', 7, 100000),
('0003','2025-03-02','2025-04-08','Toyota Rav4', 'delivered', 10, 12000),
('0004','2025-06-22','2025-07-25','Honda Accord', 'delivered', 12, 38000),
('0005','2025-06-28','2025-07-10','Audi', 'delivered', 15, 24000),
('0006','2025-07-17','2025-08-10','Ferrari', 'delivered', 22, 220000),
('0007','2025-09-04','2025-10-10','Lambo', 'delivered', 30, 210000),
('0008','2025-02-26','2025-03-19','Volvo X90', 'delivered', 25, 18000),
('0009','2025-01-25','2025-02-26','Escalade', 'delivered', 15, 72000),
('0010','2025-01-19','2025-02-25','Buick', 'delivered', 40, 50000);

select * from orders;

use sales;
create table customers
(
customerId int auto_increment primary key not null,
orderId varchar (25) not null,
phoneNumber varchar (20),
customerName varchar (100) not null,
address varchar (250)
# primary key(customerId)
);

drop table customers;

# Insert into customer table
insert into customers
(orderId, phoneNumber, customerName, address)
values
('0001', '+4438998777', 'Abdul Wahib', '3, Brownville Springfield'),
('0002', '+4474567899', 'Caleb Idris', '67, Old Street, Wales'),
('0003', '+4498765400', 'Aaron Kelvin', '64B, Crenshaw Bould '),
('0004', '+4415554325', 'Esther Lobara', '45, woodrange Road, Stratford'),
('0005', '+443090983', 'Winston Churchill', '703, Arrowhill Meadow, London'),
('0006', '+4400220180', 'Elizabteth Beatrice', '55, Wesham Ave, London'),
('0007', '+4490000932', 'John Mark', '3, Notting Hill Villa, Notting Hill Gate'),
('0008', '+4480038871', 'Kingsley John', '8, Gulliam Road, Victoria'),
('0009', '+4498765540', 'Nathan Bulliak', '14, Arsenal Street'),
('0010', '+4987667602', 'Freddy Marshall', '10, Leicester Square, London');

select * from customers;
truncate table customers;

# TYPES OF JOINS - EXAMPLES
/* INNER JOIN*/

select * from customers as c inner join orders as o
on c.orderId = o.orderId;

select c.customerId, c.orderId, o.orderDate, o.shippedDate, o.productName, o.statusDelivery, o.quantity
from orders as o inner join customers as c on o.orderId = c.orderId;

# LEFT JOIN
select c.customerId, c.customerName, productName from customers as c left join orders o
on c.orderId = o.orderId;

# RIGHT JOIN
select o.productName, o.orderDate, o.quantity, o.priceofProduct, phoneNumber from orders as o
right join customers as c on o.orderId = c.orderId;

# FULL JOIN
select c.customerId, c.customerName, productName from customers as c left join orders o
on c.orderId = o.orderId
union
select c.customerId, c.customerName, productName from customers as c right join orders o
on c.orderId = o.orderId;