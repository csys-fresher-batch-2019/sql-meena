# Book Treasury App
* http://booktreasury.com

## Features
* User should able to view all the books.

### Feature 1:List all the books.

```sql
create table books(
book_id number,
book_name varchar2(100)not null,
author_name varchar2(100)not null,
publisher varchar2(50)not null
published_date date not null,
version number,
category varchar2(50)not null,
language varchar2(50)not null,

constraint book_id_pk primary key(book_id),
constraint version_ck check(version>=0),
constraint book_name_uq unique(book_name,author_name,version),
constraint published_date_ck check(published_date<=sysdate),
constraint language_ck check(language in ('Tamil','English','Hindi','Telugu','Malayalam')),
constraint category_ck check(category in ('Technical','Biographies','Business','Kids','Comics','Crafts')));
```

Query:
```sql
select *from books;
```
