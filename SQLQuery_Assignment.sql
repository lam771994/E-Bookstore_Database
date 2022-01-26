---Data Definition Language---

--Create database
CREATE DATABASE Bookstore;
USE Bookstore;

--Create tables
--*Publisher's Management*--
CREATE TABLE Publisher
(PublisherID nvarchar(50) NOT NULL PRIMARY KEY,
Pub_Name nvarchar(50),
Pub_ContactNumber nvarchar(50),
Pub_address nvarchar(150),
Pub_Email nvarchar(50));

CREATE TABLE Book_list
(Book_listID nvarchar(50) NOT NULL PRIMARY KEY,
Book_title nvarchar(50),
Category nvarchar(50),
Quantity INT,
Price DECIMAL(15,2),
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID));

CREATE TABLE Invoice
(InvoiceID nvarchar(50) NOT NULL PRIMARY KEY,
Inv_date DATE,
Total_amount DECIMAL(30,2),
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID));

CREATE TABLE Invoice_item
(Inv_ItemID nvarchar(50) NOT NULL PRIMARY KEY,
Book_quantity INT,
Total_Price DECIMAL(15,2),
Book_listID nvarchar(50) FOREIGN KEY REFERENCES Book_list(Book_listID),
InvoiceID nvarchar(50) FOREIGN KEY REFERENCES Invoice(InvoiceID));

--*APU Internal Management*--
CREATE TABLE Manager
(ManagerID nvarchar(50) NOT NULL PRIMARY KEY,
Name nvarchar(50),
Manager_ContactNumber nvarchar(50),
Manager_Email nvarchar(50));

CREATE TABLE Order_to_Publishers
(OrdertoP_ID nvarchar(50) NOT NULL PRIMARY KEY,
Order_date DATE,
Total_Amount DECIMAL(30,2),
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID),
ManagerID nvarchar(50) FOREIGN KEY REFERENCES Manager(ManagerID));

CREATE TABLE OrdertoP_item
(OrdertoP_ItemID nvarchar(50) NOT NULL PRIMARY KEY,
Book_Quantity INT,
Total_Price DECIMAL(15,2),
OrdertoP_ID nvarchar(50) FOREIGN KEY REFERENCES Order_to_Publishers(OrdertoP_ID),
Book_listID nvarchar(50) FOREIGN KEY REFERENCES Book_list(Book_listID));

CREATE TABLE Account_Department
(Acc_ID nvarchar(50) NOT NULL PRIMARY KEY,
Acc_Name nvarchar(50),
Acc_ContactNumber nvarchar(50),
Acc_Email nvarchar(50),
InvoiceID nvarchar(50) FOREIGN KEY REFERENCES Invoice(InvoiceID));

--*Bookstore's Management*--
CREATE TABLE Category
(CategoryID nvarchar(50) NOT NULL PRIMARY KEY,
Category_Name nvarchar(50),
Subcategory nvarchar(50));

CREATE TABLE Book_instore
(BookID nvarchar(50) NOT NULL PRIMARY KEY,
Book_SerialNo nvarchar(50),
Book_Title nvarchar(50),
Book_Quantity INT,
Book_Price DECIMAL(15,2),
CategoryID nvarchar(50) FOREIGN KEY REFERENCES Category(CategoryID),
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID));

--*Member's Management*--
CREATE TABLE Member
(MemberID nvarchar(50) NOT NULL PRIMARY KEY,
Member_FirstName nvarchar(50),
Member_LastName nvarchar(50),
Member_ContactNumber nvarchar(50),
Member_Email nvarchar(50),
Gender nvarchar(50),
Member_Address nvarchar(150));

CREATE TABLE ShoppingCart
(SC_ID nvarchar(50) NOT NULL PRIMARY KEY,
SC_Date DATE,
Total_Amount DECIMAL(15,2),
MemberID nvarchar(50) FOREIGN KEY REFERENCES Member(MemberID));

