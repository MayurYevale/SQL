-- XQUERY :
-- QUERYING xml data
-- functional query language
-- rerieve data from xml
use school
declare @xlmstudent as xml = 
'<Student1>
<student1 sid="34" sname="scoot" location="nashik" age="28"/>
<student1 sid="23" sname="josh" location="jalgaon" age="23"/>
<student1 sid="267" sname="boahs" location="jalgaon" age="32"/>

</Student1>'

--select @xlmstudent.query('School/Student1') -- one way in single row
 

 --select T.C.query('.') AS result
 --from @xlmstudent.nodes('Student1/student1') T(C) --another way  multiple row

 --select @xlmstudent.query('Student1/student1[@sid > 10]')


 -- FOR TABLE FORMAT
 select
 student1.C.value('@sid','int') as ID,
 student1.C.value('@sname','varchar(20)') as Name,
 student1.C.value('@location','varchar(20)') as Location,
 student1.C.value('@age','int') as AGE
 FROM @xlmstudent.nodes('Student1/student1[@sid > 100 or @age > 23]') student1(C)

