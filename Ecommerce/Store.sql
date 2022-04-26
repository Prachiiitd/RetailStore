show databases;
drop database store;
create database store;
use store;


create table Category(
catid int primary key AUTO_INCREMENT,
catname varchar(20) not null,
noofworkers int not null, check(noofworkers >= 0)
);

Insert into Category values
(1,'Clothes',10),
(2,'Footwear',10),
(3,'EAppliances',10);

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

insert Into Products(pdid, catid, name, brand, images, oftype, costPrice, sellingPrice, discount, rating) values
(1,1,'Eco-Friendly Mens 50/50 Blend Double Coloured T-Shirt','Ecoline Clothing','http://dummyimage.com/219x100.png/dddddd/000000','T-shirt',500,700,200,3),

(2,1,'Eco-Friendly Mens Cotton Casual Lounge Pants','Ecoline Clothing','http://dummyimage.com/228x100.png/5fa2dd/ffffff','Pant',400,600,100,4),

(3,1,'Boys Track Pant','Clothe fum','http://dummyimage.com/157x100.png/ff4444/ffffff','Track Pant',1000,1500,500,3),

(4,1,'Girls Track Pants','Clothe fum','http://dummyimage.com/193x100.png/5fa2dd/ffffff','Track Pant',500,750,250,4),

(5,1,'Mens Regular Formal Shirt','Diverse','http://dummyimage.com/238x100.png/5fa2dd/ffffff','Shirt',500,700,200,4),

(6,1,'Mens Solid Slim Fit Casual Shirt','Dennis Ligo','http://dummyimage.com/238x100.png/cc0000/ffffff','Shirt',400,600,200,5),

(7,1,'Dennis Lingo Mens Solid Slim Fit Casual Shirt','Dennis Ligo','http://dummyimage.com/160x100.png/5fa2dd/ffffff','Shirt',500,800,200,5),

(8,1,'Womens A-Line Crepe Kurta','Janasya','http://dummyimage.com/177x100.png/dddddd/000000','Kurta',3500,4000,1000,5),

(9,1,'Mens Printed Regular fit T-Shirt','U.S. Polo','http://dummyimage.com/176x100.png/dddddd/000000','T-shirt',500,1000,200,4),

(10,1,'Womens Slim Fit Trackpants','Alan Jones Clothing','http://dummyimage.com/153x100.png/ff4444/ffffff','Track Pant',600,1050,200,3),

(11,2,'Men Formal Shoe','Centrino','http://dummyimage.com/169x100.png/5fa2dd/ffffff','Shoe',500,890,400,3),

(12,2,'womens Shoes Stripe','One Centre','http://dummyimage.com/130x100.png/5fa2dd/ffffff','Shoe',100,300,300,4),

(13,2,'Mens Leather Oxfords Lace up Formal Shoes','tresmode','http://dummyimage.com/207x100.png/5fa2dd/ffffff','Shoe',2000,4000,500,3),

(14,2,'Women Deva Fashion Sandals','Bata','http://dummyimage.com/166x100.png/dddddd/000000','Sandal',300,600,200,4),

(15,2,'Mens Jubilee Leather Slipper','Bata','http://dummyimage.com/130x100.png/ff4444/ffffff','Slipper',200,400,400,4),

(16,2,'womens 6203 Flat Sandal','Centrino','http://dummyimage.com/161x100.png/ff4444/ffffff','Sandal',400,600,250,5),

(17,2,'womens 6208 Flat Sandal','Centrino','http://dummyimage.com/115x100.png/5fa2dd/ffffff','Sandal',400,500,200,5),

(18,2,'Mens Sandal','Sparx','http://dummyimage.com/167x100.png/5fa2dd/ffffff','Shoe',3500,4000,1000,5),

(19,2,'Womens New Irom Slipper','Bata','http://dummyimage.com/159x100.png/dddddd/000000','Slipper',500,1000,200,4),

(20,2,'Mens Black Synthetic Leater Outdoor Casual Sandal','aadi','http://dummyimage.com/139x100.png/dddddd/000000','sandal',400,800,200,3),

(21,3,'Samsung 407 L 2 Star Frost Free Inverter Double Door Refrigerator','Samsung','http://dummyimage.com/246x100.png/cc0000/ffffff','Refrigator',45999,54999,550,3),

(22,3,'Godrej 185 L 4 Star Inverter Direct-Cool Single Door Refrigerator','Godrej','http://dummyimage.com/199x100.png/5fa2dd/ffffff','Refrigator',10550,16550,500,4),

(23,3,'Lenovo Tab M8 HD Tablet','Lenovo','http://dummyimage.com/244x100.png/dddddd/000000','Tablet',7000,9360,200,3),

(24,3,'Samsung Galaxy Tab A7 Lite','Samsung','http://dummyimage.com/171x100.png/ff4444/ffffff','Tablet',9000,11000,300,4),

(25,3,'Samsung Galaxy S22 5G','Samsung','http://dummyimage.com/106x100.png/cc0000/ffffff','Mobile',50000,73000,27000,5),

(26,3,'Redmi 9A','Xiaomi','http://dummyimage.com/137x100.png/5fa2dd/ffffff','Mobile',5000,7300,2700,4),

(27,3,'HP 14s','Hp','http://dummyimage.com/151x100.png/cc0000/ffffff','Laptop',40000,48071,2000,5),

(28,3,'Dell New Inspiron 3511','Dell','http://dummyimage.com/121x100.png/cc0000/ffffff','Laptop',35000,40190,1000,3),

(29,3,'PTron Fusion 10','pTron','http://dummyimage.com/155x100.png/ff4444/ffffff','speaker',500,1000,200,4),

(30,3,'Artis Mini','Artis','http://dummyimage.com/227x100.png/dddddd/000000','speaker',250,500,100,2);


create table Eappliances(
	pdid int,
    mfgDate date not null,
    quantity int not null, check(quantity >= 0),
    primary key(pdid, mfgdate),
    foreign key(pdid) references Products(pdid)
    on delete cascade
    on update cascade
);

insert into Eappliances values
(21, '2020-12-27', 30),
(22, '2013-01-01', 25),
(23, '2015-05-25', 20),
(24, '2015-05-01', 45),
(25, '2021-02-12', 30),
(26, '2020-02-26', 40),
(27, '2020-06-25', 25),
(28, '2019-12-21', 30),
(29, '2021-01-21', 30),
(30, '2020-05-15', 20);

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

insert into Footwears values
(11,'black','male',10, 30),
(12,'blue','female',8, 25),
(13,'white','male',5, 20),
(14,'orange','female',6, 45),
(15,'brown','male',7, 25),
(16,'red','female',6, 40    ),
(17,'pink','female',8, 30),
(18,'Grey','Male',9, 25),
(19,'black','female',7, 35),
(20,'black','male',6, 40);

 

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

insert into Clothes values
(1,'black','male','M', 30),
(2,'blue','male','L', 25),
(3,'yellow','male','M', 20),
(4,'orange','female','L', 45),
(5,'blue','male','L', 25),
(6,'red','male','L', 40),
(7,'black','male','M', 30),
(8,'Green','female','M', 25),
(9,'black','male','XL', 35),
(10,'black','female','L', 40);


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

