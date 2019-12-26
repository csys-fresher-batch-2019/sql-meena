create table task1(No number,Task_title varchar2(50) not null,name varchar2(50) not null,Deadline date not null,completed_on date,status char(1)
constraint task_title_uq primary key task_title);
insert into task1(No,Task_title,name,DeadLine,Completed_on)values(1,'install oracle','Aarthi',to_date('26-12-2019','dd-MM-yyyy'),to_date('25-12-2019','dd-MM-yyyy','y'));
insert into task1(No,Task_title,name,DeadLine,Completed_on)values(2,'install JDK','Siva',to_date('28-12-2019','dd-MM-yyyy'),to_date('27-12-2019','dd-MM-yyyy','y')); 
insert into task1(No,Task_title,name,DeadLine,Completed_on)values(3,'install oracle','Aarthi',to_date('26-12-2019','dd-MM-yyyy'),to_date('29-12-2019','dd-MM-yyyy','n'));                                                                                                                                 
select *from task1 where(status='y');                                                                                                                            
