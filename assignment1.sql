create database test2;
use test2;
create table SalesPeople (Snum int primary key,Sname varchar(30)unique,City varchar(30),Comm int);
insert into SalesPeople (Snum , Sname, City, Comm) values (1001,"Peel","London",12),(1002,"Serres","Sanjose",13),
(1004,"Motika","London",11),(1007,"Rifkin","Barcelona",15),(1003,"Axelrod","Newyork",10);

create table Customers(Cnum int primary key,Cname varchar(20),City varchar(20)not null,Snum int,foreign key(Snum) 
references SalesPeople(Snum));
insert into Customers(Cnum,Cname,City,Snum) values (2001,"Hoffman","London",1001),(2002,"Giovanni","Rome",1003),
(2003,"Liu","Sanjose",1002),(2004,"Grass","Berlin",1002),(2006,"Clemens","London",1001),(2008,"Cisneros","Sanjose",1007),
(2007,"Pereira","Rome",1004);

create table Orders(Onum int primary key,Amt int,Odate date,Cnum int,Snum int,
foreign key (Cnum) references customers(Cnum),foreign key (Snum) references SalesPeople(Snum));
insert into Orders(Onum,Amt,Odate,Cnum,snum) values 
(3001, 18.69, '1990-10-03', 2008, 1007),
(3003, 767.19, '1990-10-03', 2001, 1001),
(3002, 1900.10, '1990-10-03', 2007, 1004),
(3005, 5160.45, '1990-10-03', 2003, 1002),
(3006, 1098.16, '1990-10-03', 2008, 1007),
(3009, 1713.23, '1990-10-04', 2002, 1003),
(3007, 75.75, '1990-10-04', 2004, 1002),
(3008, 4273.00, '1990-10-05', 2006, 1001),
(3010, 1309.95, '1990-10-06', 2004, 1002),
(3011, 9891.88, '1990-10-06', 2006, 1001);


select count(*) from SalesPeople where Sname like 'A%'or'a%';

select * from SalesPeople where Snum in (select Snum from Orders where Amt > 2000);

select count(*) from SalesPeople where city = "Newyork";

select City, count(*)as numberofSalesPeople from SalesPeople where City in ("London","Paris")Group by City;

select S. Snum, S.Sname, O.Odate,count(*) as NumberOfOrders from SalesPeople S join Orders O on S.Snum = O.Snum 
Group by S.Snum, S.Sname, O.Odate Order by S.Snum, O.Odate;

Select Count(*),Odate,Snum from Orders Group by Snum,Onum;