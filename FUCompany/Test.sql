SELECT e.empSSN, e.empName, d.depName, e.empSalary, e.empBirthdate
FROM dbo.tblEmployee e JOIN dbo.tblDepartment d ON e.depNum=d.depNum
--WHERE e.empSalary > 100000
	--AND d.depName = N'Phòng Phần mềm nước ngoài'
	--AND (YEAR(GETDATE()) - YEAR(e.empBirthdate)) > 50
--ORDER BY e.empSalary ASC
--Câu 1 edunext
WHERE d.depName = N'Phòng Nghiên cứu và phát triển' AND d.mgrSSN = e.empSSN
--Câu 2 edunext
SELECT p.proNum, p.proName, d.depName
FROM dbo.tblProject p JOIN dbo.tblDepartment d ON d.depNum = p.depNum
WHERE d.depName = N'Phòng Phần mềm trong nước'
--Câu 3 edunext
SELECT p.proNum, p.proName, d.depName
FROM dbo.tblProject p JOIN dbo.tblDepartment d ON d.depNum = p.depNum
WHERE p.proName = 'ProjectB'
--Câu 4 edunext
SELECT e.empSSN, e.empName
FROM dbo.tblEmployee e JOIN dbo.tblEmployee d ON e.supervisorSSN = d.empSSN
WHERE d.empName = N'Mai Duy An'
--Câu 5 edunext
SELECT d.empSSN, d.empName
FROM dbo.tblEmployee e JOIN dbo.tblEmployee d ON e.supervisorSSN = d.empSSN
WHERE e.empName = N'Mai Duy An'
--Câu 6 edunext slot 11
SELECT l.locNum, l.locName
FROM dbo.tblProject p JOIN dbo.tblLocation l ON l.locName = p.locNum
WHERE p.proName = 'ProjectA'
--Câu 7
SELECT p.proNum, p.proName
FROM dbo.tblProject p JOIN dbo.tblLocation l ON l.locNum = p.locNum
WHERE l.locName = N'TP Hồ Chí Minh'
--Câu 8