INSERT INTO Vendor VALUES
    (1,'Rebecca','Blankenship','gcampbell@gmail.com','878-332-9942','Female',7827,' Marissa LocksAlejandroland, MN 98805 ','East Garo Hills','Chandigarh','Manipur',073871),
    (2,'Brandi','Morris','deleonmarilyn@yahoo.com','804-674-5179','Male',695,' Fowler SquareRobertshire, TX 94646 ','Banka','Bokara','West Bengal',072629),
    (3,'Edward','Calhoun','leonardmorgan@yahoo.com','674-673-5235','Male',8039,' Joseph Field Apt. 685New Susanmouth, KY 63340 ','Aurangabad','kolkata','Andhra Pradesh',422084),
    (4,'Ann','Walls','bpowers@hotmail.com','910-040-5115','Female',61272,' Payne Road Suite 879Lake Jefferychester, VA 13514 ','Visakhapatnam','Amritsar','Daman and Diu',110799),
    (5,'Jennifer','Fletcher','stephen55@yahoo.com','901-185-9981','Female',307,' Powell CourtStephanieview, WY 36629 ','North Goa','Aligarh','Madhya Pradesh',665892),
    (6,'Tammy','Johnson','grussell@gmail.com','640-174-6802','Male',82782,' Nicole Shore Apt. 134Stephanieton, FL 60712 ','Chitradurga','Ahmedabad','Uttar Pradesh',070813),
    (7,'Timothy','Moore','dmcfarland@hotmail.com','388-179-4247','Female',305,' Jeffrey SquaresLake Jonathanport, IA 03604 ','Namsai','Patiala','Bihar',334244),
    (8,'Mark','Grant','ryan41@gmail.com','287-420-0780','Male',533,' 5388, Box 7283APO AE 59921 ','Bhagalpur','Aligarh','Bihar',650796),
    (9,'Susan','Guzman','allenjulie@hotmail.com','859-373-0579','Male',5252,' Mark Rapid Apt. 948West Rachelton, MS 68001 ','Guna','Latur','Goa',904301),
    (10,'Crystal','Garcia','cassandra75@gmail.com','157-271-8508','Others',04187,' Romero PikeMichaelburgh, MN 61249 ','Ranchi','Pune','Puducherry',494389),
    (11,'Patty','Jackson','garciasuzanne@yahoo.com','868-784-4830','Male',607,' Acevedo Stravenue Apt. 911Lisatown, TN 63945 ','Raipur','Hyderabad','Orissa',080713),
    (12,'Adam','Phelps','sarahmartinez@gmail.com','363-755-3538','Male',22032,' Joshua Ville Suite 156West Timothy, MD 45934 ','Ri Bhoi','Indore','Rajasthan',807803),
    (13,'Max','Grant','jeffreysanchez@hotmail.com','524-541-1603','Female',669,' Matthew LoopNorth Kathleenfort, MO 06264 ','Kapurthala','Hyderabad','Uttarakhand',524297),
    (14,'Jessica','Zamora','lucasstephanie@gmail.com','700-195-1737','Others',177,' 1773, Box 5521APO AP 69167 ','Botad','Howrah','Himachal Pradesh',752839),
    (15,'Mr.','Matthew','andrew68@yahoo.com','897-329-8964','Others',93418,' Johnson RidgesPaceburgh, AR 20736 ','Idukki','Arrah','Goa',915005),
    (16,'Thomas','Mcdaniel','tcox@yahoo.com','756-467-6083','Others',282,' Williams Spring Suite 038Anthonyport, MI 45218 ','Kinnaur','Lucknow','Manipur',295293),
    (17,'Sarah','Johnson','laura84@hotmail.com','586-293-2285','Male',13064,' Jennifer Island Apt. 862Benjaminstad, DC 78292 ','Ahmedabad','Lucknow','Delhi',789713),
    (18,'Carla','Norton','curtisroberts@gmail.com','557-442-9095','Male',1629,' Harrison Pike Apt. 484Port Keith, ID 63629 ','Nuapada','Kollam','Madhya Pradesh',784537),
    (19,'Michael','Avery','tmueller@gmail.com','285-298-5697','Male',73683,' Pamela Corners Apt. 782New Jeremymouth, TN 37638 ','Mansa','Loni','Telangana',981802),
    (20,'Michael','Garner','llopez@gmail.com','397-096-6552','Female',100,' Cunningham CrossingBoydport, WA 95520 ','Solan','Solapur','Gujarat',513826);
 
 
create table Inventory(
invenid int primary key AUTO_INCREMENT,
hno int not null, check(hno >= 0),
street varchar(255) not null,
district varchar(20) not null,
city varchar(20) not null,
state varchar(50) not null,
pincode int not null, check(pincode between 000000 and 999999)    
);

INSERT INTO Inventory VALUES
	(1,738,' Kendra Shores Apt. 835Simpsonshire, WA 09777 ','Bellary','Vadodara','Jharkhand',217973),
    (2,81189,' Tiffany Isle Suite 218Shortland, ID 25129 ','Ri Bhoi','Amritsar','Chandigarh',130945),
    (3,330,' Carter MillsEast Angelashire, ND 69140 ','Firozpur','Karur','Chhattisgarh',016055),
    (4,0436,' Bridges SpursJulieshire, AR 15889 ','Bhind','Gopalpur','Dadra and Nagar Haveli',161822),
    (5,145,' Patrick Village Suite 347Lake David, NM 70488 ','Noklak','kolkata','Andhra Pradesh',107350);
    

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

insert into InInventory values
(1,1, 43),
(1,2, 50),
(1,3, 45),
(1,4, 12),
(1,5, 45),
(2,6, 54),
(2,7, 100),
(2,8, 32),
(2,9, 43),
(2,10,76),
(3,11,65),
(3,12,34),
(3,13,12),
(3,14,80),
(3,15,1),
(4,16,55),
(4,17,43),
(4,18,90),
(4,19,12),
(4,20,33),
(5,21,10),
(5,22,6),
(5,23,65),
(5,24, 43),
(5,25,100),
(1,26,43),
(2,27,1),
(3,28,54),
(4,29, 32),
(5,30,12);



create table Distributes(
invenid int,
venid int,
primary key(invenid,venid),
foreign key(invenid) references Inventory(invenid),
foreign key(venid) references Vendor(venid)
on delete cascade
    on update cascade
);


insert into Distributes values
(1,1),
(1,2),
(1,3), 
(1,5),
(1,6),
(2,7),
(2,17),
(2,18),
(2,3),
(2,6),
(3,12),
(3,1),
(3,9),
(3,11),
(3,10),
(4,3),
(4,4),
(4,12),
(4,5),
(4,17),
(5,1),
(5,3),
(5,10),
(5,13),
(5,16);

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

insert into Invoice values
(1, 1, true,"2021-12-19", "2021-12-25"),
(2, 1, true,"2021-12-25", "2022-01-01"),
(3, 1, true,"2022-01-01", "2022-01-06"),
(4, 1, true,"2022-01-07", "2022-01-10"),
(5, 1, false,"2022-02-25", "2022-03-07"),
(6, 2, true,"2021-07-01", "2021-08-01"),
(7, 2, true,"2021-08-13", "2021-08-13"),
(8, 2, true,"2021-08-15", "2021-08-20"),
(9, 2, true,"2021-12-24", "2022-01-01"),
(10, 2, false,"2021-02-07", "2023-01-01"),
(11, 3, true,"2021-02-25", "2021-03-01"),
(12, 3, true,"2021-09-02", "2021-10-01"),
(13, 3, true,"2022-02-01", "2022-03-01"),
(14, 3, true,"2022-02-05", "2022-02-07"),
(15, 3, false,"2022-03-01", "2022-06-10"),
(16, 4, true,"2022-01-01", "2022-01-03"),
(17, 4, true,"2022-01-02", "2022-01-07"),
(18, 4, true,"2022-01-03", "2022-01-10"),
(19, 4, true,"2022-01-04", "2022-01-19"),
(20, 4, false,"2022-02-05", "2022-04-01"),
(21, 5, true,"2021-10-31", "2022-01-01"),
(22, 5, true,"2022-01-03", "2022-01-26"),
(23, 5, true,"2022-01-25", "2022-02-11"),
(24, 5, true,"2022-02-13", "2022-02-27"),
(25, 5, false,"2022-03-01", "2022-06-09");


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

insert into Batch values

(1,1,1,20),
(2,2,1,22),
(3,3,2,40),
(4,4,2,100),
(5,5,3,3),
(6,6,3,50),
(7,7,4,23),
(8,8,4,31),
(9,9,5,1),
(10,10,5,56),
(11,11,6,43),
(12,12,6,21),
(13,13,7,10),
(14,14,7,4),
(15,15,8,52),
(16,16,8,12),
(17,17,9,18),
(18,18,9,43),
(19,19,10,100),
(20,20,10,23),
(21,21,11,26),
(22,22,12,12),
(23,23,12,16),
(24,24,13,98),
(25,25,13,1),
(26,26,14,34),
(27,27,14,64),
(28,28,15,65),
(29,29,15,43),
(30,30,16,23),
(31,1,16,87),
(32,4,17,3),
(33,7,17,23),
(34,10,18,26),
(35,6,18,60),
(36,23,19,100),
(37,11,20,45),
(38,10,21,2),
(39,1,22,53),
(40,30,23,3),
(41,12,19,7),
(42,14,20,9),
(43,11,21,34),
(44,1,22,23),
(45,2,23,75),
(46,3,24,64),
(47,7,24,75),
(48,22,25,23),
(49,26,25,65),
(50,24,11,1);

