-- ============================================
-- 1. TẠO CÁC BẢNG
-- ============================================

CREATE TABLE Students
(
    StudentId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    BirthDate DATE,
    Phone VARCHAR(15)
);

CREATE TABLE Courses
(
    CourseId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Enrollments
(
    EnrollmentId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    EnrollDate DATE,
    Score REAL,

    CONSTRAINT FK_Student
        FOREIGN KEY (StudentId)
        REFERENCES Students(StudentId),

    CONSTRAINT FK_Course
        FOREIGN KEY (CourseId)
        REFERENCES Courses(CourseId)
);

-- ============================================
-- 2. THÊM DỮ LIỆU MẪU CHO BẢNG STUDENTS
-- ============================================

INSERT INTO Students (FullName, Email, BirthDate, Phone)
VALUES
('Nguyen Van A', 'a@gmail.com', '2004-01-10', '0901000001'),
('Tran Thi B', 'b@gmail.com', '2004-02-11', '0901000002'),
('Le Van C', 'c@gmail.com', '2004-03-12', '0901000003'),
('Pham Thi D', 'd@gmail.com', '2004-04-13', '0901000004'),
('Hoang Van E', 'e@gmail.com', '2004-05-14', '0901000005'),
('Vo Thi F', 'f@gmail.com', '2004-06-15', '0901000006'),
('Nguyen Van G', 'g@gmail.com', '2004-07-16', '0901000007'),
('Tran Van H', 'h@gmail.com', '2004-08-17', '0901000008'),
('Le Thi I', 'i@gmail.com', '2004-09-18', '0901000009'),
('Pham Van K', 'k@gmail.com', '2004-10-19', '0901000010'),
('Nguyen Thi L', 'l@gmail.com', '2004-11-20', '0901000011'),
('Tran Van M', 'm@gmail.com', '2004-12-21', '0901000012'),
('Le Van N', 'n@gmail.com', '2003-01-22', '0901000013'),
('Pham Thi O', 'o@gmail.com', '2003-02-23', '0901000014'),
('Hoang Van P', 'p@gmail.com', '2003-03-24', '0901000015'),
('Vo Thi Q', 'q@gmail.com', '2003-04-25', '0901000016'),
('Nguyen Van R', 'r@gmail.com', '2003-05-26', '0901000017'),
('Tran Thi S', 's@gmail.com', '2003-06-27', '0901000018'),
('Le Van T', 't@gmail.com', '2003-07-28', '0901000019'),
('Pham Thi U', 'u@gmail.com', '2003-08-29', '0901000020');

-- ============================================
-- 3. THÊM DỮ LIỆU MẪU CHO BẢNG COURSES
-- ============================================

INSERT INTO Courses (CourseName, Credits)
VALUES
('C# Programming', 3),
('Database Systems', 3),
('Web Development', 4),
('Java Programming', 3),
('Software Engineering', 4);

-- ============================================
-- 4. THÊM MỘT SINH VIÊN MỚI
-- ============================================

INSERT INTO Students (FullName, Email, BirthDate, Phone)
VALUES
('Nguyen Chi Bao', 'bao@gmail.com', '2004-09-15', '0988888888');

-- ============================================
-- 5. CẬP NHẬT THÔNG TIN SINH VIÊN
-- ============================================

UPDATE Students
SET
    FullName = 'Nguyen Chi Bao Updated',
    Email = 'baoupdate@gmail.com',
    Phone = '0911222333'
WHERE StudentId = 21;

-- ============================================
-- 6. XÓA MỘT SINH VIÊN THEO ID
-- ============================================

DELETE FROM Students
WHERE StudentId = 21;

-- ============================================
-- 7. TÌM KIẾM SINH VIÊN THEO TÊN
-- ============================================

SELECT *
FROM Students
WHERE FullName ILIKE '%Bao%';

-- ============================================
-- 8. TÌM KIẾM SINH VIÊN THEO EMAIL
-- ============================================

SELECT *
FROM Students
WHERE Email ILIKE '%gmail.com%';

-- ============================================
-- 9. DELETE AN TOÀN BẰNG TRANSACTION
-- Nếu thấy xóa nhầm thì dùng ROLLBACK để khôi phục.
-- Nếu muốn lưu thay đổi thì thay ROLLBACK bằng COMMIT.
-- ============================================

BEGIN;

DELETE FROM Students
WHERE StudentId = 20;

-- Kiểm tra xem bản ghi đã bị xóa chưa
SELECT *
FROM Students
WHERE StudentId = 20;

-- Hoàn tác thao tác xóa
ROLLBACK;