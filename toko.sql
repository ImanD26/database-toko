create database toko;
use toko;

create table customer
(
customerid char(5),
customername varchar(255) not null,
address varchar(255) not null,
email varchar(255),
phonenumber char(12) ,
constraint pk_customerid primary key(customerid),
constraint u_email unique(email),
constraint u_custphone unique(phonenumber),
constraint c_email check(email regexp '^[[:alnum:]]+(@gmail.com|@yahoo.com)$'),
constraint c_customerphone check(phonenumber regexp '[0-9]{12}'),
constraint c_customeraddress check(address like '%Street'),
constraint c_customerid check(customerid regexp '^CS[0-9]{3}$')
);

create table job
(
jobid char(5),
jobname varchar(255) not null,
salary int not null,
constraint pk_itemid primary key(jobid),
constraint c_jobid check(jobid regexp '^JB[0-9]{3}$')
);

create table supplier
(
supplierid char(5),
suppliername varchar(255),
supplierphone char(12),
constraint pk_supplierid primary key(supplierid),
constraint c_supplierphone check(supplierphone regexp '[0-9]{12}$'),
constraint c_supplierid check(supplierid regexp '^SP[0-9]{3}$'),
constraint u_supplierphone unique(supplierphone)
);

create table itemtype
(
itemtypeid char(5),
itemtypename varchar(255) not null,
constraint pk_itemid primary key(itemtypeid),
constraint c_itemtypeid check(itemtypeid regexp '^IT[0-9]{3}$')
);

create table item
(
itemid char(5),
itemname varchar(255) not null,
price int not null,
itemtypeid char(5),
constraint pk_itemid primary key(itemid),
constraint fk_itemtype foreign key(itemtypeid) references itemtype(itemtypeid) on delete cascade,
constraint c_itemid check(itemid regexp '^IM[0-9]{3}$')
);

create table staff
(
staffid char(5),
staffname varchar(255) not null,
dob date  not null,
age integer not null,
address varchar(255) not null,
email varchar(255) ,
phonenumber char(12) ,
gender char(1) not null,
NIK char(16) not null,
jobid char(5) not null,
constraint pk_staffid primary key(staffid),
constraint c_staffid check(staffid regexp '^ST[0-9]{3}$'),
constraint fk_jobid foreign key(jobid) references job(jobid),
constraint c_staffaddress check(address like '%Street'),
constraint c_age check(age >0),
constraint c_customeremail check(email regexp '^[[:alnum:]]+(@gmail.com|@yahoo.com)$'),
constraint c_staffphone check(phonenumber regexp '[0-9]{12}'),
constraint c_staffNIK check(NIK regexp '[0-9]{16}'),
constraint c_gender check(gender in('M','F')),
CONSTRAINT u_nik unique(NIK),
constraint u_staffemail unique(email),
constraint u_staffphone unique(phonenumber)
);

create table supplytransaction
(
transactionid char(5),
supplydate date  not null,
staffid char(5) not null,
supplierid char(5) not null,
constraint pk_transactionid primary key(transactionid),
constraint fk_supply_staffid foreign key(staffid) references staff(staffid),
constraint fk_supply_supplierid foreign key(supplierid) references supplier(supplierid),
constraint c_transid check(transactionid regexp '^TR[0-9]{3}$')
);

create table purchase
(
purchaseid char(5),
purchasedate date  not null,
staffid char(5) not null,
customerid char(5) not null,
constraint pk_purchaseid primary key(purchaseid),
constraint c_purchaseid check(purchaseid regexp '^PU[0-9]{3}$'),
constraint fk_purchase_staffid foreign key(staffid) references staff(staffid),
constraint fk_purchases_customerid foreign key(customerid) references customer(customerid)
);

create table detailpurchase
(
purchaseid char(5),
itemid char(5),
purchasequantity int not null,
purchaseprice int not null,
constraint pk_item_purchase primary key(purchaseid,itemid),
constraint c_pqty check(purchasequantity >0),
constraint fk_purchaseid foreign key(purchaseid) references purchase(purchaseid) on delete cascade,
constraint fk_purchase_itemid foreign key(itemid) references item(itemid) on delete cascade
);

create table detailsupplytransaction
(
transactionid char(5),
itemid char(5),
supplyquantity int not null,
price int not null,
constraint pk_item_supply primary key(transactionid,itemid),
constraint c_sqty check(supplyquantity >0),
constraint fk_suply_purchaseid foreign key(transactionid) references supplytransaction(transactionid) on delete cascade,
constraint fk_supply_itemid foreign key(itemid) references item(itemid) on delete cascade
);


