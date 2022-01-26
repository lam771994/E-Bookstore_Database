# E-Bookstore Database


## Objective

The Asia Pacific University (APU) library has a huge collection of hardcopy books and e-books, however its small bookshop has limited its availability of books. The objective of this project is to design a database system for the online APU’s e-Bookstore. An e-Bookstore system allows APU to find and manipulate the information collected and stored easily and effectively. Additionally, it helps to overcome problems of traditional physical bookstores where there are limited spaces, fixed location, narrow sales channels and inconvenience to purchase books especially during a pandemic. 

In this project, an entity relationship modelling will first be presented as the drafted model of a database system for APU e-Bookstore. Subsequently, business rules are illustrated to list down the relevant entities and attributes for an efficient database. Normalisation process will be performed to organise the data within the database. Later on, a database schema will be generated to see the bigger picture of the database. Moreover, a data dictionary with the definition of table names, attribute names, descriptions, data types, role of primary or foreign key and foreign reference table will be given for a better database management. Lastly, SQL statements with definition and manipulation languages will be shown in order to test the effectiveness of the database.


## Entity Relationship Modelling

![ERD](https://user-images.githubusercontent.com/68948128/151130856-7f24c8df-1d23-4b61-855b-acd2a7b8f057.jpeg)

## Business Rules

Below are the fifteen business rules applied for the APU e-Bookstore database:

1.	A Publisher can send a list that contains many Books to a Manager.
2.	A Manager can place zero, one or many Orders to one or many Publishers.
3.	An Order to Publisher with zero, one or many Items is associated with one Manager and one or many Publisher.
4.	An Item in the Order to Publisher can contain one or many Books.
5.	A Publisher can issue only one Invoice that contains one or many Items.
6.	An Item in the Invoice can contain one or many Books.
7.	Many Invoices are transferred to one Account Department.
8.	A Publisher can supply one or many Books to the bookstore.
9.	One or many Books on the list given by one Publisher and one or many Books in the bookstore are differentiated but associated to a Publisher as the books on the list may not necessarily be delivered to the bookstore yet.
10.	A Book in the bookstore is associated with many Categories.
11.	A Member can place zero, one or many Books in only one Shopping Cart that contains zero, one or many Items.
12.	One or many Books in the bookstore are associated with one or many Items in one Shopping Cart.
13.	A Member can have zero, one or many Orders that contain zero, one or many Items and an Order is made by one Member.
14.	One or many Books in the bookstore are associated with one or many Item in one Member’s Order.
15.	One Member can provide one or many Feedbacks and one Book is associated with many Feedbacks.


## Normalization Process

#### 1. Un-normalised Form

<img width="565" alt="Form" src="https://user-images.githubusercontent.com/68948128/151131186-65c72f4d-f557-4b5b-9eb4-690f8694147c.png">

#### 2. First Normalised Form

<img width="707" alt="1st_normalization" src="https://user-images.githubusercontent.com/68948128/151131608-b69b80d7-5fa8-444e-9d22-1c00573e0e2b.png">

#### 3. Second Normalised Form

<img width="561" alt="2nd_normalization" src="https://user-images.githubusercontent.com/68948128/151131629-6b5bf3b6-e95a-43cb-86a4-fbc99a37a023.png">


## Database Schema

![Database_Schema](https://user-images.githubusercontent.com/68948128/151131741-d62f5cf7-c02b-4242-af95-e11fbebd5145.png)


## Data Dictionary

<img width="842" alt="Data_dictionary_1" src="https://user-images.githubusercontent.com/68948128/151169865-aea9b677-69ce-4d21-bf6a-80e7863b428a.png">

<img width="842" alt="Data_dictionary_2" src="https://user-images.githubusercontent.com/68948128/151169884-979aaafa-79da-4c07-8856-6667e8c3ef81.png">

<img width="842" alt="Data_dictionary_3" src="https://user-images.githubusercontent.com/68948128/151169892-265baa95-e9ba-4309-bb57-d6edcd4d0a27.png">

<img width="842" alt="Data_dictionary_4" src="https://user-images.githubusercontent.com/68948128/151169898-974b00fe-0c3d-42b7-bbd0-8ba353a801bb.png">

