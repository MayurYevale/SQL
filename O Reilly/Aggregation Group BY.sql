-- Group By is used when  we use aggregate function on any column
use school
--select courseid ,avg(grade) [Avg Grade]  from Enrollments
--group by CourseID

-- when we want to add filter on column use WHERE
-- when we have to add filter on aggregate column/function then use HAVING CLAUSE


use school
--select courseid ,avg(grade) [Avg Grade]  from Enrollments
--group by CourseID
----HAVING avg(grade) is not null
--having avg(grade) > 50

--select c.Title [Course],c.courseid , count(e.studentid)[Students Enrolled] from Enrollments e
--inner join courses c on c.CourseID= e.CourseID
--group by c.Title, c.CourseID	-- we get no of students enrolled for each course



-- Highest and lowest
--select CourseID, max(Grade) [Max Grade], min(grade) [ Min Grade] from Enrollments
--where Grade is not null
--group by CourseID	-- this gives max and min grade for each course 



-- total no of credits that each student is doing
select 
sum(c.NoOfCredits) [Credits],
s.firstName+' '+s.lastName [Student Name]
from Enrollments e
inner join Courses c on c.CourseID = e.CourseID
inner join Students s on s.id = e.StudentID
group by s.firstName+' '+s.lastName -- gives no of total credits by student