insert into itemtype values
('IT001','Frozen Food'),
('IT002','Beverage'),
('IT003','Snack'),
('IT004','Dairy Product'),
('IT005','Instant Food'),
('IT006','Seasoning'),
('IT007','Raw Meat'),
('IT008','Utensils'),
('IT009','Cleaning Product'),
('IT010','Hygene Product');

insert into item values
('IM001','Keju Kraft Quick Melt',10000,'IT004'),
('IM002','Kecap Bango 550Ml',21000,'IT006'),
('IM003','Potabee BBQ',11000,'IT003'),
('IM004','Coca-Cola 1L',20000,'IT002'),
('IM005','Indomie Goreng',4000,'IT005'),
('IM006','SuperPell Fresh Apple',20000,'IT009'),
('IM007','Pisau Aluminium',20000,'IT008'),
('IM008','Nuvo Sabun Batang Mild',20000,'IT010'),
('IM009','Zinc Lemon Mint Shampoo',20000,'IT010'),
('IM010','Daging Giling',24000,'IT007'),
('IM011','Walls Metropolitan Ice Cream',12000,'IT004'),
('IM012','Fiesta Chicken Nugget',25000,'IT001'),
('IM013','Milo 1Kg',75000,'IT005');

insert into customer values
('CS001','Jeff','22 Jump Street','mynamejeff@gmail.com','083344580012'),
('CS002','Nina','10 Turnip Street','nina10@gmail.com','081245992341'),
('CS003','Bobby','77 High Street','bobby@gmail.com','499019451488'),
('CS004','Amon Gus','Sus Street','impostor@gmail.com','081134428899'),
('CS005','Bofa','Ligma Street','sugma@gmail.com','420420696969');

insert into job values
('JB001','Worker','3000000'),
('JB002','Cashier','4000000'),
('JB003','Manager','80000000'),
('JB004','CEO','20000000');

insert into staff values
('ST001','Patrick','1988-02-11',33,'69 Black Street','pat1@gmail.com','518095864580','M','3216017428359106','JB004'),
('ST002','Lorelei','1982-04-12',39,'68 Purple Street','porelei12@gmail.com','235569691288','F','3216016010010002','JB003'),
('ST003','Sandy','1982-04-21',39,'66 Purple Street','sandy214@yahoo.com','234469831277','F','3216011068532974','JB003'),
('ST004','Timothy','1988-08-10',33,'155 White Street','tim10@gmail.com','577353676181','M','3216010391824576','JB001'),
('ST005','Jimothy','1998-12-01',23,'11 White Street','jim1@gmail.com','633183977957','M','3216016421089735','JB001'),
('ST006','Helga','2001-07-07',22,'144 Blue Street','helga01@yahoo.com','724062590875','F','3216010789645213','JB001'),
('ST007','Michael','1987-01-18',34,'122 Blue Street','mike87@gmail.com','488221409601','M','3216010378461295','JB001'),
('ST008','Sarah','1975-03-13',48,'111 Blue Street','sarah1@gmail.com','034231795207','F','3216019720361485','JB002'),
('ST009','Joe','1970-02-01',53,'1 Gottem Street','joemama@yahoo.com','625155259884','M','3216014637158029','JB002'),
('ST010','Akshan','1981-07-22',42,'12 Shurima Street','akshan156@gmail.com','752788331473','M','3216010020011111','JB002');

insert into supplier values
('SP001','Indofood','624806854886'),
('SP002','Wings','023502902081'),
('SP003','Kraft','387648707137'),
('SP004','Coca-Cola','887299317310'),
('SP005','Nestle','846571088957'),
('SP006','Walls','599005780737'),
('SP007','Fiesta','898358286734'),
('SP008','Utensil Master','689885438887'),
('SP009','Unilever','021021021021'),
('SP010','Ternak Pak Ordis','021888666735');

insert into supplytransaction values
('TR001','2021-01-01','ST009','SP001'),
('TR002','2021-01-02','ST009','SP002'),
('TR003','2021-01-02','ST008','SP002'),
('TR004','2021-01-02','ST010','SP003'),
('TR005','2021-01-03','ST009','SP004'),
('TR006','2021-01-03','ST008','SP005'),
('TR007','2021-01-03','ST010','SP006'),
('TR008','2021-01-04','ST009','SP007'),
('TR009','2021-01-04','ST008','SP008'),
('TR010','2021-01-04','ST010','SP009'),
('TR011','2021-01-05','ST009','SP010');

insert into detailsupplytransaction values
('TR001','IM005',200,2000),
('TR002','IM003',50,8000),
('TR002','IM006',20,18000),
('TR002','IM008',30,16000),
('TR003','IM009',30,16000),
('TR004','IM001',30,9000),
('TR005','IM004',50,16000),
('TR006','IM013',15,70000),
('TR007','IM011',20,10000),
('TR008','IM012',15,22000),
('TR009','IM007',10,18000),
('TR010','IM002',20,19000),
('TR011','IM010',15,20000);

