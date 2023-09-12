create database student_management;
use student_management;
create table Student(
 id int,
 student_name varchar(200),
 age int,
 country varchar(50)
);
create table class(
id int primary key auto_increment,
class_name varchar(55) 
);
create table teacher(
id int primary key auto_increment,
teacher_name varchar(200),
age int,
country varchar(50)

);
select * from `student`;
alter table `class` RENAME `Class_name`;
alter table `Class_name` RENAME `Class`;