
  CREATE TABLE DEPARTMENT
   (	DEPARTMENT_ID NUMBER(4,0), 
	DEPARTMENT_NAME VARCHAR2(30) NOT NULL ENABLE, 
	LOCATIONID NUMBER(4,0), 
	 CONSTRAINT PK_DEPTD PRIMARY KEY (DEPARTMENT_ID),
	 CONSTRAINT FK_LOCID FOREIGN KEY(LOCATIONID) references LOCATION_DTLS(LOCATIONID)
   );
   
   
  CREATE TABLE "LOCATION_DTLS" 
   (	"LOCATIONID" NUMBER(4,0) Primary key, 
	"CITY" VARCHAR2(50)
   )
   
   
     CREATE TABLE EMPLOYEE
   (	EMPLOYEEID NUMBER(6,0), 
	FIRSTNAME VARCHAR2(10 BYTE), 
	LASTNAME VARCHAR2(25 BYTE), 
	EMAIL VARCHAR2(25 BYTE), 
	PHONENUMBER VARCHAR2(20 BYTE), 
	HIREDATE DATE, 
	JOB_ID VARCHAR2(10 BYTE), 
	SALARY NUMBER(8,2), 
	COMMITIONPCT NUMBER(5,2), 
	MANAGER_ID NUMBER(6,0), 
	DEPARTMENT_ID NUMBER(4,0), 
	 CONSTRAINT PK_EMPD PRIMARY KEY (EMPLOYEEID),
	 CONSTRAINT FK_DEPTD FOREIGN KEY (DEPARTMENT_ID)
	  REFERENCES DEPARTMENT (DEPARTMENT_ID)) ;

  CREATE UNIQUE INDEX "PK_EMPD" ON "EMPLOYEE" ("EMPLOYEEID") ;
  CREATE INDEX "DEPT_ID_INDEX" ON "EMPLOYEE" ("DEPARTMENT_ID"); 
  CREATE INDEX "MNGR_ID_INDEX" ON "EMPLOYEE" ("MANAGER_ID") ;
 CREATE INDEX "IDX_SUB_EMP" ON "EMPLOYEE" (UPPER("JOB_ID")) ;
  CREATE INDEX "IDX_SALARY_EMP" ON "EMPLOYEE" ("SALARY") ;
  
  
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,LOCATIONID) values (10,'HR1',1);
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,LOCATIONID) values (50,'Marketing',3);
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,LOCATIONID) values (20,'IT',1);
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,LOCATIONID) values (30,'SALES',4);
Insert into DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME,LOCATIONID) values (40,'Training',3);



Insert into EMPLOYEE (EMPLOYEEID,FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,HIREDATE,JOB_ID,SALARY,COMMITIONPCT,MANAGER_ID,DEPARTMENT_ID) values (9,'Yamini','Kekale','yamini@gmail.com','940000342',to_timestamp('01-JAN-19','DD-MON-RR HH.MI.SSXFF AM'),'IT_REP',40000,null,null,null);
Insert into EMPLOYEE (EMPLOYEEID,FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,HIREDATE,JOB_ID,SALARY,COMMITIONPCT,MANAGER_ID,DEPARTMENT_ID) values (1,'John','Demn','JohnD@yahoo.com','9898780979',to_timestamp('01-OCT-01','DD-MON-RR HH.MI.SSXFF AM'),'HR_MGR',76000,0.5,1,10);
Insert into EMPLOYEE (EMPLOYEEID,FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,HIREDATE,JOB_ID,SALARY,COMMITIONPCT,MANAGER_ID,DEPARTMENT_ID) values (6,'Ramesh','Phatak','RP@gmail.com','9665971019',to_timestamp('13-APR-18','DD-MON-RR HH.MI.SSXFF AM'),'HR',68000,0.6,4,10);
Insert into EMPLOYEE (EMPLOYEEID,FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,HIREDATE,JOB_ID,SALARY,COMMITIONPCT,MANAGER_ID,DEPARTMENT_ID) values (2,'Ken','Dale','kendaleD@gmail.com','7877787655',to_timestamp('04-JAN-01','DD-MON-RR HH.MI.SSXFF AM'),'SALES_HEAD',47000,0.5,5,30);
Insert into EMPLOYEE (EMPLOYEEID,FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,HIREDATE,JOB_ID,SALARY,COMMITIONPCT,MANAGER_ID,DEPARTMENT_ID) values (3,'toshi','Walton','JW@yahoo.com','5787887888',to_timestamp('01-JAN-01','DD-MON-RR HH.MI.SSXFF AM'),'IT_MGR',23100,0.5,6,20);
Insert into EMPLOYEE (EMPLOYEEID,FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,HIREDATE,JOB_ID,SALARY,COMMITIONPCT,MANAGER_ID,DEPARTMENT_ID) values (4,'robin','sngal','robin@gmail.com','4990988839',to_timestamp('05-JAN-01','DD-MON-RR HH.MI.SSXFF AM'),'IT_REP',19500,null,3,20);
Insert into EMPLOYEE (EMPLOYEEID,FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,HIREDATE,JOB_ID,SALARY,COMMITIONPCT,MANAGER_ID,DEPARTMENT_ID) values (5,'nagpur','ghosala','ghosala@hotmail.com','9809888898',to_timestamp('10-JUN-02','DD-MON-RR HH.MI.SSXFF AM'),'IT_REP',60000,null,3,20);
Insert into EMPLOYEE (EMPLOYEEID,FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,HIREDATE,JOB_ID,SALARY,COMMITIONPCT,MANAGER_ID,DEPARTMENT_ID) values (7,'Pavi','Singh','singh@gmail.com','984000000',to_timestamp('01-JUN-18','DD-MON-RR HH.MI.SSXFF AM'),'SALES_REP',50000,null,2,30);
Insert into EMPLOYEE (EMPLOYEEID,FIRSTNAME,LASTNAME,EMAIL,PHONENUMBER,HIREDATE,JOB_ID,SALARY,COMMITIONPCT,MANAGER_ID,DEPARTMENT_ID) values (8,'Sanaya','Shah','sanaya@gmail.com','984780000',to_timestamp('13-MAY-18','DD-MON-RR HH.MI.SSXFF AM'),'MRKT_REP',50000,null,4,50);
es (5,'HYDERABAD');
Insert into LOCATION_DTLS (LOCATIONID,CITY) values (1,'Pune');

