--create database school_test
--drop database school_test

use school;
create table Students(
	id int primary key not null identity(1,1),
	lastName nvarchar(50) not null ,
	firstName nvarchar(50) not null,
	dateOfBirth datetime not null,
	enrollmentDate datetime 
);

create table Courses(
	CourseID int identity(1,1) primary key not null,
	Title nvarchar(50) not null,
	NoOfCredits int,
	CourseCode nvarchar(5) not null, -- example CS333
);











