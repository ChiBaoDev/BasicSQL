-- ============================================
-- 1. DANH SÁCH SẢN PHẨM (Pagination)
-- page = 1, pageSize = 5
-- OFFSET = (page - 1) * pageSize
-- ============================================

SELECT *
FROM Courses
ORDER BY CourseId
LIMIT 5
OFFSET 0;

-- ============================================
-- page = 2, pageSize = 5
-- ============================================

SELECT *
FROM Courses
ORDER BY CourseId
LIMIT 5
OFFSET 5;

-- ============================================
-- 2. SEARCH SẢN PHẨM THEO TÊN
-- ============================================

SELECT *
FROM Courses
WHERE CourseName ILIKE '%Java%';

-- ============================================
-- Search theo từ khóa bất kỳ
-- ============================================

SELECT *
FROM Courses
WHERE CourseName ILIKE '%Programming%';

-- ============================================
-- 3. SORT THEO GIÁ TĂNG DẦN
-- ============================================

SELECT *
FROM Courses
ORDER BY Price ASC;

-- ============================================
-- SORT THEO GIÁ GIẢM DẦN
-- ============================================

SELECT *
FROM Courses
ORDER BY Price DESC;

-- ============================================
-- SORT THEO TÊN A -> Z
-- ============================================

SELECT *
FROM Courses
ORDER BY CourseName ASC;

-- ============================================
-- SORT THEO TÊN Z -> A
-- ============================================

SELECT *
FROM Courses
ORDER BY CourseName DESC;

-- ============================================
-- 4. MINI CHALLENGE
-- Search + Price + Pagination
-- page = 1
-- pageSize = 3
-- ============================================

SELECT *
FROM Courses
WHERE CourseName ILIKE '%Programming%'
AND Price >= 1000000
ORDER BY Price ASC
LIMIT 3
OFFSET 0;

-- ============================================
-- Đếm tổng số sản phẩm
-- Phục vụ API tính tổng số trang
-- ============================================

SELECT COUNT(*) AS TotalProducts
FROM Courses;

-- ============================================
-- Tổng số sản phẩm sau khi Search
-- ============================================

SELECT COUNT(*) AS TotalProducts
FROM Courses
WHERE CourseName ILIKE '%Programming%';