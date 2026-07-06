-- ============================================
-- DATABASE PRACTICE
-- FILE: 03_queries.sql
-- Mô tả: 20 câu query
-- ============================================

-- ============================================
-- 1. Hiển thị tất cả sản phẩm
-- ============================================

SELECT * FROM Products;

-- ============================================
-- 2. Hiển thị tất cả danh mục
-- ============================================

SELECT * FROM Categories;

-- ============================================
-- 3. Hiển thị tất cả nhà cung cấp
-- ============================================

SELECT * FROM Suppliers;

-- ============================================
-- 4. Hiển thị tất cả người dùng
-- ============================================

SELECT * FROM Users;

-- ============================================
-- 5. Tìm sản phẩm có giá lớn hơn 10 triệu
-- ============================================

SELECT *
FROM Products
WHERE Price > 10000000;

-- ============================================
-- 6. Tìm sản phẩm theo tên
-- ============================================

SELECT *
FROM Products
WHERE ProductName ILIKE '%Dell%';

-- ============================================
-- 7. Sắp xếp sản phẩm theo giá tăng dần
-- ============================================

SELECT *
FROM Products
ORDER BY Price ASC;

-- ============================================
-- 8. Sắp xếp sản phẩm theo tên
-- ============================================

SELECT *
FROM Products
ORDER BY ProductName ASC;

-- ============================================
-- 9. Danh sách sản phẩm kèm danh mục
-- ============================================

SELECT
    p.ProductName,
    c.CategoryName
FROM Products p
INNER JOIN Categories c
ON p.CategoryId = c.CategoryId;

-- ============================================
-- 10. Danh sách sản phẩm kèm nhà cung cấp
-- ============================================

SELECT
    p.ProductName,
    s.SupplierName
FROM Products p
INNER JOIN Suppliers s
ON p.SupplierId = s.SupplierId;

-- ============================================
-- 11. Đếm số sản phẩm theo danh mục
-- ============================================

SELECT
    c.CategoryName,
    COUNT(p.ProductId) AS TotalProducts
FROM Categories c
LEFT JOIN Products p
ON c.CategoryId = p.CategoryId
GROUP BY c.CategoryName;

-- ============================================
-- 12. Giá trung bình của sản phẩm
-- ============================================

SELECT
    ROUND(AVG(Price),2) AS AveragePrice
FROM Products;

-- ============================================
-- 13. Danh sách phiếu nhập
-- ============================================

SELECT
    si.StockInId,
    p.ProductName,
    si.Quantity,
    si.ImportDate
FROM StockIn si
INNER JOIN Products p
ON si.ProductId = p.ProductId;

-- ============================================
-- 14. Danh sách phiếu xuất
-- ============================================

SELECT
    so.StockOutId,
    p.ProductName,
    so.Quantity,
    so.ExportDate
FROM StockOut so
INNER JOIN Products p
ON so.ProductId = p.ProductId;

-- ============================================
-- 15. Tổng số lượng nhập theo sản phẩm
-- ============================================

SELECT
    p.ProductName,
    SUM(si.Quantity) AS TotalImport
FROM Products p
INNER JOIN StockIn si
ON p.ProductId = si.ProductId
GROUP BY p.ProductName;

-- ============================================
-- 16. Tổng số lượng xuất theo sản phẩm
-- ============================================

SELECT
    p.ProductName,
    SUM(so.Quantity) AS TotalExport
FROM Products p
INNER JOIN StockOut so
ON p.ProductId = so.ProductId
GROUP BY p.ProductName;

-- ============================================
-- 17. Tính tồn kho
-- ============================================

SELECT
    p.ProductName,
    p.Quantity +
    COALESCE((SELECT SUM(Quantity)
              FROM StockIn
              WHERE ProductId = p.ProductId),0)
    -
    COALESCE((SELECT SUM(Quantity)
              FROM StockOut
              WHERE ProductId = p.ProductId),0)
    AS CurrentStock
FROM Products p;

-- ============================================
-- 18. Sản phẩm chưa từng xuất kho
-- ============================================

SELECT
    p.ProductName
FROM Products p
LEFT JOIN StockOut so
ON p.ProductId = so.ProductId
WHERE so.StockOutId IS NULL;

-- ============================================
-- 19. Sản phẩm chưa từng nhập kho
-- ============================================

SELECT
    p.ProductName
FROM Products p
LEFT JOIN StockIn si
ON p.ProductId = si.ProductId
WHERE si.StockInId IS NULL;

-- ============================================
-- 20. Tổng giá trị hàng tồn kho
-- ============================================

SELECT
    SUM(Price * Quantity) AS TotalInventoryValue
FROM Products;