create table Morders(
	invid int primary key,
    venid int,
	foreign key(invid) references Invoice(invid),
    foreign key (venid) references Vendor(venid)
    on delete cascade
    on update cascade
);

insert into Morders values
(1,1),
(2,2),
(3,3),
(4,5),
(5,6),
(6,7),
(7,17),
(8,18),
(9,3),
(10,6),
(11,12),
(12,1),
(13,9),
(14,11),
(15,10),
(16,3),
(17,4),
(18,12),
(19,5),
(20,17),
(21,1),
(22,3),
(23,10),
(24,13),
(25,16);


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


INSERT INTO Manager(meid, invenid, fname, lname, phone, email, dob, gender, hno, street, district, city, state, pincode, salary, experience, doj) VALUES
    (1,1,'Heather','Salinas','636-126-3585','ellenknight@yahoo.com','1915-11-30','Male',418,' Lisa Lakes Apt. 856West Laura, IN 32432 ','Nuapada','Thane','Punjab',639683,405071,9,'1936-11-30 00:00:00'),
    (2,2,'Barry','Hawkins','399-440-5904','andersonmaria@hotmail.com','1924-05-26','Female',25266,' Sherri DriveCharlesport, CA 20790 ','Banka','Aligarh','Meghalaya',031199,612745,2,'1945-05-26 00:00:00'),
    (3,3,'Jacqueline','Williams','771-878-0474','scott50@gmail.com','1969-04-03','Female',7536,' Anthony JunctionLeslieville, NV 25570 ','Balangir','Chandigarh','Rajasthan',772143,805257,2,'1990-04-03 00:00:00'),
    (4,4,'Lucas','Brown','925-856-5039','schaeferdebbie@yahoo.com','1924-05-06','Male',961,' Wilson RampWebbfort, NM 17868 ','Kurukshetra','Kolhapur','Tripura',768344,691274,1,'1945-05-06 00:00:00'),
    (5,5,'Theresa','Hogan','429-820-8912','ryanwashington@hotmail.com','1999-02-02','Others',075,' David Shoals Apt. 485North Jamesmouth, CA 09878 ','Ambala','Meerut','Chandigarh',710306,854266,5,'2020-02-02 00:00:00');
    


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

INSERT INTO Customer(uid, fname, lname, phone, email, gender, dob, hno, street, district, city, state, pincode) VALUES
    (1,'Jennifer','Newton','992-453-6096','thorntonnicole@gmail.com','Others','1943-03-29',758,' Washington Islands Suite 366Wilsonshire, KY 03716 ','Mansa','Jabalpur','Jharkhand',979240),
    (2,'Mathew','Moon','286-695-2792','dianedavis@yahoo.com','Others','1971-11-29',074,' Hernandez CornersChristopherhaven, VA 84867 ','Manyam','Cuttack','Orissa',619644),
    (3,'Mrs.','Kaitlyn','236-597-1390','michael66@yahoo.com','Female','1912-11-02',8250,' Silva TrailGarrisonton, WA 24638 ','Kapurthala','Hyderabad','Manipur',718272),
    (4,'Natalie','Kennedy','427-031-4201','jeffrey23@hotmail.com','Others','2019-01-12',68572,' Vasquez CourtsWest Carrieberg, PA 25330 ','Idukki','Jaipur','Kerala',032366),
    (5,'Victoria','Carter','977-781-1613','figueroarobert@gmail.com','Female','1959-08-15',35456,' Krause Mount Apt. 379New Michaelborough, CO 25820 ','Palwal','Alwar','Goa',384638),
    (6,'Candace','Anderson','498-264-1431','mescobar@yahoo.com','Female','1933-07-23',123,' 1230 Box 5289DPO AE 58932 ','Mansa','Patiala','Tamil Nadu',272263),
    (7,'Alan','Smith','623-119-9105','hoovermatthew@hotmail.com','Others','1976-08-27',6932,' Katelyn Circle Suite 199Staceyfurt, VT 20647 ','Banka','Panipat','Andhra Pradesh',592065),
    (8,'Joshua','Swanson','705-405-3579','kristenmarks@gmail.com','Female','1957-02-03',4480,' Lee LodgeEast Christine, NC 29358 ','Erode','Nagpur','Himachal Pradesh',506623),
    (9,'Erin','Pearson','819-029-6243','claymelissa@yahoo.com','Male','1963-10-31',751,' Ho LightPort Taylormouth, WI 10415 ','Baksa','Kollam','Jharkhand',322505),
    (10,'Javier','Thomas','166-197-3933','hjones@hotmail.com','Female','1982-06-01',81644,' Richard PineJasonchester, NM 76023 ','Noklak','Gaya','Gujarat',840829),
    (11,'Rebecca','Blevins','177-627-5186','fkrueger@hotmail.com','Female','1936-10-20',0816,' Mccormick KeyNew Warren, VA 67791 ','Kaithal','Ranchi','Madhya Pradesh',029524),
    (12,'Joseph','Whitney','187-264-2070','sara32@hotmail.com','Others','1951-06-08',24701,' Hill ExtensionsAngelaberg, AK 63250 ','Eluru','Surat','Rajasthan',382017),
    (13,'Matthew','Moss','972-012-8765','cjones@hotmail.com','Male','1939-07-18',74765,' White ExtensionsJameschester, IN 80005 ','Nalbari','Howrah','Jharkhand',622990),
    (14,'Anthony','Jones','556-340-0849','andersonangela@hotmail.com','Female','2015-03-08',91916,' Brian Ways Apt. 947Seanburgh, OK 47222 ','Firozpur','Amritsar','Jharkhand',220178),
    (15,'Alexander','Carey','773-415-2861','lpeters@hotmail.com','Others','1976-09-07',22392,' Mary GatewayWest Austin, NE 51982 ','Dausa','Ujjain','Manipur',240457),
    (16,'Candice','Wiggins','474-884-0248','christine83@gmail.com','Others','2009-04-20',182,' Flores CampSheilaborough, MS 03269 ','Kishanganj','Udaipur','Chhattisgarh',845807),
    (17,'Pamela','Gutierrez','798-051-4294','roy19@yahoo.com','Others','1928-06-17',63998,' Shane Freeway Suite 982Claytonchester, DC 72782 ','Dausa','Navi Mumbai','Manipur',171810),
    (18,'Katie','Drake','754-490-2458','michael36@yahoo.com','Male','2020-12-12',2761,' Williams ParksJessicastad, IN 98647 ','Durg','Bilaspur','Dadra and Nagar Haveli',773184),
    (19,'David','Mercado','405-499-2592','barry20@yahoo.com','Male','1910-07-13',4402,' Heidi Locks Apt. 872South Brian, ND 70844 ','Jhabua','Gopalpur','Kerala',568903),
    (20,'William','Horton','941-136-6597','mwalsh@hotmail.com','Male','1943-09-04',695,' Johnson MallMurilloside, IL 31350 ','Kurukshetra','Firozabad','Delhi',926756),
    (21,'Brandon','Brooks','101-745-7506','rebecca43@gmail.com','Others','2017-02-11',090,' Mark Fields Suite 791North Clinton, AZ 81639 ','Bhopal','Bhilai','Madhya Pradesh',507415),
    (22,'Shelby','Smith','788-072-2835','anthonypatrick@yahoo.com','Male','1971-07-31',1175,' Leslie NeckEast Chris, TN 03406 ','Araria','Solapur','Karnataka',606530),
    (23,'Angela','Farmer','116-007-9503','blakebrandt@hotmail.com','Male','1915-05-14',4354,' Phillip Brook Apt. 805North Annfurt, NC 61651 ','Namsai','Solapur','Gujarat',716243),
    (24,'Alyssa','Lopez','437-204-4899','vmiller@yahoo.com','Male','1925-02-12',1572,' Frazier Haven Suite 232Juanview, AK 98175 ','Garhwa','Korba','Arunachal Pradesh',433638),
    (25,'Dr.','Thomas','316-225-3341','luis95@yahoo.com','Male','1991-12-05',86417,' Marcus Valleys Suite 049West Jacquelinestad, WY 20668 ','Dhubri','Chandigarh','Gujarat',919669),
    (26,'Briana','Blackwell','218-365-1349','burkejennifer@gmail.com','Female','1975-01-17',189,' Chan DamWest Nancyborough, NH 95334 ','North Goa','Solapur','Bihar',146197),
    (27,'Mark','Johnston','857-479-2502','cookkayla@yahoo.com','Male','1976-10-17',6494,' Jim AlleyRobertsfort, SD 18879 ','Kishanganj','Amritsar','Kerala',245577),
    (28,'Rebecca','Hart','639-871-1393','gfoster@hotmail.com','Male','1910-05-17',36975,' Oneal NeckJenniferville, NH 29324 ','Dhubri','Guwahati','Bihar',679289),
    (29,'Jesse','Turner','821-470-4468','ywilliams@hotmail.com','Others','1995-04-25',49550,' Bradley Drive Apt. 381Port Megan, VT 59780 ','Kishanganj','Meerut','Lakshadweep',731835),
    (30,'Rebecca','Roberts','160-041-5118','krichardson@hotmail.com','Others','1922-06-07',642,' 6429 Box 4104DPO AE 38634 ','Palghar','Jabalpur','Jammu and Kashmir',219124),
    (31,'Ashley','Williams','369-032-4151','irojas@hotmail.com','Female','2013-02-27',385,' Miller Pike Apt. 577South Dianaton, IA 93211 ','Akola','Lucknow','Rajasthan',670755),
    (32,'Donald','Fields','820-209-3741','vmarshall@yahoo.com','Female','1924-08-25',89867,' Stephanie MeadowsLewisville, WY 74119 ','Udupi','Srinagar','Manipur',875276),
    (33,'Natalie','Wagner','275-714-2236','linda63@gmail.com','Female','1906-07-05',35281,' Schmidt Loop Suite 035Port Kendramouth, MN 39123 ','Firozpur','Jaipur','Madhya Pradesh',935227),
    (34,'James','Butler','688-194-3658','davidtony@gmail.com','Others','2018-01-24',36,' Nathan Pike Suite 864Jameston, KY 87671 ','Kapurthala','Bhilai','Andhra Pradesh',144227),
    (35,'Kaylee','Baxter','352-047-6519','ramirezmark@hotmail.com','Male','1925-07-04',5634,' Tiffany SpringsJonesmouth, MO 69671 ','Wayanad','Ludhiana','Telangana',031659),
    (36,'Patricia','Kelley','349-600-6360','wrightronald@gmail.com','Others','1985-08-21',762,' Courtney Freeway Apt. 845North Stephanie, SD 97484 ','Dausa','Mumbai','Telangana',135427),
    (37,'Ashley','Bolton','326-586-0627','nicholsashley@yahoo.com','Male','1916-05-11',294,' Holly RapidsStephenberg, IA 29998 ','Jhabua','Imphal','Uttarakhand',301280),
    (38,'Nathan','Taylor','879-148-5609','daviserin@gmail.com','Others','1958-01-23',210,' Smith Brooks Suite 415Port Carriestad, RI 40646 ','Korea','Kollam','Madhya Pradesh',417328),
    (39,'Lorraine','Williams','520-689-1113','lopezphilip@yahoo.com','Female','1932-04-17',560,' MendozaFPO AA 20720 ','Ahmedabad','Delhi','Puducherry',680573),
    (40,'Kelsey','Cooke','362-711-4169','qgoodwin@hotmail.com','Others','1906-09-14',1411,' Heather Junctions Suite 315Jefftown, AK 63985 ','Botad','Jabalpur','Delhi',411682),
    (41,'John','Guzman','846-053-3867','carterwilliam@yahoo.com','Others','1934-08-01',25321,' Evans IsleNorth Beth, MA 15571 ','Serchhip','Bhilai','Punjab',802930),
    (42,'Randall','Watts','229-439-8299','lbaker@gmail.com','Male','1975-12-10',9786,' Deborah GlensShanetown, IL 32251 ','Ranchi','Surat','Rajasthan',988847),
    (43,'Ivan','Spencer','438-036-8076','wendysolomon@hotmail.com','Female','2008-02-28',560,' VelezFPO AE 59407 ','South Goa','Bhilai','Andhra Pradesh',455079),
    (44,'Rhonda','Turner','723-319-8138','bvalencia@gmail.com','Others','1965-08-12',5847,' Kramer Course Apt. 170Wardborough, NJ 25688 ','Datia','Patiala','Gujarat',847982),
    (45,'Jeffrey','Harrington','398-515-0088','ruizcassidy@gmail.com','Female','2011-04-14',551,' Sophia StreamSanderschester, MT 57853 ','Alwar','Chandigarh','Rajasthan',270643),
    (46,'Michelle','Schmidt','705-642-2602','jessicafarley@yahoo.com','Male','1985-04-05',153,' Brad LodgeRiverastad, NJ 50153 ','Ambala','Kolhapur','Jammu and Kashmir',298306),
    (47,'Kevin','Howard','568-123-1804','williamstimothy@yahoo.com','Female','1941-11-25',287,' Alexander IsleEast Cristinatown, NC 75202 ','Kaithal','Cuttack','Orissa',723057),
    (48,'Jason','Salazar','637-352-5066','elizabethmendoza@gmail.com','Male','1977-01-12',1841,' Davis ViewQuinntown, ME 44597 ','Bellary','Imphal','Puducherry',929847),
    (49,'Terry','Mccann','423-867-0016','shawn47@gmail.com','Others','1944-11-04',161,' Samantha KeyWilliamsberg, TX 35610 ','Nagpur','Sagar','West Bengal',131891),
    (50,'Lori','Ayers','355-113-8729','rodriguezstephanie@yahoo.com','Male','1997-11-06',972,' 9729, Box 5662APO AA 91827 ','Tirap','Bhopal','Orissa',183282);


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


