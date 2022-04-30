show databases;
drop database Store;
create database Store;
use Store;


create table Category(
catid int primary key AUTO_INCREMENT,
catname varchar(20) not null,
noofworkers int not null, check(noofworkers >= 0)
);

create table Products(
	pdid int primary key AUTO_INCREMENT,
	catid int,
    name varchar(100) not null,
    brand varchar(50) not null,
    images varchar(255) not null,
    oftype varchar(50) not null,
    costPrice int not null, check(costPrice >= 0),
    sellingPrice int not null, check(sellingPrice >= 0),
    discount int not null, check(discount >= 0),
    rating int not null, check (rating between 1 and 5),
    foreign key(catid) references Category(catid)
    on update cascade
);

create table Eappliances(
	pdid int,
    mfgDate date not null,
    quantity int not null, check(quantity >= 0),
    primary key(pdid, mfgdate),
    foreign key(pdid) references Products(pdid)
    on delete cascade
    on update cascade
);

create table Footwears(
	pdid int,
	color varchar(20) not null,
	gender varchar(20) not null,
	size int not null, check(size >= 0),
    quantity int not null, check(quantity >= 0),
	primary key(pdid, color, gender, size),
	foreign key(pdid) references Products(pdid)
	on delete cascade
    on update cascade
);

create table Clothes(
	pdid int,
	color varchar(20) not null,
	gender varchar(20) not null,
	size varchar(20) not null, check(size in('M', 'L', 'S', 'XL', 'XXL', 'XXXL')),
    quantity int not null, check(quantity >= 0),
	primary key(pdid, color, gender, size),
	foreign key(pdid) references Products(pdid)
	on delete cascade
    on update cascade
);

create table Vendor(
venid int primary key AUTO_INCREMENT,
fname varchar(20) not null,
lname varchar(20) default "-",
email varchar(50) not null, check(email like '%_@___%.___%'),
phone char(12) not null,
gender varchar(9) not null, check(gender in ('Male', 'Female', 'others')),
hno int default -1, check(hno >= -1),
street varchar(150) not null,
district varchar(50) not null,
city varchar(20) not null,
state varchar(30) not null,
pincode int not null, check(pincode between 000000 and 999999)
);

create table Inventory(
invenid int primary key AUTO_INCREMENT,
hno int not null, check(hno >= 0),
street varchar(255) not null,
district varchar(20) not null,
city varchar(20) not null,
state varchar(50) not null,
pincode int not null, check(pincode between 000000 and 999999)
);

create table InInventory(
	invenid int,
	pdid int,
	quantity int default 0, check(quantity >= 0),
	primary key(invenid,pdid),
	foreign key (invenid) references Inventory(invenid),
	foreign key(pdid) references Products(pdid)
	on delete cascade
    on update cascade
);

create table Distributes(
invenid int,
venid int,
primary key(invenid,venid),
foreign key(invenid) references Inventory(invenid),
foreign key(venid) references Vendor(venid)
on delete cascade
    on update cascade
);

create table Invoice(
	invid int primary key AUTO_INCREMENT,
    invenid int,
    statusof boolean not null,
    receivedDate date not null,
    fulfilledDate date not null, check(date(fulfilledDate) >= date(receivedDate)),
    foreign key(invenid) references Inventory(invenid)
    on delete cascade
    on update cascade
);

create table Batch(
	bid int primary key AUTO_INCREMENT,
    pdid int,
    invid int,
    quantity int default 0, check(quantity >= 0),
    foreign key (pdid) references Products(pdid),
    foreign key(invid) references Invoice(invid)
    on delete cascade
    on update cascade
);

create table Morders(
	invid int primary key,
    venid int,
	foreign key(invid) references Invoice(invid),
    foreign key (venid) references Vendor(venid)
    on delete cascade
    on update cascade
);

create table Manager(
meid int primary key AUTO_INCREMENT,
invenid int,
fname varchar(20)not null,
lname varchar(20) default "-",
phone char(12) not null,
email varchar(50) not null, check(email like '%_@__%.__%'),
dob date not null, check(year(dob) < 2022),
age int generated always as(2022 -  year(dob)),
gender varchar(9) not null, check(gender in ('Male', 'Female', 'Others')),
hno int default -1, check(hno >= 0),
street varchar(150) not null,
district varchar(50) not null,
city varchar(20) not null,
state varchar(30) not null,
pincode int not null, check(pincode between 000000 and 999999),
salary int default 10000, check(salary >= 8000),
experience int not null, check(experience >= 0),
doj date not null, check(year(doj) > year(dob)),
foreign key(invenid) references Inventory(invenid)
    on update cascade
);