REM INSERTING into LOCATION_DTLS
Insert into LOCATION_DTLS (LOCATIONID,CITY) valu
Insert into LOCATION_DTLS (LOCATIONID,CITY) values (2,'BENGLORE');
Insert into LOCATION_DTLS (LOCATIONID,CITY) values (3,'Chennai');
Insert into LOCATION_DTLS (LOCATIONID,CITY) values (4,'GOA');
Insert into LOCATION_DTLS (LOCATIONID,CITY) values (6,'AURANGABAD');



select * from user_objects;
select * from user_tables;

select * from employee;
select * from department
select * from location_dtls

select distinct job_id from employee;
select employeeid, firstname, lastname, job_id Job_profile,
salary "Monthly salary in $",
Salary * 12 AS Annual_salary
from Employee 



select firstname || ' is an employee  ' || lastname || ' is its lastname' from Employee

select firstname, salary from Employee


select employeeid, 'Employee of company', firstname,
lastname, job_id, department_id
from Employee

select * from Employee
Where department_id=10;

select * from Employee
Where job_id ='IT_REP' and department_id = 20;

select firstname || ' with salary ' || salary from employee;

select * from employee
where hiredate > '01-Jan-2018'

select * from Employee
Where job_id not in ('IT_REP','HR')

select * from Employee
Where salary Between 60000 and 75000 
order by employeeid desc;


select * from Employee
Where hiredate between '01-01-17' and '01-12-20'
order by hiredate;

select * from Employee
Where firstname like 'P%'

select * from Employee
Where job_id like '___REP'


select * from Employee
Where hiredate like ('%19','%18');

select * from Employee
Where hiredate like '%JAN%';

select * from Employee
Where commitionpct is null

select * from Employee
Where salary > 45000
and department_id in (10,20,30,40)

select employeeid, firstname, lastname, job_id, hiredate, salary, department_id
from Employee
Where department_id=10
ORDER by hiredate desc
--order by firstname


select employeeid, firstname, lastname, job_id, hiredate, 
salary, department_id as dept_id,
salary *12 Annual_salary
from Employee
--Where Annual_salary=600000
Where salary * 12 = 600000
Order by annual_salary

select *
from Employee
ORDER by 9

select employeeid, firstname, lastname, job_id, hiredate, 
department_id, salary
from Employee
Order by department_id asc, salary 

select upper(firstname), lower(job_id) from employee


select upper('it was raining that day') from dual

select concat(Firstname, ' is an employee') from employee

select * from dual
select Initcap('it was raining that day') from dual

select 800*7 from dual
select Email, replace(email, '@', '@@') from employee
select email from employee;

select replace ( 'It was raining heavily that day','was','is') from dual;

select length(Email) from employee

select Substr('It is very hot today',3,5) from dual

select Substr('It is very hot today',-9,6 ) from dual