INSERT INTO Employee(eid, fname, lname, phone, email, dob, gender, hno, street, district, city, state, pincode, salary, experience, speciality, doj) VALUES

    (1,'Jose','James','925-168-5983','lhill@gmail.com','1909-11-29','Male',490,' Shaw Trail Apt. 095Jameschester, VA 39498 ','Akola','Latur','Mizoram',095544,724270,8,'Delivery Person','1930-11-29'),

    (11,'Melissa','Mason','455-116-3350','rebeccahuffman@hotmail.com','1976-11-24','Others',7306,' Fowler Dam Suite 050Lake Joe, FL 25973 ','Kishanganj','Loni','Bihar',227600,180606,1,'Delivery Person','1997-11-24'),

    (21,'Robert','Porter','401-295-8335','kevin27@gmail.com','1990-04-20','Male',460,' Tina ThroughwayTiffanyton, VA 14890 ','Bellary','Amritsar','Telangana',383606,826517,9,'Delivery Person','2011-04-20'),

    (31,'Belinda','Castro','286-499-4535','erikahopkins@gmail.com','2020-07-04','Male',987,' Dunn ParkLake Michellemouth, NH 32355 ','Gaya','Avadi','West Bengal',406244,116445,9,'Delivery Person','2041-07-04'),

    (41,'Howard','Becker','850-110-1232','brett34@yahoo.com','2003-01-22','Male',67467,' Donald Square Suite 722Stoutview, IA 81508 ','Namsai','Dhanbad','Manipur',416853,518506,7,'Delivery Person','2024-01-22'),

    (2,'Cindy','Duncan','937-811-7756','shermanrobert@yahoo.com','1999-06-07','Others',121,' Sarah PointGardnermouth, OK 60861 ','Hingoli','Karur','Nagaland',112655,781400,9,'Category Head','2020-06-07'),

    (3,'Douglas','Coleman','117-597-9640','samantha08@gmail.com','1967-06-07','Female',4939,' Eric HarborMartinezview, ND 22723 ','Jind','Pune','Gujarat',339454,653758,10,'Category Head','1988-06-07'),

    (4,'Jessica','Cook','676-437-8807','laurenreed@yahoo.com','1995-07-18','Others',79204,' Dawn CliffsLake Paulside, FL 15461 ','Palwal','Patiala','Karnataka',245581,526135,6,'Category Head','2016-07-18'),

    (5,'Dean','Morgan','821-273-2271','kathleen06@yahoo.com','1929-05-14','Female',41120,' Miller Village Suite 988Andersonport, RI 43560 ','Durg','Ranchi','Jammu and Kashmir',518865,792940,4,'Worker','1950-05-14'),

    (6,'Gilbert','Ross','338-234-0741','parkersteven@gmail.com','1953-09-12','Male',34078,' Haney PortsSouth Franklin, MD 45182 ','Idukki','Solapur','Uttar Pradesh',767768,482880,2,'Worker','1974-09-12'),

    (7,'Ashley','Ferguson','636-274-9654','garystevenson@gmail.com','1977-03-01','Others',78569,' Rebecca ForkPort James, OH 04278 ','Idukki','Indore','Andaman and Nicobar',755628,743097,6,'Worker','1998-03-01'),

    (8,'Ryan','Stanley','637-499-6274','carla11@yahoo.com','1965-02-23','Others',76422,' Foster VilleJohnstad, OH 77568 ','Dhubri','Allahabad','Kerala',851101,263236,1,'Worker','1986-02-23'),

    (9,'Jacob','Richards','545-836-6338','fordstephanie@yahoo.com','1947-10-19','Others',941,' Bradley Cliff Apt. 265Andrewsborough, CT 24290 ','Vaishali','Srinagar','Delhi',165733,853548,9,'Worker','1968-10-19'),

    (10,'Richard','Jones','306-594-3014','douglassmith@gmail.com','1975-11-13','Others',11168,' Terri Trafficway Apt. 688Vargasmouth, NY 46699 ','Balangir','Solapur','Orissa',269320,147708,5,'Worker','1996-11-13'),

    (12,'Robert','Hamilton','931-359-0114','mthompson@yahoo.com','1963-06-26','Male',14997,' Duran Neck Apt. 471New Paulton, UT 11268 ','Ahmedabad','Bellary','Kerala',868012,112341,4,'Category Head','1984-06-26'),

    (13,'Elizabeth','Jordan','530-375-0905','hammondrichard@gmail.com','1927-02-10','Female',35879,' Michael Heights Suite 787Barnettview, ME 81101 ','Jind','Korba','Mizoram',098341,792862,4,'Category Head','1948-02-10'),

    (14,'Ryan','Rivera','719-557-7184','cfernandez@yahoo.com','1973-05-14','Male',0423,'Box 2977DPO AP 00651 ','Solan','Vadodara','Arunachal Pradesh',238553,714798,3,'Category Head','1994-05-14'),

    (15,'Benjamin','Carter','183-657-3201','xli@hotmail.com','1987-04-09','Others',2595, 'Box 0987APO AE 83614 ','Datia','Dehradun','Nagaland',407124,363435,8,'Worker','2008-04-09'),

    (16,'Jose','Young','145-075-4217','matthew95@gmail.com','1921-10-25','Others',2493,' Gwendolyn Club Apt. 260Port Alexander, UT 85594 ','Tirap','Karur','Manipur',433713,504674,10,'Worker','1942-10-25'),
    
	(17,'Dustin','Palmer','880-277-3760','michelegonzalez@gmail.com','1953-09-07','Female',00238,' Cassandra Forks Apt. 600Johnsontown, NM 84174 ','Jangaon','Bellary','Daman and Diu',223194,634221,5,'Worker','1974-09-07'),

    (18,'Rick','Martinez','591-405-8374','kimberly33@yahoo.com','1993-02-02','Others',5294 ,'Box 0658DPO AE 10881 ','Amreli','Jammu','Tamil Nadu',509385,451954,1,'Worker','2014-02-02'),

    (19,'Kevin','Shelton','373-873-3486','ricejoshua@yahoo.com','1953-11-26','Others',83159,' Nguyen Prairie Suite 949Lake Thomasview, MN 37045 ','Kurukshetra','Firozabad','Jammu and Kashmir',636176,866631,1,'Worker','1974-11-26'),

    (20,'Taylor','King','669-315-5218','patricia17@gmail.com','1997-09-07','Male',35649,' Hodges Street Apt. 378South Bryan, CO 42246 ','Bhagalpur','Bikaner','West Bengal',669509,879308,9,'Worker','2018-09-07'),

    (22,'Joshua','Miller','601-690-9938','yangkelly@hotmail.com','2006-02-20','Female',755,' Pamela CliffLake Kimberlyville, TX 03336 ','Jangaon','kochi','Lakshadweep',864540,220790,5,'Category Head','2027-02-20'),
    
    (23,'Jordan','Rodriguez','764-185-3247','angelaford@yahoo.com','1962-06-27','Others',40892,' Barrera DrivesMooreview, NM 72983 ','Eluru','Dhanbad','Gujarat',017080,954232,7,'Category Head','1983-06-27'),

    (24,'Grace','Gill','765-496-8715','edward98@yahoo.com','1923-11-16','Male',435,' Anderson CrescentWest Jennifer, GA 41811 ','Aurangabad','Rajpur','Bihar',486370,539111,4,'Category Head','1944-11-16'),

    (25,'Johnny','Cisneros','612-522-6138','ryanwilliam@yahoo.com','1996-01-11','Others',733,' Harvey DivideEast Lauriebury, UT 50094 ','Bokaro','Cuttack','Gujarat',000003,803231,2,'Worker','2017-01-11'),

    (26,'Benjamin','Adams','546-838-9260','rubenjensen@gmail.com','1996-07-16','Female',044,' George Parkways Apt. 811Matthewsside, VA 76524 ','Thrissur','Aizwal','Maharashtra',584120,615973,6,'Worker','2017-07-16'),

    (27,'David','James','469-271-0336','nramos@hotmail.com','1966-08-07','Others',45643,' Sanders Underpass Suite 699Wesleyport, AZ 21787 ','Wayanad','Patiala','Nagaland',076720,388121,3,'Worker','1987-08-07'),

    (28,'Gary','Scott','807-586-0728','allen23@hotmail.com','1980-05-29','Male',4786, 'Box 4018APO AP 20341 ','Imphal East','Chandigarh','West Bengal',360111,430536,6,'Worker','2001-05-29'),

    (29,'Susan','Gallagher','148-235-6818','keithangelica@yahoo.com','1986-01-14','Female',03932,' Cody StravenueChristopherville, RI 89780 ','Aizawl','Korba','Gujarat',567323,339227,8,'Worker','2007-01-14'),

    (30,'Kathryn','Alvarez','571-372-4255','amberdean@yahoo.com','1999-05-25','Others',25130,' Bailey PineGarrisontown, CT 04672 ','Korba','Faridabad','Telangana',386317,661048,10,'Worker','2020-05-25'),

    (32,'Amanda','Taylor','835-754-3002','cnguyen@yahoo.com','1914-12-30','Female',53754,' Tonya LanePort Vanessa, GA 64159 ','Kiphire','Kollam','Manipur',699397,120104,6,'Category Head','1935-12-30'),

    (33,'Julie','Rodriguez','645-879-6181','simonkent@hotmail.com','1985-05-03','Female',68948,' Dixon Club Apt. 134North Katherineview, VA 12014 ','Nuapada','Latur','Nagaland',284745,342356,7,'Category Head','2006-05-03'),

    (34,'Christian','Ferguson','964-311-0556','tsteele@yahoo.com','1989-12-16','Others', 6661, 'Box 8031APO AE 51415 ','Pakyong','Navi Mumbai','Uttar Pradesh',649468,643998,4,'Category Head','2010-12-16'),

    (35,'Matthew','Williams','112-883-1703','jennifer88@yahoo.com','1960-11-25','Others',02134,' Jenny BridgeWhitefort, MS 12864 ','Solan','Arrah','Jammu and Kashmir',052823,726000,3,'Worker','1981-11-25'),
    
    (36,'Alyssa','Andrews','303-315-1163','shelley53@gmail.com','1928-04-16','Male',2644,' Chaney Mount Suite 654Steelemouth, OH 24590 ','Nagpur','Chandigarh','Delhi',145881,627601,9,'Worker','1949-04-16'),

    (37,'Andrea','Santana','372-205-2870','lward@gmail.com','2021-06-08','Female',0277,' John InletPort Ashleytown, WA 68496 ','Raipur','Panipat','Maharashtra',124975,168580,1,'Worker','2042-06-08'),

    (38,'Curtis','Gonzalez','984-589-0480','marilynjacobs@yahoo.com','2002-09-06','Male',867,' Nicole OverpassNorth Stephanieside, OK 27418 ','Raipur','Agartala','Rajasthan',278394,575876,7,'Worker','2023-09-06'),

    (39,'Kelly','Wells','380-339-6416','rebecca76@hotmail.com','2001-10-24','Others',213,' Byrd Mission Suite 882New Raymond, WV 32753 ','Ranchi','Bhopal','Maharashtra',495394,110624,1,'Worker','2022-10-24'),

    (40,'Sheri','Clark','358-378-6717','lthompson@hotmail.com','1948-06-24','Male',42233,' Ashley SquaresEast Robertfurt, CA 50245 ','Kurukshetra','Lucknow','Mizoram',451642,171982,2,'Worker','1969-06-24'),

    (42,'Michael','Glenn','919-004-5191','williamsalicia@hotmail.com','1950-10-19','Others',371,' Schultz Greens Apt. 153Port Daniel, MA 98461 ','Bokaro','Howrah','Uttar Pradesh',731461,950782,2,'Category Head','1971-10-19'),

    (43,'Terry','Holt','179-256-1764','lucas71@gmail.com','1953-03-06','Female',7959,' Lee Underpass Apt. 367West Joseph, CO 79612 ','Raipur','Korba','Mizoram',611010,655611,10,'Category Head','1974-03-06'),

    (44,'Andrew','Compton','663-740-0337','lewisamber@gmail.com','1934-11-04','Female',9046,' Brian Run Apt. 773East Ashley, OK 88786 ','Firozpur','Jaipur','Delhi',862126,355305,9,'Category Head','1955-11-04'),

    (45,'Jennifer','Barrett','771-417-2275','zthompson@yahoo.com','1928-02-27','Others',97924,' Keller GrovesSamanthaview, DE 64600 ','Balangir','Nagpur','Arunachal Pradesh',427517,871991,9,'Worker','1949-02-27'),

    (46,'Benjamin','Smith','107-623-9860','longanne@yahoo.com','1996-12-20','Female',431,' Joyce CliffsDerrickville, MA 85385 ','Palghar','Amritsar','Bihar',913364,253664,8,'Worker','2017-12-20'),

    (47,'David','Miller','697-053-2354','ryanshelly@gmail.com','1925-07-10','Female',705,' Shannon PassageWilliamsonside, AZ 21230 ','Senapati','Chennai','Orissa',995155,982868,6,'Worker','1946-07-10'),

    (48,'Tracey','Nelson','735-259-8002','cynthia93@hotmail.com','1993-02-27','Male',67874,' Washington InletChenstad, ID 50580 ','Akola','Jaipur','Uttar Pradesh',580747,742385,5,'Worker','2014-02-27'),

    (49,'Joshua','Mills','688-574-3314','walshvictor@hotmail.com','1951-02-15','Male',304,' Gardner Islands Suite 274North Kimberlyland, VA 51806 ','Patan','Jammu','Karnataka',599260,922672,5,'Worker','1972-02-15'),

    (50,'Bryan','Douglas','581-850-6012','rflores@gmail.com','2012-10-12','Others',07741,' Katelyn Port Apt. 354Livingstonland, NM 02077 ','Baksa','Guwahati','Mizoram',469338,681714,3,'Worker','2033-10-12');



