CREATE DATABASE CourseManagement;
USE CourseManagement;

CREATE TABLE Courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enroll_date DATE
);

INSERT INTO Courses (course_name, price) VALUES
('SQL Cơ bản', 1000000),
('SQL Nâng cao', 2000000),
('Python cho Data', 3000000),
('Machine Learning', 5000000),
('Deep Learning', 7000000);

INSERT INTO Enrollments (student_id, course_id, enroll_date) VALUES
(1, 1, '2024-01-01'),
(2, 2, '2024-02-01'),
(3, 3, '2024-03-01'),
(4, NULL, '2024-04-01');

-- code sửa 
SELECT *
FROM Courses c
WHERE NOT EXISTS (
    SELECT 1
    FROM Enrollments e
    WHERE e.course_id = c.id
);

-- biểu thức NOT IN (1 , 2 , NULL) bị đánh giá là FALSE / UNKNOWN , trong WHERE chỉ lấy TRUE nên khi chạy sẽ mất hết dữ liệu