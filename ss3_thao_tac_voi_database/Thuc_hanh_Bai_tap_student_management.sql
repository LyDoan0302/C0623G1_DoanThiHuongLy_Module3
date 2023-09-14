CREATE DATABASE student_management;
USE student_management;
CREATE TABLE class
(
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATE        NOT NULL,
    status     BIT
);
CREATE TABLE student
(
    student_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(30) NOT NULL,
    address      VARCHAR(50),
    phone        VARCHAR(20),
    status       BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);
CREATE TABLE subject
(
    sub_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit   TINYINT     NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    status   BIT                  DEFAULT 1
);

CREATE TABLE mark (
    mark_id    INT     NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT     NOT NULL,
    student_id INT     NOT NULL,
    mark       FLOAT   DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id , student_id),
    FOREIGN KEY (sub_id)     REFERENCES subject (sub_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', CURRENT_DATE, 0);

INSERT INTO student 
VALUES (1,'Hung', 'Ha Noi', '0912113113', 1, 1),
       (2,'Hoa', 'Hai phong','081777777', 1, 1),
       (3,'Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- Hiển thị danh sách tất cả các học viên
SELECT * 
FROM student;

-- Hiển thị danh sách các học viên đang theo học.
SELECT *
FROM student
WHERE status= TRUE;

-- HIỂN thị danh sÁCH các môn học có thời gian học nhỏ hơn 10 giờ.
SELECT *
FROM subject
WHERE credit < 10;    
   
-- HIỂN thị danh SÁCH học viên lỚP A1
SELECT *
FROM student s
JOIN class c ON s.class_id=c.class_id
WHERE c.class_name = 'A1';

-- HIển thị điểm mÔn CF của CÁC Học viên.
SELECT *
FROM student s
JOIN mark m ON s.student_id = m.student_id
JOIN subject sb ON m.sub_id = sb.sub_id
WHERE sb.sub_name = 'CF';

-- HIển thị tất cẢ cáC sinh vIên Có tên bẮT ĐẦu bẢng ký tự ‘h’
SELECT *
FROM student s
WHERE s.student_name LIKE 'h%';

-- Hiển thị các thông tin lớp học có THỜI GiAn BẮT đầu vào thÁNG 12.
SELECT *
FROM class c
WHERE MONTH(start_date) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảNG TỪ 3-5.
SELECT *
FROM subject
WHERE credit >= 3 AND credit <= 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
SET sql_safe_updates = 0;
UPDATE student
SET class_id = 2
WHERE student_name = 'Hung';
SET sql_safe_updates = 1;

-- Hiển thị các thông tin: StudentNAMe, SubName, Mark. 
-- DỮ LIỆU sắp xếp THEo điểm thi (MaRK) Giảm dần. nếu tRùng sắp tHEO tên tăng dần.
SELECT s.student_name, sb.sub_name, m.mark
FROM student s
JOIN mark m ON m.student_id = s.student_id
JOIN subject sb ON sb.sub_id = m.sub_id
ORDER BY m.mark DESC, s.student_name ASC;

-- Hiển thị số lượng sinh viên ở từng nơi
SELECT s.address, COUNT(s.student_id)
FROM student s
GROUP BY s.address;

-- Tính điểm trung bình các môn học của mỗi học viên
SELECT s.student_id, s.student_name, AVG(m.mark) AS avg_of_mark
FROM student s
JOIN mark m ON s.student_id = m.student_id
GROUP BY s.student_id;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT s.student_id, s.student_name, AVG(m.mark) AS mark_avg
FROM student s
JOIN mark m ON s.student_id = m.student_id
GROUP BY s.student_id, s.student_name
HAVING mark_avg > 5;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT s.student_name, s.student_id, avg(m.mark)
FROM student s
JOIN mark m ON s.student_id = m.student_id
GROUP BY s.student_id
HAVING AVG(m.mark) >= (
SELECT AVG(mark)
FROM mark)
;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * 
FROM subject
WHERE credit  = (
SELECT MAX(credit)
FROM subject); 

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT *
FROM subject s
LEFT JOIN mark m ON s.sub_id = m.sub_id
WHERE m.mark = (
SELECT MAX(mark)
FROM mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT s.student_id, AVG(m.mark) AS avg_mark
FROM student s
JOIN mark m ON s.student_id = m.student_id
GROUP BY s.student_id
ORDER BY avg_mark desc;