create table Supervision(
eid int,
meid int,
primary key(eid, meid),
foreign key(meid) references Manager(meid),
foreign key(eid) references Employee(eid)
	on delete cascade
    on update cascade
);


Insert into Supervision values
(1,1),
(2,1),
(3,1),
(4,1),
(11,2),
(12,2),
(13,2),
(14,2),
(21,3),
(22,3),
(23,3),
(24,3),
(31,4),
(32,4),
(33,4),
(34,4),
(41,5),
(42,5),
(43,5),
(44,5);



create table Supervisor(
	superviser_eid int,
    supervisee_eid int,
    primary key(supervisee_eid),
    foreign key (superviser_eid) references Employee(eid),
    foreign key (supervisee_eid) references Employee(eid)
    on delete cascade
    on update cascade
);

Insert into Supervisor values
(2,5),
(2,6),
(3,7),
(3,8),
(4,9),
(4,10),
(2,15),
(2,16),
(3,17),
(3,18),
(4,19),
(4,20),
(2,25),
(2,26),
(3,27),
(3,28),
(4,29),
(4,30),
(2,35),
(2,36),
(3,37),
(3,38),
(4,39),
(4,40),
(2,45),
(2,46),
(3,47),
(3,48),
(4,49),
(4,50);


create table CatHead(
cheid int primary key,
catid int not null,
foreign key (cheid) references Employee(eid),
foreign key (catid) references Category(catid)
on delete cascade
on update cascade
);