create table Customer(
uid int primary key AUTO_INCREMENT,
fname varchar(20)not null,
lname varchar(20) default "-",
phone char(12) not null,
email varchar(50) not null, check(email like '%_@__%.__%'),
gender varchar(9) not null, check(gender in ('Male', 'Female', 'Others')),
dob date not null,  check(year(dob) < 2022),
age int generated always as(2022-year(dob)) virtual,
hno int default -1, check(hno >= 0),
street varchar(150) not null,
district varchar(50) not null,
city varchar(20) not null,
state varchar(30) not null,
pincode int not null, check(pincode between 000000 and 999999)
);

create table Employee(
eid int primary key AUTO_INCREMENT,
fname varchar(20)not null,
lname varchar(20) default "-",
phone char(12) not null,
email varchar(50) not null check(email like '%_@__%.__%'),
dob date not null, check(year(dob) <= 2022),
age int generated always as ((2022-year(dob))) virtual,
gender varchar(9) not null check(gender in ('Male', 'Female', 'Others')),
hno int default -1, check(hno >= 0),
street varchar(150) not null,
district varchar(50) not null,
city varchar(20) not null,
state varchar(30) not null,
pincode int not null, check(pincode between 000000 and 999999),
salary int default 10000, check(salary >= 8000),
experience int not null, check(experience >= 0),
speciality varchar(20) not null,
doj date not null, check(year(dob) < year(doj))
);

create table Supervision(
eid int,
meid int,
primary key(eid, meid),
foreign key(meid) references Manager(meid),
foreign key(eid) references Employee(eid)
	on delete cascade
    on update cascade
);

create table Supervisor(
	superviser_eid int,
    supervisee_eid int,
    primary key(supervisee_eid),
    foreign key (superviser_eid) references Employee(eid),
    foreign key (supervisee_eid) references Employee(eid)
    on delete cascade
    on update cascade
);

create table CatHead(
cheid int primary key,
catid int not null,
foreign key (cheid) references Employee(eid),
foreign key (catid) references Category(catid)
on delete cascade
on update cascade
);


create table Worker(
weid int primary key,
catid int not null,
foreign key (weid) references Employee(eid),
foreign key (catid) references Category(catid)
on delete cascade
on update cascade
);

create table Views(
timstamp timestamp not null DEFAULT current_timestamp(),
uid int,
catid int,
primary key(timstamp,uid,catid),
foreign key (uid) references Customer(uid),
foreign key (catid) references Category(catid)
	on delete cascade
	on update cascade
);

create table Corders(
cordid int primary key AUTO_INCREMENT,
uid int not null,
dateoforderplaced date not null,
dateoforderdelivery date not null, check(date(dateoforderdelivery) >= date(dateoforderplaced)),
orderstatus boolean default false,
totalCost int default 0, check(totalCost >= 0),
foreign key(uid) references Customer(uid)
on delete cascade
on update cascade
);

create table Cart(
ordid int,
pdid int,
quantity int default 0, check(quantity >= 0),
subtotal int default 0,  check(subtotal >= 0),
attr varchar(80) not null,
placed boolean default false,
primary key(ordid, pdid, quantity, attr, placed),
foreign key(ordid) references Corders(cordid),
foreign key (pdid) references Products(pdid)
	on delete cascade
    on update cascade
);

create table Transactions(
tid int primary key AUTO_INCREMENT,
cordid int,
ofstatus boolean not null,
timstamp timestamp not null DEFAULT current_timestamp(),
paymentmethod varchar(10) not null, check(paymentmethod in('COD', 'UPI')),
foreign key(cordid) references Corders(cordid)
on delete cascade
on update cascade
);

create table DeliveryPerson(
cordid int primary key,
deid int,
foreign key(cordid) references Corders(cordid),
foreign key(deid) references Employee(eid)
on delete cascade
on update cascade
);

create table login(
loginID int not null, check(loginID >= 0),
usertype varchar(20) not null, check ( usertype in('customer','manager','employee')),
pasword varchar(12) not null, check (LENGTH(pasword) >= 6 and LENGTH(pasword) <= 12),
primary key (loginID,usertype)
);


-- Triggers Implementation
create  trigger doDiscount
before insert on Products
for each row
set new.discount=new.costPrice*0.1,
new.sellingPrice=new.costPrice-new.discount;


