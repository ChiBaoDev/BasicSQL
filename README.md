# Basic SQL - Day 03

## Nội dung

Trong bài này mình thực hành các câu lệnh SQL để phục vụ API lấy danh sách dữ liệu.

Các nội dung đã làm:

* Phân trang dữ liệu (Pagination)
* Tìm kiếm theo tên sản phẩm
* Sắp xếp theo giá
* Sắp xếp theo tên
* Kết hợp tìm kiếm và phân trang
* Đếm tổng số bản ghi

## Pagination là gì?

Pagination là cách chia dữ liệu thành nhiều trang để mỗi lần chỉ lấy một số lượng bản ghi nhất định.

Ví dụ có 100 sản phẩm nhưng chỉ muốn hiển thị 10 sản phẩm mỗi lần thì sẽ dùng Pagination.

Trong PostgreSQL sử dụng:

```sql
LIMIT pageSize
OFFSET (page - 1) * pageSize
```

Ví dụ:

Trang 1:

```sql
SELECT *
FROM Courses
LIMIT 5
OFFSET 0;
```

Trang 2:

```sql
SELECT *
FROM Courses
LIMIT 5
OFFSET 5;
```

## Search

Tìm kiếm tên khóa học bằng từ khóa.

```sql
SELECT *
FROM Courses
WHERE CourseName ILIKE '%Java%';
```

## Sort

Sắp xếp theo giá tăng dần:

```sql
ORDER BY Price ASC;
```

Sắp xếp theo tên:

```sql
ORDER BY CourseName ASC;
```

## Search kết hợp Pagination

Có thể vừa tìm kiếm vừa phân trang.

```sql
SELECT *
FROM Courses
WHERE CourseName ILIKE '%Programming%'
ORDER BY Price
LIMIT 3
OFFSET 0;
```

## Kiến thức học được

* Sử dụng LIMIT và OFFSET để phân trang.
* Dùng ILIKE để tìm kiếm không phân biệt chữ hoa và chữ thường.
* Sử dụng ORDER BY để sắp xếp dữ liệu.
* Kết hợp nhiều điều kiện trong một câu truy vấn để phục vụ API.
* Dùng COUNT(*) để đếm tổng số dữ liệu.
