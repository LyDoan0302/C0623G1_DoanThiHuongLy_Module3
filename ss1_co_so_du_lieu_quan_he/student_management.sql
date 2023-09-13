CREATE DATABASE student_management;
USE student_management;
CREATE TABLE Student(
 id INT PRIMARY KEY,
 student_name VARCHAR(200),
 age INT,
 country VARCHAR(50)
);
CREATE TABLE class(
id INT PRIMARY KEY AUTO_INCREMENT,
class_name VARCHAR(55) 
);
CREATE TABLE teacher(
id INT PRIMARY KEY AUTO_INCREMENT,
teacher_name VARCHAR(200),
age INT,
country VARCHAR(50)

);
SELECT * 
FROM `student`;
ALTER TABLE `class` RENAME `Class_name`;
ALTER TABLE `Class_name` RENAME `Class`;