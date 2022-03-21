-- Element Format

use school
declare @xlmstudent as xml = 
'<Student1>
<student1> <sid>34</sid> <sname>scoot</sname> <location>nashik</location> <age>28</age></student1>
<student1> <sid>23</sid> <sname>hosh</sname> <location>jalgaon</location> <age>31</age></student1>
<student1> <sid>87</sid> <sname>nana</sname> <location>phata</location> <age>67</age></student1>

</Student1>'

--select @xlmstudent.query('Student1/student1') -- in one single row

select T.C.query('.') as result 
from @xlmstudent.nodes('Student1/student1') T(C)
order by T.C.value('age[1]','int'); -- separet for each row