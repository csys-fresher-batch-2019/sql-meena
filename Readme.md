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
#### Table

| Book_id | Book_name                                | Author_name       | publisher              | published_date | version | category | Language |
|---------|------------------------------------------|-------------------|------------------------|----------------|---------|----------|----------|
| 1       | Think and Grow rich                      | Napoleon Hill     | Fingerprint Publishing | 1 Dec 2014     |         | Business | English  |
| 2       | Rich dad poor dad                        | Robert T.Kiyosaki | Plata publishing       | 11 Apr 2017    |         | Business | English  |
| 3       | Harry potter and the philosopher's stone | J K Rowling       | Bloomsburry Press      | 3 Sep 2014     | 1       | Novel    | English  |
| 4       | Harry Potter and Chamber of Secrets      | J k Rowling       | Bloomsburry Press      | 3 Sep 2014     | 2       | Novel    | English  |
| 5       | Anmol Kahaniya                           | Premchand         | Maple Press            | 20 May 2015    |         | Novel    | Hindi    |
| 6       | Chandragupt                              | Jaishankar Prasad | Public Domain Books    | 12 Nov 2012    |         | Novel    | Hindi    |
| 7       | Sirukathai Thoguppu                      | Jayakanthan       | Pustaka Digital Media  | 4 apr 2013     | 1       | Story    | Tamil    |
| 8       | Chanakya Neeti                           | B.K.Chaturvedi    | Diamond Books          | 1 Jan 2012     |         | Story    | Tamil    |
| 9       | Childish Longings                        | Harish Sant       | Notion Press           | 25 Nov 2019    |         | Horror   | English  |
| 10      | Horror Tales                             | Mohit Dasani      | Notion Press           | 1 Jan 2019     |         | Horror   | Hindi    |
