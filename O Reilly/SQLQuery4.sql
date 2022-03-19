use school

--select * from Students;
--select [firstName] as 'First Name', [lastName] [Last Name],
--firstName+' '+lastName as 'Full Name', [dateOfBirth] from Students;

--select top(3)[firstName], [dateOfBirth] from Students order by dateOfBirth;
-- old 3 students


--select [firstName] as 'First Name', [lastName] [Last Name],
--firstName+' '+lastName as 'Full Name', [dateOfBirth] from Students 
--where lastName= 'yeole';


-- wildcard
--select [firstName] as 'First Name', [lastName] [Last Name]
--, [dateOfBirth] from Students 
--where lastName like '_e%';


--update Students set enrollmentDate = '2019-02-02'; -- all rows
--update Students set enrollmentDate = '2019-02-02'
--where enrollmentDate is null;

--update Students set firstName='heyhey' where id=2;

 -- DELETE OPERATION
 delete from Students where id=1 

select * from Students;