CREATE TABLE Cart_item
(CartID nvarchar(50) NOT NULL PRIMARY KEY,
Book_Quantity INT,
Price DECIMAL(15,2),
SC_ID nvarchar(50) FOREIGN KEY REFERENCES ShoppingCart(SC_ID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book_instore(BookID));

CREATE TABLE Member_Order
(OrderID nvarchar(50) NOT NULL PRIMARY KEY,
Pay_type nvarchar(50),
Order_date DATE,
Total_Amount DECIMAL(15,2),
Delivery_status nvarchar(50),
MemberID nvarchar(50) FOREIGN KEY REFERENCES Member(MemberID));

CREATE TABLE Member_OrderItem
(ItemID nvarchar(50) NOT NULL PRIMARY KEY,
Quantity INT,
Total_Price DECIMAL(15,2),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book_instore(BookID),
OrderID nvarchar(50) FOREIGN KEY REFERENCES Member_Order(OrderID));

CREATE TABLE Feedback
(FeedbackID nvarchar(50) NOT NULL PRIMARY KEY,
Score TINYINT,
Comment nvarchar(50),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book_instore(BookID),
MemberID nvarchar(50) FOREIGN KEY REFERENCES Member(MemberID));

---Data Manipulation Language---
--Insert values
INSERT INTO Manager VALUES
('MG0001','Adam','016-5327895','adam@apu.bookstore.com'),
('MG0002','Kelly','017-5327455','kelly@apu.bookstore.com'),
('MG0003','Noel','016-5421111','noel@apu.bookstore.com'),
('MG0004','Jason','012-5324590','jason@apu.bookstore.com'),
('MG0005','Manny','010-2347452','manny@apu.bookstore.com');

INSERT INTO Publisher VALUES
('PB0001','Pelangi Sdn Bdn','03-34759600','No.10, Jalan Kilang,45000 Selangor','admin@pelangi.com'),
('PB0002','Matahari Sdn Bdn','03-34346789','No.23, Jalan Jenjarom, 42100 Selangor','alex@matahari.com'),
('PB0003','Maxwell Corp.','03-33450605','No.3,Jalan Puchong Jaya,41000 Kuala Lumpur','gary@maxwell.corp.com'),
('PB0004','Penguin Corp.','03-12349503','No.1,Jalan Alor, 40000 Kuala Lumpur','manager@penguin.corp.com'),
('PB0005','Wawasan Sdn Bdn','03-90583293','No.33, Jalan OUG, 43000 Kuala Lumpur','hasim@wawasan.com');

INSERT INTO Book_list VALUES
('BKP0001','How To Get Away With Murder','Thriller',5000,50.00,'PB0005'),
('BKP0002','Career Guidance','Education',2000,100.00,'PB0003'),
('BKP0003','Cloud Computing','Education',3000,80.00,'PB0002'),
('BKP0004','How to Self-Study','Education',10000,30.00,'PB0001'),
('BKP0005','Haunted House','Horror',5000,60.00,'PB0004');

INSERT INTO Order_to_Publishers VALUES
('OR001','2021-01-02',2500.00,'PB0001','MG0005'),
('OR002','2020-12-02',3000.00,'PB0002','MG0001'),
('OR003','2020-10-16',5000.00,'PB0003','MG0004'),
('OR004','2020-05-01',10000.00,'PB0004','MG0002'),
('OR005','2020-10-23',2200.00,'PB0005','MG0003');

INSERT INTO OrdertoP_item VALUES
('PI0001',20,1200.00,'OR005','BKP0005'),
('PI0002',20,1000.00,'OR005','BKP0001'),
('PI0003',50,2500.00,'OR001','BKP0001'),
('PI0004',20,1200.00,'OR005','BKP0005'),
('PI0005',100,10000.00,'OR005','BKP0002');

INSERT INTO Invoice VALUES
('IV0001','2021-10-02',15000.00,'PB0001'),
('IV0002','2020-12-12',2700.00,'PB0002'),
('IV0003','2020-10-25',800.00,'PB0003'),
('IV0004','2020-05-17',9000.00,'PB0004'),
('IV0005','2020-11-02',18000.00,'PB0005');

INSERT INTO Invoice_item VALUES
('IVI0001',30,1500.00,'BKP0002','IV0001'),
('IVI0002',100,10000.00,'BKP0005','IV0001'),
('IVI0003',10,800.00,'BKP0005','IV0003'),
('IVI0004',30,900.00,'BKP0001','IV0002'),
('IVI0005',30,1800.00,'BKP0004','IV0002');

INSERT INTO Account_Department VALUES
('AC001','Jennifer','017-8323947','jennifer@apu.account.com','IV0001'),
('AC002','Karen','013-4642293','karen@apu.account.com','IV0002'),
('AC003','Joshua','011-1234982','joshua@apu.account.com','IV0003'),
('AC004','Terry','019-8334683','terry@apu.account.com','IV0004'),
('AC005','Rocky','010-3829271','rocky@apu.account.com','IV0005');

INSERT INTO Category VALUES
('CY01','Education','Non-Fiction'),
('CY02','Education','Fiction'),
('CY03','Horror','Fiction'),
('CY04','Thriller','Fiction'),
('CY05','Romantic','Fiction');

INSERT INTO Book_instore VALUES
('BK001','283-1-16-128929-2','Data Science',100,150.00,'CY01','PB0005'),
('BK002','456-3-20-458934-3','Final Fantasy',20,40.00,'CY04','PB0002'),
('BK003','568-4-45-958323-1','The Graduate',50,35.00,'CY02','PB0001'),
('BK004','023-3-20-393820-4','Me & Marley',35,40.00,'CY02','PB0003'),
('BK005','939-5-30-498950-1','Haunting House',30,50.00,'CY03','PB0004');

INSERT INTO Member VALUES
('MB0001','Caroline','Lam','016-4733938','carolinelam@hotmail.com','Female','No.1,Jalan Pangsapuri, Taman Jaya, 45000 Selangor'),
('MB0002','Ahmad','Muhammad','013-5948203','ahmadmuh@gmail.com','Male','No.18,Jalan Aman Ara, Taman Khidmad, 41000 Selangor'),
('MB0003','Karen','Mok','012-5689435','karen_mok@outlook.com','Female','No.23,Jalan Kedah, Taman Rama-Rama, 42000 Kuala Lumpur'),
('MB0004','Hanna','Rajakupavali','019-9383922','raj.hanna@gmail.com','Female','No.10,Jalan Bunga Raya, Taman Iramanis, 41000 Kuala Lumpur'),
('MB0005','Ken Seng','Tan','019-0039022','kenseng@gmail.com','Male','No.65,Jalan Arasia, Taman Tropicana, 42500 Selangor');

INSERT INTO ShoppingCart VALUES
('SC001','2021-01-01',80.00,'MB0003'),
('SC002','2020-11-13',150.00,'MB0002'),
('SC003','2021-02-10',105.00,'MB0001'),
('SC004','2020-12-03',40.00,'MB0005'),
('SC005','2020-10-20',300.00,'MB0004');

INSERT INTO Cart_item VALUES
('CT0001',1,150.00,'SC002','BK001'),
('CT0002',2,80.00,'SC001','BK004'),
('CT0003',3,90.00,'SC004','BK005'),
('CT0004',2,100.00,'SC005','BK002'),
('CT0005',1,35.00,'SC003','BK003');

INSERT INTO Member_Order VALUES
('MO001','Cash','2020-12-05',80.00,'Delivered','MB0004'),
('MO002','Online Transfer','2021-01-15',200.00,'Pending','MB0003'),
('MO003','Cash','2020-10-20',300.00,'Delivered','MB0004'),
('MO004','Credit Card','2021-02-15',150.00,'Pending','MB0001'),
('MO005','Online Transfer','2020-12-01',135.00,'Delivered','MB0002');

INSERT INTO Member_OrderItem VALUES
('IT0001',1,40.00,'BK002','MO001'),
('IT0002',1,40.00,'BK004','MO001'),
('IT0003',2,100.00,'BK005','MO005'),
('IT0004',1,35.00,'BK003','MO005'),
('IT0005',5,200.00,'BK002','MO002');

INSERT INTO Feedback VALUES
('FB0001',6,'Fairly good','BK004','MB0003'),
('FB0002',10,'Amazing!','BK001','MB0004'),
('FB0003',3,'Not so good','BK001','MB0001'),
('FB0004',7,'Quite good!','BK003','MB0001'),
('FB0005',9,'Very nice book','BK002','MB0005');


--Manipulating data

--i.Find the total number of feedback per book. Show book id, book title, and total number of feedback per book.
SELECT b.BookID,b.Book_Title, COUNT(f.FeedbackID) AS 'Total Number of Feedback Per Book'
FROM Book_instore AS b, Feedback AS f WHERE b.BookID=f.BookID
GROUP BY b.BookID,b.Book_Title;

--ii. Find the total number of feedback per member. Show member id, member name, and total number of feedback per member.
SELECT m.MemberID,m.Member_FirstName,m.Member_LastName,COUNT(f.FeedbackID) AS 'Total Number of Feedback Per Member'
FROM Member AS m, Feedback AS f WHERE m.MemberID=f.MemberID
GROUP BY m.MemberID,m.Member_FirstName,m.Member_LastName;

--iii. Find the total number of book published by each publisher. Show publisher id, publisher name, and number of book published.
SELECT p.PublisherID,p.Pub_Name,SUM(bp.Quantity) AS 'Total Number of Book Published By Each Publisher'
FROM Publisher AS p,Book_list AS bp WHERE p.PublisherID=bp.PublisherID
GROUP BY p.PublisherID,p.Pub_Name;

--iv. Find the total number of book for each category. Show category id, category name, and number of book for each category.
SELECT c.CategoryID,c.Category_Name,SUM(b.Book_Quantity) AS 'Total Number of Book For Each Category'
FROM Category AS c, Book_instore AS b WHERE c.CategoryID=b.CategoryID
GROUP BY c.CategoryID,c.Category_Name;

--v. From the book table, list the books where quantity is more than the average quantity of all books. 
SELECT * FROM Book_instore 
WHERE Book_Quantity > (SELECT AVG(Book_Quantity) AS 'AVERAGE' FROM Book_instore)
GROUP BY BookID,Book_SerialNo,Book_Title,Book_Quantity,Book_Price,CategoryID,PublisherID;

--vi. Find the total number of books ordered by store manager from various publishers.
SELECT i.InvoiceID, p.PublisherID,otp.ManagerID, SUM(it.Book_quantity) AS 'Total Number of Books Ordered By Store Manager From Various Publisher'
FROM Invoice_item AS it, Invoice AS i, Publisher AS p, Order_to_Publishers AS otp
WHERE i.InvoiceID=it.InvoiceID AND i.PublisherID=p.PublisherID AND p.PublisherID=otp.PublisherID
GROUP BY i.InvoiceID, p.PublisherID,otp.ManagerID;

--vii. Produce a record of invoices for various publishers. The invoice consists of invoice number, invoice date, publisher’s names & addresses, total quantity of ordered books and total amount to be paid.
SELECT iv.InvoiceID,iv.Inv_date,p.Pub_Name,p.Pub_address,it.Book_quantity AS 'Total Quantity of Ordered Books',iv.Total_amount
FROM Invoice AS iv,Publisher AS p,Invoice_item AS it
WHERE iv.InvoiceID=it.InvoiceID AND iv.PublisherID=p.PublisherID;

--viii. A list of total customers based on gender who are registered as members in APU E-Bookstore. The list should show total number of registered members and total number of gender (male and female).
SELECT COUNT(MemberID) AS 'Total Number of Registered Members',
COUNT(Gender) AS 'Total Number of Gender',
COUNT(CASE WHEN Gender='Male' then 1 end) AS 'Total Number of Male',
COUNT(CASE WHEN Gender='Female' then 1 end) AS 'Total Number of Male'
FROM Member;

--ix. A list of purchased books that have been and have not been delivered to members. The list should show member identification number, address, contact number, book serial number, book title, quantity, date and status of delivery.
SELECT m.MemberID,m.Member_Address,m.Member_ContactNumber,b.Book_SerialNo,b.Book_Title,moi.Quantity,mo.Order_date,mo.Delivery_status
FROM Member AS m,Book_instore AS b,Member_OrderItem AS moi,Member_Order AS mo
WHERE m.MemberID=mo.MemberID AND mo.OrderID=moi.OrderID AND moi.BookID=b.BookID;

--x. A list of total books and its total price as added by members in shopping cart.
SELECT m.MemberID,m.Member_FirstName,m.Member_LastName, c.Book_Quantity AS 'Total Books in Shopping Cart',sc.Total_Amount AS 'Total Price in Shopping Cart'
FROM ShoppingCart AS sc, Cart_item AS c, Member AS m
WHERE sc.SC_ID=c.SC_ID AND m.memberID=sc.MemberID
GROUP BY m.MemberID,m.Member_FirstName,m.Member_LastName,c.Book_Quantity,sc.Total_Amount;