select Email, Substr(Email,-6,3) from employee
where email like '%gmail%' or email like '%yahoo%';

select instr('Kalyani Akut','Akut',1,1) from dual

select Email, 
instr(email, '@',1,1) from Employee

select substr(email, 1 , instr(email, '@',1,1)-1) from employee

 select Mod(27,4)  from dual
 
  select trunc(25.90327850000,2) from dual
  
   select round(25.90327850000,0) from dual
   
   
   select sysdate from dual
    
 select sysdate - 7 from dual;
 
 select sysdate + 6 from dual;
 
 select hiredate from employee
 
  
 select add_Months(sysdate,-3) from dual
 
 
  select hiredate, hiredate + 5,
 add_months(hiredate,6)  from employee;
 
-- select hiredate where hiredate in months_between(01-01-2002,01-12-2018) from employee;

 select hiredate, 
round( trunc(months_between(sysdate, hiredate ),0)/12 )as "year"
 from employee
 
  select next_day(sysdate,'Monday') from dual
  
 select hiredate,  last_day(hiredate) from employee;

   select next_day(sysdate,'Thursday') from dual
   
    select Employeeid, firstname, salary, commitionpct, manager_id, department_id
 from employee
 
 select Employeeid, firstname, salary, 
 nvl(manager_id,0), 
 Nvl(commitionpct,00),
 nvl(department_id,0),
 nvl(hiredate,'01-JUL-2000')
 from employee
 
  select Employeeid, firstname, salary, manager_id, nvl(manager_id,0), nvl(department_id,0), 
 commitionpct, --salary * commitionpct
 NVL2(commitionpct , salary * commitionpct  , 0) as comm_value 
 from employee



select sysdate from dual

select firstname, lastname, job_id, hiredate from employee

select to_char(sysdate,'Month DD, YYYY') from dual

select to_char(sysdate,'Ddth Month YYth') from dual

select to_char(sysdate,'Day, DDth Month YYYYth HH:MI:SSth') from dual

select to_char(sysdate,'Day') from dual
select to_char(sysdate,'Month') from dual
select to_char(sysdate,'YYYY') from dual

select to_char(sysdate,'Ddspth Month YYYYspth') from dual

select to_char(sysdate,'Ddsp Month YYYYdsp') from dual

select to_char(salary,'99,99,999.99') from Employee


select * from Employee
Where hiredate= to_date('June 10, 2002','Month DD, YYYY')
--Where hiredate = 'June 10, 2002'

select to_date('June 10, 2002','Month DD, YYYY') from dual


select * from Employee
Where hiredate='10-06-02'



select '$68,000' + '$1000'  from dual
select to_number('$68,000','$99,999') +1000  as "HEY" from dual


select max(salary), min(salary), round(avg(salary),2) 
from employee

select * from employee

select avg(salary), sum(salary)/count(distinct(employeeid)) as avegjd from employee
select max(hiredate), min(hiredate) from employee

select (max(hiredate)- min(hiredate))/365 from employee

select count(*) from Employee
select * from employee

select count(manager_id) from Employee

select count( distinct department_id) from employee

select Department_Id, count(employeeid)
from employee
Group by Department_Id


select * from Employee

select employeeid , Department_Id, sum(salary), max(hiredate)
from employee
Group by employeeid


select Department_Id ,sum(salary) tot_salary_paid, job_id
from employee
Group by Department_Id
order by department_id desc



select Department_Id DeptId, sum(salary) tot_salary_paid
from employee
where manager_id is not null
Group by Department_Id
Having department_id =10
and sum(salary)> 10000



select job_id, max(salary), min(salary)
from employee
Where department_id between(10) and (80)    -- row level filter
group by job_id
having max(salary)>60000          -- Group level filter
Order by max(salary)

select department_id, sum(salary) as total_sal    -- column list
from Employee                                     -- table names
Where department_id is not null                   -- row level filter
group by department_id                            -- group the data
--Having sum(salary)>=95000                         -- group level filter
order by total_sal                              -- sort the data



select Employeeid, job_id, salary,
Case Job_id
    When 'IT_REP' then salary - salary
    When 'SALES_REP' then salary - salary
Else     salary
End 
as cal_salary
from Employee


select Employeeid, job_id, salary,
Case 
    When job_id='IT_REP' and salary < 20000 then salary+500
    When job_id='SALES_REP' and salary < 51000 then salary+800
Else 
    salary
End as updated_salary
from Employee



Update employee
set salary = ( Case When job_id='IT_REP' then salary+500
                    When job_id='SALES_REP' and salary < 51000 then salary+800
              Else 
                      salary
              End )
              
              
select * from employee;
