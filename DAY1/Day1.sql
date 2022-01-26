Create Table dept_6420
(
Dept_id  number(5) PRIMARY KEY,
Dept_name varchar2(20) UNIQUE ,
Locatn_id number(3)
);

describe dept_6420;
--same as desc

Create table Emp_6420(
Empid number(5),
empname varchar2(50),
email VARCHAR2(15) unique,
gender varchar(1) check(gender in ('M','F')),
phone_number varchar2(15),
hiredate Date default '01-JAN-01',
dept_id number(5), 
CONSTRAINT emp_pk1 primary key(Empid),
CONSTRAINT dept_fl1 FOREIGN KEY(DEPT_ID)
    REFERENCES dept_6420
    );
    
desc EMP_6420;

SELECT * from user_tables;
SELECT
    * FROM
    user_objects;
    
select * from user_constraints
Where table_name='EMP_6420'

select * from user_cons_columns
Where table_name='EMP_6420'


select * from user_cons_columns
where table_name='KOD_DETLS'


DESCRIBE dept_64

DESCRIBE emp_6420

alter table emp_6420
rename column email to emailID

alter table emp_6420
drop column gender

alter table emp_6420
add Salary number(8);

alter table emp_6420
modify email varchar2(50);


create table kod_detls
(orderid number(2),
productid number(3),
order_date date )

alter table kod_detls
add constraint k_pk1 PRIMARY KEY(orderid)


select * from user_cons_columns
where table_name='EMP_6420'

Alter table EMP_6420
drop Constraint SYS_C007090

drop table emp_6420;

desc emp_6420

truncate table dept_6420

desc dept_6420