create  trigger discountDu
before update on Products
for each row
set new.discount=new.costPrice*0.1,
new.sellingPrice=new.costPrice-new.discount;


--When the order is inserted in the cart
create trigger jbcartmeadd1
after insert on Cart
for each row
update Eappliances
set quantity=quantity-new.quantity
where Eappliances.pdid=new.pdid;


create trigger jbcartmeadd2
after insert on Cart
for each row
update Footwears
set quantity=quantity-new.quantity
where Footwears.pdid=new.pdid;


create trigger jbcartmeadd3
after insert on Cart
for each row
update Clothes
set Clothes.quantity=Clothes.quantity-new.quantity
where Clothes.pdid=new.pdid;

--
create trigger onIninventory1
after insert on Cart
for each row
update Footwears,InInventory
set Footwears.quantity=10+Footwears.quantity,
InInventory.quantity=InInventory.quantity-10
where Footwears.quantity<5 and Footwears.pdid=new.pdid and InInventory.pdid=new.pdid;


create trigger onIninventory2
after insert on Cart
for each row
update Clothes,InInventory
set Clothes.quantity=10+Clothes.quantity,
InInventory.quantity=InInventory.quantity-10
where Clothes.quantity<5 and Clothes.pdid=new.pdid and InInventory.pdid=new.pdid;


create trigger onIninventory3
after insert on Cart
for each row
update Eappliances,InInventory
set Eappliances.quantity=10+Eappliances.quantity,
InInventory.quantity=InInventory.quantity-10
where Eappliances.quantity<5 and Eappliances.pdid=new.pdid and InInventory.pdid=new.pdid;


--views
--Manager
create view InInventoryViewMan as
SELECT InInventory.pdid, Products.name, Products.brand, InInventory.quantity, InInventory.invenid
FROM InInventory JOIN Products ON InInventory.pdid = Products.pdid;

create view VendorViewMan as
SELECT Vendor.venid, Vendor.fname, Vendor.lname, Vendor.email, Vendor.phone,
Vendor.gender, Vendor.hno, Vendor.street, Vendor.district, Vendor.city,
Vendor.state, Vendor.pincode, Distributes.invenid FROM Vendor JOIN Distributes
ON Vendor.venid = Distributes.venid;

create view InvoiceUnderMan as
SELECT Invoice.invid, Invoice.invenid, Invoice.statusof, Invoice.receivedDate,
Invoice.fulfilledDate, Morders.venid FROM Invoice JOIN Morders
ON Invoice.invid = Morders.invid;

create view BatchView as
SELECT Products.name, Products.brand, Products.oftype, Batch.quantity, Batch.invid,
Morders.venid, Invoice.invenid FROM Invoice JOIN Products JOIN Batch JOIN Morders
ON Invoice.invid = Morders.invid AND Invoice.invid = Batch.invid AND Products.pdid = Batch.pdid;


--Catrgory Head
create view InventoryViewCat as
SELECT Inventory.invenid, Inventory.hno, Inventory.street, Inventory.district,
Inventory.city, Inventory.state, Inventory.pincode, Employee.eid FROM Inventory JOIN
Manager JOIN Supervision JOIN Employee ON Inventory.invenid = Manager.invenid AND Manager.meid = Supervision.meid AND
Supervision.eid = Employee.eid;

create view InInventoryViewCat as
SELECT DISTINCT InInventory.pdid, Products.name, Products.brand, InInventory.quantity, Employee.eid
FROM Products JOIN InInventory JOIN Inventory JOIN Manager JOIN Supervision JOIN Employee JOIN CatHead ON
InInventory.pdid = Products.pdid AND Inventory.invenid = InInventory.invenid AND Manager.invenid = Inventory.invenid
AND Manager.meid = Supervision.meid AND Supervision.eid = Employee.eid AND Employee.eid = CatHead.cheid AND
Products.catid = CatHead.catid;

create view EmployeeUnderCat as
SELECT E1.eid, E1.fname, E1.lname, E1.phone, E1.age, E1.salary, S1.superviser_eid
FROM Employee E1 JOIN Supervisor S1 ON E1.eid = S1.supervisee_eid;

create view ProductsUnderCat as
SELECT DISTINCT Products.pdid, Products.catid, Products.name, Products.brand, Products.images,
Products.oftype, Products.costPrice, Products.sellingPrice, Products.discount, Products.rating,
CatHead.cheid FROM Products JOIN CatHead ON Products.catid = CatHead.catid;