-- 1,11,21,31,41 -> Manager ID
insert into CatHead Values
(2,1),(3,2),(4,3),(12,1),(13,2),(14,3),(22,1),(23,2),(24,3),(32,1),(33,2),(34,3),(42,1),(43,2),(44,3);



create table Worker(
weid int primary key,
catid int not null,
foreign key (weid) references Employee(eid),
foreign key (catid) references Category(catid)
on delete cascade
on update cascade
);

insert into Worker Values
(5,1),(6,1),(7,2),(8,2),(9,3),(10,3),(15,1),(16,1),(17,2),(18,2),(19,3),(20,3),(25,1),(26,1),(27,2),(28,2),(29,3),(30,3),(35,1),(36,1),(37,2),(38,2),(39,3),(40,3),(45,1),(46,1),(47,2),(48,2),(49,3),(50,3);


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

insert into Views values
('2001-01-21 15:43:09',1,1),
('2001-01-21 15:10:09',2,1),
('2003-01-21 15:06:16',3,3),
('2003-01-21 15:57:15',4,2),
('2002-02-21 15:24:12',7,1),
('2002-02-21 15:36:13',8,3),
('2004-02-21 11:37:13',7,2),
('2004-02-21 11:22:11',6,1),
('2005-03-21 07:52:19',4,2),
('2005-03-21 07:58:13',2,3),
('2006-03-21 09:10:01',23,2),
('2006-03-21 09:37:12',13,1),
('2010-04-21 10:44:01',34,2),
('2010-04-21 10:28:34',13,3),
('2013-04-23 16:52:12',43,2),
('2013-04-21 16:41:09',23,2),
('2011-05-24 17:53:08',25,1),
('2011-05-21 17:04:06',12,1),
('2022-05-26 17:26:09',14,2),
('2022-05-21 17:26:14',3,3),
('2017-06-02 22:41:19',22,3),
('2017-06-21 22:09:45',2,2),
('2019-06-21 14:59:34',23,2),
('2019-06-21 14:30:45',43,2),
('2019-07-21 09:39:13',12,1),
('2018-07-21 09:00:34',32,1),
('2015-07-21 10:05:45',21,2),
('2015-07-21 10:28:11',32,2),
('2010-08-18 10:37:15',3,3),
('2010-08-14 10:51:17',3,1),
('2015-08-16 15:43:01',1,2),
('2015-08-15 15:51:03',8,2),
('2008-09-14 18:36:07',9,3),
('2008-09-13 18:59:23',5,1),
('2019-09-12 16:25:43',2,3),
('2019-09-11 16:25:23',13,2),
('2011-10-21 20:48:06',32,1),
('2011-10-21 20:22:23',21,3),
('2013-11-21 08:47:12',22,3),
('2013-11-21 08:34:09',14,1);



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

