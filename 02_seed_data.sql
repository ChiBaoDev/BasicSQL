-- ============================================
-- DATABASE PRACTICE
-- FILE: 02_seed_data.sql
-- Mô tả: Thêm dữ liệu mẫu
-- ============================================

-- ============================================
-- 1. DỮ LIỆU USERS
-- ============================================

INSERT INTO Users (FullName, Email, Password, Role)
VALUES
('Nguyen Chi Bao', 'bao@gmail.com', '123456', 'Admin'),
('Nguyen Van A', 'a@gmail.com', '123456', 'Staff'),
('Tran Thi B', 'b@gmail.com', '123456', 'Staff'),
('Le Van C', 'c@gmail.com', '123456', 'Staff'),
('Pham Thi D', 'd@gmail.com', '123456', 'Staff');

-- ============================================
-- 2. DỮ LIỆU CATEGORIES
-- ============================================

INSERT INTO Categories (CategoryName)
VALUES
('Laptop'),
('Phone'),
('Monitor'),
('Keyboard'),
('Mouse');

-- ============================================
-- 3. DỮ LIỆU SUPPLIERS
-- ============================================

INSERT INTO Suppliers (SupplierName, Phone, Address)
VALUES
('FPT Shop', '0901111111', 'Ho Chi Minh'),
('Phong Vu', '0902222222', 'Ho Chi Minh'),
('CellphoneS', '0903333333', 'Ha Noi'),
('GearVN', '0904444444', 'Ho Chi Minh'),
('The Gioi Di Dong', '0905555555', 'Da Nang');

-- ============================================
-- 4. DỮ LIỆU PRODUCTS
-- ============================================

INSERT INTO Products
(ProductName, Price, Quantity, CategoryId, SupplierId)
VALUES
('MacBook Air M4', 28000000, 10, 1, 1),
('Dell Inspiron 15', 18000000, 8, 1, 2),
('iPhone 16', 26000000, 15, 2, 3),
('Samsung Galaxy S25', 22000000, 12, 2, 5),
('LG UltraWide 29"', 6500000, 6, 3, 2),
('ASUS TUF VG249Q', 4800000, 9, 3, 4),
('Keychron K2', 1900000, 20, 4, 4),
('AKKO 3068B', 1700000, 18, 4, 2),
('Logitech G102', 450000, 30, 5, 4),
('Razer DeathAdder', 890000, 15, 5, 4);

-- ============================================
-- 5. DỮ LIỆU STOCK IN
-- ============================================

INSERT INTO StockIn
(ProductId, Quantity, ImportDate)
VALUES
(1, 10, '2026-07-01'),
(2, 8, '2026-07-01'),
(3, 15, '2026-07-02'),
(4, 12, '2026-07-02'),
(5, 6, '2026-07-03'),
(6, 9, '2026-07-03'),
(7, 20, '2026-07-04'),
(8, 18, '2026-07-04'),
(9, 30, '2026-07-05'),
(10, 15, '2026-07-05');

-- ============================================
-- 6. DỮ LIỆU STOCK OUT
-- ============================================

INSERT INTO StockOut
(ProductId, Quantity, ExportDate)
VALUES
(1, 2, '2026-07-06'),
(2, 1, '2026-07-06'),
(3, 3, '2026-07-07'),
(4, 2, '2026-07-07'),
(5, 1, '2026-07-08'),
(6, 2, '2026-07-08'),
(7, 5, '2026-07-09'),
(8, 3, '2026-07-09'),
(9, 10, '2026-07-10'),
(10, 4, '2026-07-10');