--DeliveryPerson
create view Shippings as
SELECT D.cordid, C.dateoforderplaced, C.dateoforderdelivery, C.orderstatus, C.totalCost, U.uid,
U.fname, U.lname, U.phone, U.email, U.hno, U.street, U.district, U.city, U.state, U.pincode, D.deid
FROM DeliveryPerson D JOIN Corders C JOIN Customer U ON D.cordid = C.cordid AND C.uid = U.uid
ORDER BY C.orderstatus='0';


--Worker
create view InventoryViewWork as
SELECT DISTINCT Inventory.invenid, Inventory.hno, Inventory.street, Inventory.district, Inventory.city,
Inventory.state, Inventory.pincode, Employee.eid FROM Inventory JOIN Manager JOIN Supervision JOIN Employee JOIN Supervisor JOIN
CatHead ON Employee.eid = Supervisor.supervisee_eid AND Supervisor.superviser_eid = CatHead.cheid AND
CatHead.cheid = Supervision.eid AND Supervision.meid = Manager.meid AND Inventory.invenid = Manager.invenid;

create view InInventoryViewWork as
SELECT DISTINCT InInventory.pdid, Products.name, Products.brand, InInventory.quantity, Employee.eid
FROM Products JOIN InInventory JOIN Inventory JOIN Manager JOIN Supervision JOIN Employee JOIN
CatHead JOIN Supervisor ON InInventory.pdid = Products.pdid AND Inventory.invenid = InInventory.invenid AND
Manager.invenid = Inventory.invenid AND Manager.meid = Supervision.meid AND
Supervision.eid = CatHead.cheid AND CatHead.cheid = Supervisor.superviser_eid AND
Supervisor.supervisee_eid = Employee.eid AND Products.catid = CatHead.catid;

create view ProductsUnderWork as
SELECT DISTINCT Products.pdid, Products.catid, Products.name, Products.brand, Products.images,
Products.oftype, Products.costPrice, Products.sellingPrice, Products.discount, Products.rating,
Employee.eid FROM Products JOIN CatHead JOIN Supervisor JOIN Employee ON
Products.catid = CatHead.catid AND CatHead.cheid = Supervisor.superviser_eid AND
Supervisor.supervisee_eid = Employee.eid;

--Store
create view CartView as
SELECT Cart.pdid, Cart.quantity, Cart.subtotal, Cart.attr, Cart.placed, Products.name,
Products.sellingPrice, Products.catid, Cart.ordid FROM Cart JOIN Products ON Cart.pdid = Products.pdid
WHERE Cart.placed = 0;


--user
create view InCartView as
SELECT Cart.pdid, Cart.quantity, Cart.subtotal, Products.catid,
Products.name, Products.sellingPrice, Cart.ordid
FROM Cart JOIN Products ON Cart.pdid = Products.pdid
WHERE Cart.placed = 1;


create view OrderView as
SELECT Cart.quantity, Cart.subtotal, Products.name,
Products.sellingPrice, Cart.ordid
FROM Cart JOIN Products ON Cart.pdid = Products.pdid
WHERE Cart.placed = 0;

--Grants
CREATE USER 'Customer'@'localhost' IDENTIFIED BY 'Root#1234';
CREATE USER 'Manager'@'localhost' IDENTIFIED BY 'Root#1234';
CREATE USER 'CatHead'@'localhost' IDENTIFIED BY 'Root#1234';
CREATE USER 'DeliveryPerson'@'localhost' IDENTIFIED BY 'Root#1234';
CREATE USER 'Worker'@'localhost' IDENTIFIED BY 'Root#1234';

--Inventory
GRANT SELECT
ON store.Inventory TO 'Manager'@'localhost';

--Inventory
GRANT ALL PRIVILEGES
ON store.InInventory TO 'Manager'@'localhost';

--Products
GRANT UPDATE, SELECT
ON store.Products TO 'Worker'@'localhost';

GRANT ALL
ON store.Products TO 'CatHead'@'localhost';

GRANT SELECT
ON store.Products TO 'Customer'@'localhost';

--Clothes
GRANT ALL
ON store.Clothes TO 'CatHead'@'localhost';

GRANT SELECT
ON store.Clothes TO 'Customer'@'localhost';

--Footwear
GRANT ALL
ON store.Footwears TO 'CatHead'@'localhost';

GRANT SELECT
ON store.Footwears TO 'Customer'@'localhost';

--Eappliances
GRANT ALL
ON store.Eappliances TO 'CatHead'@'localhost';

