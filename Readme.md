# Book Treasury App
* http://booktreasury.com

## Features
* User should able to view all the books.

### Feature 1:
* List all the books.

```sql
create table books(
book_id number,
book_name varchar2(100)not null,
author_name varchar2(100)not null,
publisher varchar2(50)not null
version number,
category varchar2(50)not null,
language varchar2(50)not null,

constraint book_id_pk primary key(book_id),
constraint version_ck check(version>=0),
constraint book_name_uq unique(book_name,author_name,version),
constraint language_ck check(language in ('Tamil','English','Hindi','Telugu','Malayalam')),
constraint category_ck check(category in ('Technical','Biographies','Business','Kids','Comics','Crafts')));
```

Query:
```sql
insert into books(book_id,book_name,author_name,publisher,category,language)values(book_id_seq.nextval,'Think and Grow rich','Napoleon Hill','Fingerprint Publishing',
'Business','English');

insert into books(book_id,book_name,author_name,publisher,category,language)values(book_id_seq.nextval,'Rich and poor dad','Robert T.Kiyosaki','Plata publishing',
'Business','English');

insert into books(book_id,book_name,author_name,publisher,version,category,language)values(book_id_seq.nextval,'Harry potter and the philosopher's stone ','J K Rowling ',
'Bloomsburry Press',1,'Novel','English');

insert into books(book_id,book_name,author_name,publisher,version,category,language)values(book_id_seq.nextval,'Harry potter and Chamber of Secrets','J K Rowling ',2,'Novel','English');

insert into books(book_id,book_name,author_name,publisher,category,language)values(book_id_seq.nextval,'Anmol Kahaniya ','Premchand  ','Maple Press ','Novel','Hindi');

insert into books(book_id,book_name,author_name,publisher,category,language)values(book_id_seq.nextval,'Chandragupt','Jaishankar Prasad','Public Domain Books','Novel','Hindi');


select *from books;
```
#### Books

| Book_id | Book_name                                | Author_name       | publisher              |  version | category | Language |
|---------|------------------------------------------|-------------------|------------------------|----------|----------|----------|
| 1       | Think and Grow rich                      | Napoleon Hill     | Fingerprint Publishing |          | Business | English  |
| 2       | Rich dad poor dad                        | Robert T.Kiyosaki | Plata publishing       |          | Business | English  |
| 3       | Harry potter and the philosopher's stone | J K Rowling       | Bloomsburry Press      |  1       | Novel    | English  |
| 4       | Harry Potter and Chamber of Secrets      | J k Rowling       | Bloomsburry Press      |  2       | Novel    | English  |



#### User_Details

Query:

```sql
create table users(user_id number,user_name varchar2(50)not null,address varchar2(500),ph_no number not null,constraint user_id_pk primary key(user_id),
constraint ph_no_ck check(length(to_char(ph_no))=10),constraint ph_no_uq unique(user_id,user_name,ph_no));

create sequence user_id_seq start with 1 increment by 1;

insert into users(user_id,user_name,address,ph_no)values(user_id_seq.nextval,'Keerthana','79A Vakkil street, MRS Compound, Kovilpatti',9489745432);

insert into users(user_id,user_name,address,ph_no)values(user_id_seq.nextval,'Hemanth','79A Vakkil street, MRS Compound, Kovilpatti',7708467423);

insert into users(user_id,user_name,address,ph_no)values(user_id_seq.nextval,' Aarthi ','100,East street, Thoothukudi',9725202379);

insert into users(user_id,user_name,address,ph_no)values(user_id_seq.nextval,'Kowsalya','no.13, 7G rainbow colony, Dubai',8220289026);

insert into users(user_id,user_name,address,ph_no)values(user_id_seq.nextval,'Meenakshi','112,Renugambal nagar, First street, Kelambakam',8667705466);
```


| User_id | User_name | Address                                        | Ph_no      |
|---------|-----------|------------------------------------------------|------------|
| 1       | Keerthana | 79A Vakkil street, MRS Compound, Kovilpatti    | 9489745432 |
| 2       | Hemanth   | 79A Vakkil street, MRS Compound, Kovilpatti    | 7708467423 |
| 3       | Vignesh   | 693 Raju nagar, First street, Kanchipuram      | 9807865454 |
| 4       | Aarthi    | 100,East street, Thoothukudi                   | 9725202379 |


