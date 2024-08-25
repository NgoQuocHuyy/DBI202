--select d.depNum,d.depName, max(empSalary) as 'MaxSalary',
--       min(empSalary) as 'MinSalary',
--	   avg(empSalary) as 'AverageSalary',
--	   count(empSSN)  as 'NumberOfEmployees',
--	   sum(empSalary) as 'SumSalary'
--from tblEmployee e join tblDepartment d on
--     e.depNum = d.depNum
--group by d.depNum,d.depName
--having count(empSSN) >= 4
--order by SumSalary desc --desc la giam dan, mac dinh order la tang dan

--select d.depName, d.depName,
--     count(p.proNum) as 'NumberOfProject' 
--from tblDepartment d
--left join tblProject p --van hien thi ra 0 neu khong co gia tri
--   on d.depNum = p.depNum
--group by d.depName, d.depName
--order by NumberOfProject desc

--PRACTICAL EXCERCISE

--Q1
--select depSex, count(depSex) as 'numDependents'
--from tblDependent
--group by depSex
--order by numDependents desc

--Q2
--select depRelationship, count(depSex) as 'numDependents'
--from tblDependent
--group by depRelationship

--Q3
--select d.depNum, d.depName, count(de.empSSN) as 'numDependents'
--from tblDepartment d left join tblEmployee e
--  on d.depNum = e.depNum left join
 -- tblDependent de on e.empSSN = de.empSSN
--group by d.depNum, d.depName

--Q4
--select e.empSSN, e.empName, sum(w.workHours) as 'sumWorkHours'
--from tblEmployee e join tblWorksOn w 
--     on e.empSSN = w.empSSN
--group by e.empSSN, e.empName

--Q5
--select d.depNum, d.depName, sum(w.workHours) as 'sumWorkHours'
--from tblEmployee e left join tblWorksOn w 
--   on e.empSSN = w.empSSN 
--   left join tblDepartment d
--   on d.depNum = e.depNum
--group by d.depNum, d.depName


--Q6
--select e.empSSN, e.empName, d.depName
--from tblEmployee e join tblDepartment d
--     on e.depNum = d.depNum
--     join tblWorksOn w
--    on e.empSSN = w.empSSN 
--group by e.empSSN, e.empName, d.depName
--having count(w.proNum) = 1

--Q7
--select e.empSSN, e.empName, d.depName
--from tblEmployee e join tblDepartment d
--    on e.depNum = d.depNum
--    join tblWorksOn w
--   on e.empSSN = w.empSSN 
--group by e.empSSN, e.empName, d.depName
--having count(w.proNum) =2

--Q8
--select e.empSSN, e.empName, d.depName
--from tblEmployee e join tblDepartment d
--    on e.depNum = d.depNum
--    join tblWorksOn w
--   on e.empSSN = w.empSSN 
--group by e.empSSN, e.empName, d.depName
--having count(w.proNum) >=2

--Q9 sai
--select p.proNum, p.proName, count(e.empSSN) as 'numOfEmployees'
--from tblEmployee e join tblProject p
--     on e.depNum = p.depNum
--group by p.proNum, p.proName //sua cau nay voi workon 

--Q10
--select p.proNum, p.proName, sum(w.workHours) as 'sumWorkHours'
--from tblProject p join tblWorksOn w
--     on p.proNum = w.proNum
--group by p.proNum, p.proName

--Q11
--select l.locName, count(d.depNum) as 'numOfDepartments'
--from tblDepartment d join tblDepLocation dl
--    on d.depNum = dl.depNum
--	 join tblLocation l
--	 on dl.locNum = l.locNum
--group by l.locName

--Q12
--select d.depNum, d.depName, count(l.locNum) as 'numOfLocations'
--from tblDepartment d join tblDepLocation dl
--   on d.depNum = dl.depNum
--	 join tblLocation l
--  on dl.locNum = l.locNum
--group by d.depNum, d.depName