GRANT SELECT
ON store.Eappliances TO 'Customer'@'localhost';


--Customer
GRANT SELECT, UPDATE
ON store.Customer TO 'Customer'@'localhost';

--Manager
GRANT SELECT, UPDATE
ON store.Manager TO 'Manager'@'localhost';

--Emploeee
GRANT ALL
ON store.Employee TO 'Manager'@'localhost';

GRANT ALL
ON store.Employee TO 'CatHead'@'localhost';

GRANT SELECT, UPDATE
ON store.Employee TO 'DeliveryPerson'@'localhost';

GRANT SELECT, UPDATE
ON store.Employee TO 'Worker'@'localhost';

--DeliveryPerson
GRANT SELECT
ON store.DeliveryPerson TO 'DeliveryPerson'@'localhost';

--Worker
GRANT SELECT, INSERT, DELETE
ON store.Worker TO 'CatHead'@'localhost';

--Corders
GRANT SELECT, UPDATE
ON store.Corders TO 'DeliveryPerson'@'localhost';

GRANT SELECT, INSERT
ON store.Corders TO 'Customer'@'localhost';


--Morders
GRANT SELECT, INSERT
ON store.Morders TO 'Manager'@'localhost';

--Vendor
GRANT SELECT
ON store.Vendor TO 'Manager'@'localhost';

--Transactions
GRANT SELECT, INSERT, DELETE
ON store.Transactions TO 'Customer'@'localhost';

--Cart
GRANT ALL
ON store.Cart TO 'Customer'@'localhost';

--Views
GRANT SELECT, INSERT
ON store.Views TO 'Customer'@'localhost';

--Distributes
GRANT SELECT, INSERT
ON store.Distributes TO 'Manager'@'localhost';

--Batch
GRANT SELECT, INSERT
ON store.Batch TO 'Manager'@'localhost';

--Invoice
GRANT SELECT, INSERT
ON store.Invoice TO 'Manager'@'localhost';

--login
GRANT SELECT
ON store.login TO 'Customer'@'localhost', 'Manager'@'localhost', 'DeliveryPerson'@'localhost', 'Worker'@'localhost', 'CatHead'@'localhost';

--Supervisor
GRANT SELECT, INSERT
ON store.Supervisor TO 'CatHead'@'localhost';

--Supervision
GRANT SELECT, INSERT
ON store.Supervision TO 'Manager'@'localhost';


--CatHead
GRANT SELECT, INSERT, DELETE
ON store.CatHead TO 'Manager'@'localhost';

GRANT SELECT
ON store.CatHead TO 'CatHead'@'localhost';

--Category
GRANT SELECT
ON store.Category TO 'CatHead'@'localhost', 'Worker'@'localhost', 'Customer'@'localhost';

-- GRANTS ON VIEWS
--BatchView
GRANT SELECT
ON store.BatchView TO 'Manager'@'localhost';

--CartView
GRANT SELECT
ON store.CartView TO 'Customer'@'localhost';

--EmployeeUnderCat
GRANT SELECT
ON store.EmployeeUnderCat TO 'CatHead'@'localhost';

--InCartView
GRANT SELECT
ON store.InCartView TO 'Customer'@'localhost';

--InInventoryViewCat
GRANT SELECT
ON store.InInventoryViewCat TO 'CatHead'@'localhost';

--InInventoryViewMan
GRANT SELECT
ON store.InInventoryViewMan TO 'Manager'@'localhost';

--InInventoryViewWork
GRANT SELECT
ON store.InInventoryViewWork TO 'Worker'@'localhost';

--InventoryViewCat
GRANT SELECT
ON store.InventoryViewCat TO 'CatHead'@'localhost';

--InventoryViewWork
GRANT SELECT
ON store.InventoryViewWork TO 'Worker'@'localhost';

--InvoiceUnderMan
GRANT SELECT
ON store.InvoiceUnderMan TO 'Manager'@'localhost';

--OrderView
GRANT SELECT
ON store.OrderView TO 'Customer'@'localhost';

--ProductsUnderCat
GRANT SELECT
ON store.ProductsUnderCat TO 'CatHead'@'localhost';

--ProductsUnderWork
GRANT SELECT
ON store.ProductsUnderWork TO 'Worker'@'localhost';

--Shippings
GRANT SELECT
ON store.Shippings TO 'DeliveryPerson'@'localhost';

--VendorViewMan
GRANT SELECT
ON store.VendorViewMan TO 'Manager'@'localhost';
------------------------------------------------------