#### Books Stock Room
Query:
```sql
create books_stock(book_id number not null,book_stock_id number,quantity number not null,issued_books number default 0,constraint book_stock_id_pk primary key(book_stock_id),
constraint book_id_fk foreign key(book_id)references books(book_id),constraint quantity_ck check(quantity>=0));

create sequence book_stock_id_seq start with 1 increment by 1;

insert into book_stock(book_stock_id,book_id,quantity)values(book_stock_id_seq.nextval,1,150);
insert into book_stock(book_stock_id,book_id,quantity)values(book_stock_id_seq.nextval,2,95);
insert into book_stock(book_stock_id,book_id,quantity)values(book_stock_id_seq.nextval,3,75);
insert into book_stock(book_stock_id,book_id,quantity)values(book_stock_id_seq.nextval,4,30);
insert into book_stock(book_stock_id,book_id,quantity)values(book_stock_id_seq.nextval,5,100);
insert into book_stock(book_stock_id,book_id,quantity)values(book_stock_id_seq.nextval,6,10);
```

| Book_stock_id | Book_id | Quantity | Issued_books |
|---------------|---------|----------|--------------| 
| 1             | 5       | 150      | 0            |
| 2             | 6       | 95       | 0            | 
| 3             | 9       | 75       | 0            |


#### Penality Calculation

* Assuming penality as two rupees per day.

```sql

create create fine_calc(item_id number,book_id number not null,user_id number not null,issued_date date not null,due_date date,returned_date,fine_amount number,
status varchar2(50)default 'Issued',constraint item_id_pk primary key(item_id),constraint book_id_fk1 foreign key(book_id)references books(book_id),
constraint user_id_fk foreign key(user_id)references users(user_id),constraint status_ck check(status in('Issued','Returned')));

create sequence item_id_seq start with 1 increment by 1;

insert into fine_calc(item_id,book_id,user_id,issued_date,returned_date,status)values(item_id_seq.nextval,3,2,to_date('12-12-2019','dd-MM-yyyy'));

insert into fine_calc(item_id,book_id,user_id,issued_date)values(item_id_seq.nextval,5,4,to_date('15-12-2019','dd-MM-yyyy'));

insert into fine_calc(item_id,book_id,user_id,issued_date,returned_date,status)values(item_id_seq.nextval,2,1,to_date('12-11-2019','dd-MM-yyyy'));

insert into fine_calc(item_id,book_id,user_id,issued_date)values(item_id_seq.nextval,1,3,to_date('14-12-2019','dd-MM-yyyy'));

update fine_calc set due_date=issued_date+15;
```

update penality_calculation set returned_date=to_date('25-10-19','dd-MM-yyyy')where book_id=1;
update penality_calculation set fine_amount=0,status='Returned' where(returned_date<=due_date);
update penality_calculation set fine_amount=((returned_date-due_date)*2),status='Returned'where (returned_date>due_date);
update penality_calculation set fine_amount=((sysdate-due_date)*2)where(due_date<sysdate)and status='Issued'

| Item_id | Book_id | User_id | Issued_date | Due_date   | Fine _amount | Status |
|---------|---------|---------|-------------|------------|--------------|--------|
| 1       | 3       | 2       | 12.12.2019  | 25.12.2019 | -            |Issued  |
| 2       | 5       | 4       | 15.12.2019  | 30.12.2019 | -            |Issued  |
| 3       | 2       | 1       | 7.11.2019   | 22.11.2019 | -           |Issued   |


### Feature 2:
* Calculating fine amount for the each user.
```sql
create or replace FUNCTION FINE_AMOUNT1  
(I_book_id in number,I_user_id in number)
RETURN NUMBER AS 
pragma autonomous_transaction;
FINE_M NUMBER;
v_due_date date;
BEGIN

   select due_date into v_due_date from fine_calc where user_id=I_user_id and book_id=I_book_id; 
   IF v_due_date < SYSDATE THEN
     FINE_M:=(trunc( SYSDATE -v_due_date))*2;
   ELSE
      FINE_M:=0;
   END IF;
   
  RETURN  FINE_M;
END FINE_AMOUNT1;

```
* Display the fine amount table.
```sql
update fine_calc set fine_amount=FINE_AMOUNT1( book_id, user_id);---- where book_id=5 and user_id=4;
select *from penality_calculation;
```
| Item_id | Book_id | User_id | Issued_date | Due_date   | Fine _amount | Status |
|---------|---------|---------|-------------|------------|--------------|--------|
| 1       | 3       | 2       | 12.12.2019  | 25.12.2019 |  16          |Issued  |
| 2       | 5       | 4       | 15.12.2019  | 30.12.2019 | 6            |Issued  |
| 3       | 2       | 1       | 7.11.2019   | 22.11.2019 | 22           |Issued  |

### Stock updation:

update


