use school
declare @xmlContent as XML
set @xmlContent = (
select * from Students for xml path('STUDENTS'),
ROOT('STUDENTS')
);

select @xmlContent

-- creating xml file from table students


-- now inserting the record 
-- from xml to table
create table student1(sid int , sname varchar(20),location varchar(20), age int);
select * from student1

create procedure insertDetails
@xmldata XML
as 
begin
set nocount on;
insert into student1(sid,sname,location,age)
select x.value('sid[1]','int') as sid,
x.value('sname[1]','varchar(20)') as sname,
x.value('location[1]','varchar(20)') as location,
x.value('age[1]','int') as age
from @xmldata.nodes('//student1') xmldata(x)
end
go


declare @xmldata xml
set @xmldata='<student1>
<student1>
<sid>101</sid>
<sname>jeni</sname>
<location>america</location>
<age>23</age>
</student1>

<student1>
<sid>121</sid>
<sname>mayur</sname>
<location>bhadgona</location>
<age>34</age>
</student1>

<student1>
<sid>132</sid>
<sname>shubham</sname>
<location>jlagaon</location>
<age>12</age>
</student1>
</student1>'

exec insertDetails @xmldata  -- addding xmldata to student1 table
-- using procedure


