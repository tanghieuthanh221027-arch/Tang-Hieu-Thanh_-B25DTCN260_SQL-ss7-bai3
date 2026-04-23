CREATE DATABASE TrainingManagement;
USE TrainingManagement;

CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(150) UNIQUE,
    created_at DATE
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    amount DECIMAL(15,2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (full_name, email, created_at) VALUES
('Nguyen Van A', 'a@gmail.com', '2023-01-01'),
('Tran Thi B', 'b@gmail.com', '2023-02-01'),
('Le Van C', 'c@gmail.com', '2023-03-01'),
('Pham Thi D', 'd@gmail.com', '2023-04-01'),
('Hoang Van E', 'e@gmail.com', '2023-05-01'),
('Do Thi F', 'f@gmail.com', '2023-06-01'),
('Bui Van G', 'g@gmail.com', '2023-07-01'),
('Dang Thi H', 'h@gmail.com', '2023-08-01'),
('Ngo Van I', 'i@gmail.com', '2023-09-01'),
('Phan Thi K', 'k@gmail.com', '2023-10-01');

INSERT INTO Payments (student_id, amount, payment_date) VALUES
(1, 5000000, '2024-01-10'),
(2, 3000000, '2024-03-15'),
(3, 7000000, '2024-05-20'),

(4, 4000000, '2023-06-10'),
(5, 6000000, '2023-08-15'),

(6, 2000000, '2023-07-01'),
(6, 8000000, '2024-02-01'),

(8, 1000000, NULL);

-- code sửa
SELECT s.email
FROM Students s
WHERE NOT EXISTS (
    SELECT 1
    FROM Payments p
    WHERE p.student_id = s.student_id AND p.payment_date >= '2024-01-01' AND p.payment_date < '2025-01-01'
);

-- Dùng NOT EXISTS thắng về mặt hiệu năng vì khi chạy nếu tìm được 1 kết quả đúng thì sẽ dừng luôn không quét hết , NOT IN kém hơn vì bài này có null nên khi dùng NOT IN thì sẽ trả về UNKNOWN khiến kết qủa không đúng 