insert into purchase values
('PU001','2021-12-01','ST009','CS001'),
('PU002','2021-12-01','ST008','CS002'),
('PU003','2021-12-02','ST010','CS003'),
('PU004','2021-12-02','ST009','CS004'),
('PU005','2021-12-03','ST008','CS005');

INSERT INTO detailpurchase values
('PU001','IM001',3,10000),
('PU001','IM002',1,20000),
('PU001','IM003',3,11000),
('PU001','IM004',5,20000),
('PU001','IM005',2,4000),
('PU002','IM006',2,20000),
('PU002','IM001',3,10000),
('PU003','IM011',3,12000),
('PU003','IM010',3,24000),
('PU003','IM009',3,20000),
('PU004','IM007',3,20000),
('PU004','IM008',4,20000),
('PU004','IM009',2,20000),
('PU004','IM001',3,10000),
('PU005','IM001',3,10000),
('PU005','IM002',3,20000),
('PU005','IM006',1,20000),
('PU005','IM011',2,12000),
('PU005','IM010',2,24000);


DELIMITER $$ 
CREATE  PROCEDURE get_item(IN p_itemtypename varchar(100))  
BEGIN  
    SELECT 
	itemname,
    b.itemid,
    b.price,
    ifnull((supplyquantity),0)-ifnull(sum(purchasequantity),0) stock  
	FROM itemtype a 
    inner join item b on a.itemtypeid=b.itemtypeid
    left join detailpurchase c on c.itemid=b.itemid
    left join purchase d on d.purchaseid=c.purchaseid
    inner join detailsupplytransaction e on e.itemid=b.itemid
    where  itemtypename= p_itemtypename
    group by itemname;
END $$  
DELIMITER ;  

DELIMITER $$ 
CREATE  PROCEDURE get_itemname(in p_itemname varchar(255))  
BEGIN  
    SELECT itemname,
		   a.itemid,
           a.price,
           ifnull((supplyquantity),0)-ifnull(sum(purchasequantity),0) stock 
	from item a
    left join detailpurchase b on b.itemid=a.itemid 
    inner join detailsupplytransaction c on c.itemid=a.itemid 
    inner join supplytransaction d on d.transactionid=c.transactionid
    where itemname=p_itemname
    group by itemname;
END $$  
DELIMITER ; 

DELIMITER $$ 
CREATE  PROCEDURE show_unpurchased_item()  
BEGIN  
    SELECT itemname,price  FROM item 
    where  itemid not in(select itemid from detailpurchase);
END $$  
DELIMITER ;  

DELIMITER $$ 
CREATE  PROCEDURE show_order_price()  
BEGIN  
    SELECT customername,
		    b.purchaseid,
            purchasedate,
            sum(purchasequantity*purchaseprice) as totalorder
    FROM 	customer a
    inner join purchase b on a.customerid=b.customerid
    inner join detailpurchase c on c.purchaseid=b.purchaseid
    group by customername,b.purchaseid,purchasedate;
END $$  
DELIMITER ;  

DELIMITER $$ 
CREATE  PROCEDURE show_staff(in p_jobname varchar(255))  
BEGIN  
    SELECT staffname,
		   jobname,
           age,
           gender,
           address
	from staff a 
    inner join job b on a.jobid=b.jobid
    where jobname=p_jobname;
END $$  
DELIMITER ;  

DELIMITER $$ 
CREATE  PROCEDURE show_total_payment_to_supplier()  
BEGIN  
    SELECT suppliername,
    sum(supplyquantity*price) as cost
FROM supplier a
    inner join supplytransaction b on a.supplierid=b.supplierid
    inner join detailsupplytransaction c on b.transactionid=c.transactionid 
    group by suppliername;
END $$  
DELIMITER ;  

DELIMITER $$ 
CREATE  PROCEDURE total_expected_profit_from_item()  
BEGIN  
    select itemname,
		   sum(a.price*supplyquantity)-sum(supplyquantity*b.price) as expected_profit
	from item a
    inner join detailsupplytransaction b on a.itemid=b.itemid
    inner join supplytransaction c on c.transactionid=b.transactionid
    group by itemname;
END $$  
DELIMITER ;  

select * from itemtype;
select * from item;
select * from detailsupplytransaction;
select * from purchase;
select * from detailpurchase;
select * from customer;
select * from supplier;
select * from supplytransaction;
select * from staff;
select * from job;

call get_item('Hygene Product');
call get_itemname('Coca-cola 1l');
call show_unpurchased_item();
call show_order_price() ;
call show_staff('Worker');
call show_total_payment_to_supplier();
call total_expected_profit_from_item();

