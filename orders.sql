create table books(book_id number,book_name varchar2(100)not null,author_name varchar2(100)not null,price number not null,publisher varchar2(50)not null,version number,category varchar2(50)not null,active number default 1,constraint book_id_pk primary key(book_id),constraint price_ck check(price>=0),constraint book_name_uq unique(book_name,author_name,version));

insert into books(book_id,book_name,author_name,price,publisher,version,category)values(1,'Code Complete','Steve',100,'James',1,'Technical');
insert into books(book_id,book_name,author_name,price,publisher,version,category)values(2,'Code Complete','Steve',100,'James',2,'Technical');
insert into books(book_id,book_name,author_name,price,publisher,version,category)values(3,'Java','Srinivas',300,'Jack',1,'Technical');
insert into books(book_id,book_name,author_name,price,publisher,version,category)values(4,'C','Surya',399,'John',3,'Technical');
insert into books(book_id,book_name,author_name,price,publisher,version,category)values(5,'Harry potter','J K Rowling',500,'Booshan',5,'Nonfiction');

select *from books;

create table orders
(order_id number,
username varchar2(100)not null,
book_id number not null,
ordered_date timestamp default systimestamp,
delivered_date timestamp,
total_amount number not null,
quantity number default 1,
status varchar2(50)default 'ordered',
comments varchar2(500),
constraint order_id_pk primary key(order_id),
constraint book_id_fk foreign key(book_id)references books(book_id),
constraint total_amount_ck check(total_amount>=0),
constraint quantity_ck check(quantity>=1),
constraint username_uq unique(username,book_id,ordered_date));


insert into orders(order_id,username,book_id,total_amount,quantity)values(1,'Meenakshi',5,300,2);
insert into orders(order_id,username,book_id,total_amount,quantity,status,comments)values(2,'Aarthi',5,500,2,'Delivered','Delivered today');
insert into orders(order_id,username,book_id,total_amount,quantity)values(3,'Mareeswari',2,290,1);
insert into orders(order_id,username,book_id,total_amount,quantity,status,comments)values(4,'Sujitha',4,490,1,'Delivered','Delivered two days before');
insert into orders(order_id,username,book_id,total_amount,quantity,status,comments)values(5,'Niivetha',3,100,1,'Delivered','Delivered three days before');
update orders set delivered_date=ordered_date+3 where status='ordered';

select *from orders;

drop table book_stock;
create table book_stock(stock_no number not null,book_id number not null,quantity number not null,constraint book_id_fk1 foreign key(book_id)references books(book_id),constraint quantity_ck1 check(quantity>=0),constraint stock_no_pk primary key(stock_no));

insert into book_stock(stock_no,book_id,quantity)values(1,1,40);
insert into book_stock(stock_no,book_id,quantity)values(2,2,36);
insert into book_stock(stock_no,book_id,quantity)values(3,3,10);
insert into book_stock(stock_no,book_id,quantity)values(4,4,75);
insert into book_stock(stock_no,book_id,quantity)values(5,5,67);

select *from book_stock;

create table order_items(order_item_id number,order_id number,book_id number,quantity number,status varchar2(50)default 'Ordered',constraint order_item_id_pk primary key(order_item_id),constraint order_id_fk1 foreign key(order_id)references orders(order_id),constraint book_id_fk2 foreign key(book_id)references books(book_id),constraint quantity_ck3 check(quantity>=1));


insert into order_items(order_item_id,order_id,book_id,quantity)values(1,2,5,4);
insert into order_items(order_item_id,order_id,book_id,quantity)values(2,2,3,1);
insert into order_items(order_item_id,order_id,book_id,quantity)values(3,4,1,5);
insert into order_items(order_item_id,order_id,book_id,quantity)values(4,5,3,2);
insert into order_items(order_item_id,order_id,book_id,quantity)values(5,3,2,4);

select *from order_items;
