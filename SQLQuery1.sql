create database Exam_J2EE

 use Exam_J2EE

 create table UserLogin
 (
id int primary key IDENTITY(1,1),
 username varchar(100),
 userpassword varchar (100),
 useremail varchar(100),
 userphone varchar (100)
 );

select * from UserLogin
