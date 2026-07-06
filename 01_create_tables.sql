-- ============================================
-- DATABASE PRACTICE
-- FILE: 01_create_tables.sql
-- Mô tả: Tạo các bảng cho hệ thống quản lý kho
-- ============================================

-- ============================================
-- 1. BẢNG USERS
-- ============================================

CREATE TABLE Users
(
    UserId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Role VARCHAR(20) NOT NULL
);

-- ============================================
-- 2. BẢNG CATEGORIES
-- ============================================

CREATE TABLE Categories
(
    CategoryId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

-- ============================================
-- 3. BẢNG SUPPLIERS
-- ============================================

CREATE TABLE Suppliers
(
    SupplierId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(200)
);

-- ============================================
-- 4. BẢNG PRODUCTS
-- ============================================

CREATE TABLE Products
(
    ProductId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,

    CategoryId INT NOT NULL,
    SupplierId INT NOT NULL,

    CONSTRAINT FK_Product_Category
        FOREIGN KEY (CategoryId)
        REFERENCES Categories(CategoryId),

    CONSTRAINT FK_Product_Supplier
        FOREIGN KEY (SupplierId)
        REFERENCES Suppliers(SupplierId)
);

-- ============================================
-- 5. BẢNG STOCKIN
-- Lưu lịch sử nhập kho
-- ============================================

CREATE TABLE StockIn
(
    StockInId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    ImportDate DATE NOT NULL,

    CONSTRAINT FK_StockIn_Product
        FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId)
);

-- ============================================
-- 6. BẢNG STOCKOUT
-- Lưu lịch sử xuất kho
-- ============================================

CREATE TABLE StockOut
(
    StockOutId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,

    ProductId INT NOT NULL,
    Quantity INT NOT NULL,
    ExportDate DATE NOT NULL,

    CONSTRAINT FK_StockOut_Product
        FOREIGN KEY (ProductId)
        REFERENCES Products(ProductId)
);