insert into Corders values
(1, 1, '1000-01-01', '1000-01-01', false, 0),
(2, 2, '1000-01-01', '1000-01-01', false, 0),
(3, 3, '1000-01-01', '1000-01-01', false, 0),
(4, 4, '1000-01-01', '1000-01-01', false, 0),
(5, 5, '1000-01-01', '1000-01-01', false, 0),
(6, 6, '1000-01-01', '1000-01-01', false, 0),
(7, 7, '1000-01-01', '1000-01-01', false, 0),
(8, 8, '1000-01-01', '1000-01-01', false, 0),
(9, 9, '1000-01-01', '1000-01-01', false, 0),
(10, 10, '1000-01-01', '1000-01-01', false, 0),
(11, 11, '1000-01-01', '1000-01-01', false, 0),
(12, 12, '1000-01-01', '1000-01-01', false, 0),
(13, 13, '1000-01-01', '1000-01-01', false, 0),
(14, 14, '1000-01-01', '1000-01-01', false, 0),
(15, 15, '1000-01-01', '1000-01-01', false, 0),
(16, 16, '1000-01-01', '1000-01-01', false, 0),
(17, 17, '1000-01-01', '1000-01-01', false, 0),
(18, 18, '1000-01-01', '1000-01-01', false, 0),
(19, 19, '1000-01-01', '1000-01-01', false, 0),
(20, 20, '1000-01-01', '1000-01-01', false, 0),
(21, 21, '1000-01-01', '1000-01-01', false, 0),
(22, 22, '1000-01-01', '1000-01-01', false, 0),
(23, 23, '1000-01-01', '1000-01-01', false, 0),
(24, 24, '1000-01-01', '1000-01-01', false, 0),
(25, 25, '1000-01-01', '1000-01-01', false, 0),
(26, 26, '1000-01-01', '1000-01-01', false, 0),
(27, 27, '1000-01-01', '1000-01-01', false, 0),
(28, 28, '1000-01-01', '1000-01-01', false, 0),
(29, 29, '1000-01-01', '1000-01-01', false, 0),
(30, 30, '1000-01-01', '1000-01-01', false, 0),
(31, 31, '1000-01-01', '1000-01-01', false, 0),
(32, 32, '1000-01-01', '1000-01-01', false, 0),
(33, 33, '1000-01-01', '1000-01-01', false, 0),
(34, 34, '1000-01-01', '1000-01-01', false, 0),
(35, 35, '1000-01-01', '1000-01-01', false, 0),
(36, 36, '1000-01-01', '1000-01-01', false, 0),
(37, 37, '1000-01-01', '1000-01-01', false, 0),
(38, 38, '1000-01-01', '1000-01-01', false, 0),
(39, 39, '1000-01-01', '1000-01-01', false, 0),
(40, 40, '1000-01-01', '1000-01-01', false, 0),
(41, 41, '1000-01-01', '1000-01-01', false, 0),
(42, 42, '1000-01-01', '1000-01-01', false, 0),
(43, 43, '1000-01-01', '1000-01-01', false, 0),
(44, 44, '1000-01-01', '1000-01-01', false, 0),
(45, 45, '1000-01-01', '1000-01-01', false, 0),
(46, 46, '1000-01-01', '1000-01-01', false, 0),
(47, 47, '1000-01-01', '1000-01-01', false, 0),
(48, 48, '1000-01-01', '1000-01-01', false, 0),
(49, 49, '1000-01-01', '1000-01-01', false, 0),
(50, 50, '1000-01-01', '1000-01-01', false, 0),
(51, 1, '2021-07-01', '2021-07-10', true, 241140),
(52, 2, '2021-07-03', '2021-07-12', true, 2400),
(53, 4, '2021-07-12', '2021-07-21', true, 11000),
(54, 1, '2021-07-13', '2021-07-22', true, 6400),
(55, 3, '2021-07-15', '2021-07-26', true, 4200),
(56, 1, '2021-08-05', '2021-08-14', true, 7000),
(57, 7, '2021-08-08', '2021-08-17', true, 22900),
(58, 8, '2021-08-10', '2021-08-19', true, 2400),
(59, 10, '2021-08-11', '2021-08-20', true, 8000),
(60, 13, '2021-08-14', '2021-08-23', true, 3600),
(61, 15, '2021-09-14', '2021-09-23', true, 336497),
(62, 18, '2021-10-02', '2021-10-11', true, 25400),
(63, 19, '2021-10-23', '2021-10-31', true, 9000),
(64, 21, '2021-10-24', '2021-11-1', true, 148950),
(65, 31, '2021-12-25', '2021-12-31', true, 265800),
(66, 11, '2021-12-25', '2022-01-01', true, 8450),
(67, 16, '2022-01-01', '2022-01-10', true, 3400),
(68, 6, '2022-01-01', '2022-01-8', true, 1200),
(69, 9, '2022-01-23', '2022-01-31', true, 1000),
(70, 1, '2022-01-22', '2022-01-28', true, 40640),
(71, 11, '2022-01-26', '2022-02-01', true, 64000),
(72, 13, '2022-02-26', '2022-03-04', false, 28000),
(73, 1, '2022-02-27', '2022-03-08', false, 78850),
(74, 22, '2022-02-27', '2022-03-08', false, 550999),
(75, 13, '2022-02-28', '2022-03-07', false, 4800);


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

insert into Cart values

(51, 28, 6, 241140, '2019-12-21', true),
(52, 16, 4, 2400, 'Red | Female | 6', true),
(53, 16, 9, 5400, 'Red | Female | 6', true),
(54, 20, 8, 6400, 'Black | Male | 6', true),
(55, 14, 7, 4200, 'Orange | Female | 6', true),
(56, 29, 7, 7000, '2021-01-21', true),
(57, 17, 2, 1000, 'Pink | Female | 8', true),
(60, 14, 6, 3600, 'Orange | Female | 6', true),
(67, 26, 3, 21900, '2020-02-26', true),
(71, 12, 2, 600, 'Blue | Female | 8', true),
(59, 8, 2, 8000, 'Green | Female | M', true),
(53, 7, 7, 5600, 'black | male | M', true),
(58, 15, 6, 2400, 'Brown | Male | 7', true),
(61, 27, 7, 336497, '2020-06-25', true),
(66, 19, 4, 4000, 'Black | Female | 7', true),
(65, 25, 3, 219000, '2021-02-12', true),
(62, 8, 6, 24000, 'Green | Female | M', true),
(62, 15, 1, 400, 'Brown | Male | 7', true),
(74, 29, 1, 1000, '2021-01-21', true),
(62, 24, 1, 11000, '2015-05-01', true),
(63, 29, 9, 9000, '2021-01-21', true),
(67, 5, 4, 2800, 'Blue | Male | L', true),
(70, 15, 8, 3200, 'Brown | Male | 7', true),
(64, 22, 9, 148950, '2013-01-01', true),
(65, 16, 5, 3000, 'Red | Female | 6', true),
(66, 11, 5, 4450, 'Black | Male | 10', true),
(71, 18, 9, 36000, 'Grey | Male | 9', true),
(68, 12, 4, 1200, 'Blue | Female | 8', true),
(72, 29, 4, 4000, '2021-01-21', true),
(69, 9, 1, 1000, 'Black | Male | XL', true),
(70, 23, 4, 37440, '2015-05-25', true),
(71, 8, 7, 28000, 'Green | Female | M', true),
(72, 18, 6, 24000, 'Grey | Male | 9', true),
(73, 5, 2, 1400, 'Blue | Male | L', true),
(75, 14, 8, 4800, 'Orange | Female | 6', true),
(74, 21, 1, 549999, '2020-12-27', true),
(73, 11, 5, 4450, 'Black | Male | 10', true),
(65, 26, 6, 43800, '2020-02-26', true),
(67, 14, 1, 600, 'Orange | Female | 6', true),
(73, 25, 1, 73000, '2021-02-12', true);


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



insert into Transactions values
(1, 51, false, '2021-07-01 15:43:00', 'UPI'),
(2, 51, true, '2021-07-01 15:10:00', 'UPI'),
(3, 52, true, '2021-07-03 15:06:00', 'UPI'),
(4, 53, true, '2021-07-21 15:57:00', 'UPI'),
(5, 54, true, '2021-07-13 15:24:00', 'UPI'),
(6, 55, true, '2021-07-26 15:36:00', 'COD'),
(7, 56, false, '2021-08-05 11:37:00', 'UPI'),
(8, 56, true, '2021-08-05 11:22:00', 'UPI'),
(9, 57, true, '2021-08-17 07:52:00', 'COD'),
(10, 58, true, '2021-08-10 07:58:00', 'UPI'),
(11, 59, true, '2021-08-11 09:10:00', 'UPI'),
(12, 60, true, '2021-08-14 09:37:00', 'UPI'),
(13, 61, false, '2021-09-14 10:44:00', 'UPI'),
(14, 61, true, '2021-09-14 10:28:00', 'UPI'),
(15, 62, true, '2021-10-02 16:52:00', 'UPI'),
(16, 63, true, '2021-01-31 16:41:00', 'COD'),
(17, 64, true, '2021-10-24 17:53:00', 'UPI'),
(18, 65, false, '2021-12-25 17:04:00', 'UPI'),
(19, 65, true, '2021-12-25 17:26:00', 'UPI'),
(20, 66, true, '2021-12-25 22:41:00', 'UPI'),
(21, 67, true, '2022-01-01 22:09:00', 'UPI'),
(22, 68, true, '2022-01-01 14:59:00', 'UPI'),
(23, 69, true, '2022-01-31 14:30:00', 'COD'),
(24, 70, false, '2022-01-22 09:39:00', 'UPI'),
(25, 70, true, '2022-01-22 09:00:00', 'UPI'),
(26, 71, true, '2022-01-26 10:05:00', 'UPI'),
(27, 72, true, '2022-02-26 10:28:00', 'UPI'),
(28, 73, true, '2022-03-08 10:37:00', 'COD'),
(29, 74, true, '2022-02-27 10:51:00', 'UPI'),
(30, 75, false, '2022-02-28 15:43:00', 'UPI'),
(31, 75, true, '2022-02-28 15:51:00', 'UPI');


