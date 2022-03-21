-- shredding 
-- convert xml to relational data (table)
-- openxml clause used here
use school;

declare @xmlFile nvarchar(4000);
declare @doc int ;
set @xmlFile='<student1>
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
<sid>1223</sid>
<sname>ankush</sname>
<location>jlagaon</location>
<age>12</age>
</student1>
</student1>'

EXEC sp_xml_preparedocument @doc OUTPUT,@xmlFile

select * from OPENXML(@doc,'/student1/student1',11)		-- 11 values , 12 all null
with(sid int,sname varchar(20),location varchar(20),age int);

EXEC sp_xml_removedocument @doc

