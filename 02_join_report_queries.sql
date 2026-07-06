-- ============================================
-- 1. THÊM DỮ LIỆU CHO BẢNG ENROLLMENTS
-- ============================================

INSERT INTO Enrollments (StudentId, CourseId, EnrollDate, Score)
VALUES
(1,1,'2026-07-01',8.5),
(2,1,'2026-07-01',7.5),
(3,2,'2026-07-02',9.0),
(4,2,'2026-07-02',8.0),
(5,3,'2026-07-03',9.5),
(6,3,'2026-07-03',6.5),
(7,4,'2026-07-04',7.0),
(8,4,'2026-07-04',8.5),
(9,5,'2026-07-05',9.0),
(10,5,'2026-07-05',8.0),
(11,1,'2026-07-06',6.0),
(12,2,'2026-07-06',7.8);

-- ============================================
-- Query 1
-- Danh sách sinh viên và khóa học đang học
-- ============================================

SELECT
    s.StudentId,
    s.FullName,
    c.CourseName,
    e.EnrollDate,
    e.Score
FROM Students s
INNER JOIN Enrollments e
ON s.StudentId = e.StudentId
INNER JOIN Courses c
ON e.CourseId = c.CourseId;

-- ============================================
-- Query 2
-- Đếm số sinh viên theo từng khóa học
-- ============================================

SELECT
    c.CourseName,
    COUNT(e.StudentId) AS TotalStudents
FROM Courses c
LEFT JOIN Enrollments e
ON c.CourseId = e.CourseId
GROUP BY c.CourseName;

-- ============================================
-- Query 3
-- Khóa học chưa có sinh viên
-- ============================================

SELECT
    c.CourseId,
    c.CourseName
FROM Courses c
LEFT JOIN Enrollments e
ON c.CourseId = e.CourseId
WHERE e.StudentId IS NULL;

-- ============================================
-- Query 4
-- Điểm trung bình của từng khóa học
-- ============================================

SELECT
    c.CourseName,
    ROUND(AVG(e.Score)::numeric, 2) AS AverageScore
FROM Courses c
INNER JOIN Enrollments e
ON c.CourseId = e.CourseId
GROUP BY c.CourseName;

-- ============================================
-- Query 5
-- Sinh viên có điểm >= 8
-- ============================================

SELECT
    s.FullName,
    c.CourseName,
    e.Score
FROM Students s
INNER JOIN Enrollments e
ON s.StudentId = e.StudentId
INNER JOIN Courses c
ON c.CourseId = e.CourseId
WHERE e.Score >= 8;

-- ============================================
-- Query 6
-- Số khóa học mỗi sinh viên tham gia
-- ============================================

SELECT
    s.FullName,
    COUNT(e.CourseId) AS TotalCourses
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentId = e.StudentId
GROUP BY s.FullName
ORDER BY TotalCourses DESC;

-- ============================================
-- Query 7
-- Danh sách sinh viên chưa đăng ký khóa học
-- ============================================

SELECT
    s.StudentId,
    s.FullName
FROM Students s
LEFT JOIN Enrollments e
ON s.StudentId = e.StudentId
WHERE e.StudentId IS NULL;

-- ============================================
-- Query 8
-- Khóa học có nhiều sinh viên nhất
-- ============================================

SELECT
    c.CourseName,
    COUNT(e.StudentId) AS TotalStudents
FROM Courses c
LEFT JOIN Enrollments e
ON c.CourseId = e.CourseId
GROUP BY c.CourseName
ORDER BY TotalStudents DESC
LIMIT 1;

-- ============================================
-- MINI CHALLENGE
-- Thiết kế Orders và OrderDetails
-- ============================================

CREATE TABLE Orders
(
    OrderId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CustomerName VARCHAR(100),
    OrderDate DATE
);

CREATE TABLE OrderDetails
(
    DetailId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    OrderId INT,
    ProductName VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10,2),

    CONSTRAINT FK_Order
    FOREIGN KEY (OrderId)
    REFERENCES Orders(OrderId)
);

-- ============================================
-- Thêm dữ liệu mẫu
-- ============================================

INSERT INTO Orders (CustomerName, OrderDate)
VALUES
('Nguyen Van A','2026-07-06'),
('Tran Thi B','2026-07-06');

INSERT INTO OrderDetails (OrderId, ProductName, Quantity, UnitPrice)
VALUES
(1,'Laptop',1,15000000),
(1,'Mouse',2,300000),
(1,'Keyboard',1,500000),
(2,'Monitor',2,3500000),
(2,'Speaker',1,1200000);

-- ============================================
-- Tính tổng tiền từng đơn hàng
-- ============================================

SELECT
    o.OrderId,
    o.CustomerName,
    SUM(d.Quantity * d.UnitPrice) AS TotalAmount
FROM Orders o
INNER JOIN OrderDetails d
ON o.OrderId = d.OrderId
GROUP BY o.OrderId, o.CustomerName;