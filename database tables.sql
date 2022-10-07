create database paymentbillsystem;
use paymentbillsystem;
create table admin(
username varchar(20),
password varchar(20),
name varchar(30)
);
create table accountant(
branch varchar(20),
username varchar(30) primary key,
password varchar(30),
date_of_joining varchar(10),
date_of_birth varchar(10),
salary varchar(20)
);
create table student(
id varchar(10) primary key,
name varchar(30),
course varchar(15),
mobile varchar(15),
fathers_name varchar(30),
mothers_name varchar(30),
date_of_birth varchar(10),
date_of_join varchar(10),
paid varchar(10),
fee varchar(10),
balance varchar(15),
address varchar(40)
);
create table feeTable(
course varchar(20),
fee varchar(20));
insert into feeTable values('MCA','220000');
insert into feeTable values('MBA','250000');

insert into admin values('admin','system','Admin');