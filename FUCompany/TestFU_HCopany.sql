SELECT *
FROM tblDepartment
--Muốn xem cái gì thì xóa * đi
SELECT depNum, depName
FROM tblDepartment
--Muốn in hoa, in thường. Phải đặt lại tên
SELECT depNum, upper(depName) AS Name
FROM tblDepartment
-- Điều kiện
SELECT *
FROM tblEmployee
WHERE empName = N'Võ Việt Anh'
--Liệt kê tuple giống nhau thông qua điều kiện
SELECT *
FROM tblEmployee
WHERE empName LIKE N'%Anh' --hoặc WHERE empName LIKE N'Nguyễn%' để check đầu và LIKE N'Nguyễn_' để check giữa (Bao nhiêu gạch là bấy nhiêu kí tự đằng sau)
--Thêm điều kiện
SELECT *
FROM tblEmployee
WHERE empName LIKE N'%Anh' AND empSalary > 100000

SELECT *
FROM tblEmployee
WHERE empName LIKE N'%Anh' AND empSalary BETWEEN 50000 AND 100000