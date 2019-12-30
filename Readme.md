# Book Treasury App
* http://booktreasury.com

## Features
* User should able to view all the books.

### Feature 1:List all the books.

create table books2(
book_id number,
book_name varchar2(100)not null,
author_name varchar2(100)not null,
publisher varchar2(50)not null,
version number,
category varchar2(50)not null,
active number default 1,
language varchar2(50)not null,

constraint book_id_pk primary key(book_id),
constraint book_name_uq unique(book_name,author_name,version));

Query:

select *from books;