create table DeliveryPerson(
cordid int primary key,
deid int,
foreign key(cordid) references Corders(cordid),
foreign key(deid) references Employee(eid)
on delete cascade
on update cascade
);

insert into DeliveryPerson values
(51,1),
(52,1),
(53,1),
(54,1),
(55,1),
(56,11),
(57,11),
(58,11),
(59,11),
(60,11),
(61,21),
(62,21),
(63,21),
(64,21),
(65,31),
(66,31),
(67,31),
(68,31),
(69,31),
(70,31),
(71,41),
(72,41),
(73,41),
(74,41),
(75,41);

create table login(
loginID int not null, check(loginID >= 0),
usertype varchar(20) not null, check ( usertype in('customer','manager','employee')),
pasword varchar(12) not null, check (LENGTH(pasword) >= 6 and LENGTH(pasword) <= 12),
primary key (loginID,usertype)
);


Insert Into login values
(1,'employee','aDA<9TV,'),
(2,'employee','xvT5~y+!'),
(3,'employee','D[H-i''#}'),
(4,'employee','Fo*zQ7~/'),
(5,'employee',',I.mCO''02'),
(6,'employee','[R?cqAD|'),
(7,'employee','XspItZ.+'),
(8,'employee','i}jX"_!w'),
(9,'employee','ahMm~[f6'),
(10,'employee','aX<''hk97'),
(11,'employee','%!ibqT+P'),
(12,'employee','#0l=fK"['),
(13,'employee','%^~D&}I'),
(14,'employee','[!]Tk@o4'),
(15,'employee','v<24]rF6'),
(16,'employee','o#[iWp7V'),
(17,'employee','dX>h/KE9'),
(18,'employee',';4/>b8ra'),
(19,'employee','&,n=3o_J'),
(20,'employee','6)9]Cw%K' ),
(21,'employee','f\\)jr*v9'),
(22,'employee','{BX@faH%'),
(23,'employee','Y=|RGjkv'),
(24,'employee','Y@gjQ,[f'),
(25,'employee',':,(2uQI@'),
(26,'employee','6W:b;hw@'),
(27,'employee','uLe?MSI'),
(28,'employee','|Bxadt6q'),
(29,'employee','9]3G*aNX'),
(30,'employee','xkC($-M8'),
(31,'employee','Sfq:78y'),
(32,'employee','I{iw@Jzp'),
(33,'employee','iEc)&"a['),
(34,'employee','+G]}Zd*&'),
(35,'employee','[ce7T2HF'),
(36,'employee','|C:R^_G%'),
(37,'employee','gT\\05GL2'),
(38,'employee',':\\BP/h0~'),
(39,'employee','e(uc"dmU'),
(40,'employee','IaTUet:('),
(41,'employee','k2t1wFHK'),
(42,'employee','|''SV^E7-'),
(43,'employee','.Q#7t(be'),
(44,'employee',')"Zg?^''G'),
(45,'employee','q?4@#o>{'),
(46,'employee','J%m9MGKD'),
(47,'employee','UBqx;}.5'),
(48,'employee','f(g''t:.@'),
(49,'employee',')JUS:P[='),
(50,'employee','zLCy;I(D'),
(1,'manager','6)9]Cw%K'),
(2,'manager','2[^,Jyd*'),
(3,'manager','`BXS}c_N'),
(4,'manager','-EA[#n@^'),
(5,'manager','yQJ-l5Az'),
(1,'customer','tJ`ErY39'),
(2,'customer','&60j2.yA'),
(3,'customer','QBHkTp'),
(4,'customer','6M@`u={5'),
(5,'customer','<heE1z>T'),
(6,'customer','xvbR@"<8'),
(7,'customer','><h-koca'),
(8,'customer','|,):O%('),
(9,'customer','UO=yhme'),
(10,'customer','s9DQh$0'),
(11,'customer','P\\u=aB9m'),
(12,'customer','&b\\LnM-E'),
(13,'customer','9S0%"O`('),
(14,'customer','%=zwQ_9U'),
(15,'customer','uI5?rk(q'),
(16,'customer','x>kMKIH'),
(17,'customer','5^sed9!*'),
(18,'customer','5''DRYK}L'),
(19,'customer','Y[t7n2$H'),
(20,'customer','Hktq]Ud'),
(21,'customer','Z(]^;Hwb'),
(22,'customer','m8Ft_Xes'),
(23,'customer','m&j;e.Y1'),
(24,'customer',':)zW!]^7'),
(25,'customer','@._*%[y`'),
(26,'customer','*p3Kz4\\t'),
(27,'customer','>''SBzv]~'),
(28,'customer','?f9e,Ft-'),
(29,'customer','nH!I=@/q'),
(30,'customer','RnAJXq-a'),
(31,'customer','qtzfDFQ_'),
(32,'customer','yKS@ETQn'),
(33,'customer','P>T:Sm$W'),
(34,'customer','ZUa:*-7i'),
(35,'customer','\\VNhBdt='),
(36,'customer','~?MED&+v'),
(37,'customer','h?e4jZu'),
(38,'customer','9J%=a4yP'),
(39,'customer','k*3Aw7lE'),
(40,'customer','Ykx~H!K'),
(41,'customer','@p}n#y.V'),
(42,'customer','n?^&\\QE|'),
(43,'customer','<fI9{JR1'),
(44,'customer','BdAk8#tE'),
(45,'customer','U-\\^fz@>'),
(46,'customer',';OMVph8z'),
(47,'customer','XbFQBd<$'),
(48,'customer','mX:%/FI`'),
(49,'customer','FfKhHm95'),
(50,'customer','8!fpw5yQ');




-- Ques-1: 
select fname, lname from Customer
where uid in ( select uid from Corders
				where cordid in (select cordid from Cart
								where pdid in ( select Products.pdid from Products, Clothes
												where Clothes.pdid = Products.pdid and Clothes.color = 'blue'
                                                )
								)
				);


-- Ques2
select * from Employee
where eid in( select deid from DeliveryPerson , Corders 
				where DeliveryPerson.cordid = Corders.cordid and
                dateoforderplaced = '2021-07-F01'
                );
                


-- Ques-3:
select fname, lname, phone from Customer
where uid in( select uid from Corders
			  where cordid in ( select  cordid from Transactions
								where paymentmethod = 'COD'
							)
			);


-- Ques-4:
select weid from Worker join Category on Worker.catid = Category.catid and Category.catname = 'EAppliances';


-- Ques-5:
select * from Vendor
where venid in ( select venid from Distributes
				 where invenid in ( select invenid from Inventory
									where state = 'Chandigarh'
								)
				);
                
                
-- Ques-6:
select  email from Employee 
where speciality = 'Worker';


-- Ques-7:
create view SmallFootwears as
select Products.pdid, Products.name from Products join Footwears on Products.pdid  = Footwears.pdid and Footwears.size < 7;
select * from SmallFootwears;


-- Ques-8:
select speciality, AVG(salary) as average_salary 
from Employee 
group by speciality;
								
-- Ques-9            
select fname, lname, phone, Corders.cordid, timstamp  from Customer,Corders,Transactions
where Customer.uid=Corders.uid and Corders.cordid = Transactions.cordid and ofStatus=false;				


-- Ques-10:
select bid, count(Products.sellingprice*Batch.quantity) as subtotal from Batch, Products
where  Batch.pdid = Products.pdid
group by invid;


-- Ques-11 
select tid from Transactions
where timstamp < '2022-02-15 00:00:00' and paymentmethod = 'UPI';





