select e.empSSN, e.empName, e.empSalary
from tblDepartment d join tblEmployee e 
on d.depNum = e.depNum
where d.depName = N'Phòng Nghiên cứu và phát triển'

--ma nv, ten nv, luong cua nv phong ncvpt
select e.empSSN, e.empName, e.empSalary
from tblEmployee e
where e.depNum=(select d.depNum
                from tblDepartment d
				where d.depName = N'Phòng Nghiên cứu và phát triển')

--tim ma nv, ten nv thuoc phong ncvpt hoac phong pmnn
select e.empSSN, e.empName
from tblEmployee e
where e.depNum in
             (select d.depNum
			   from tblDepartment d
			   where d.depName = N'Phòng Nghiên cứu và phát triển'
			   or d.depName = N'Phòng phần mềm nước ngoài')

--tim phong ban co so luong nv it nhat
select d.depNum, d.depName, count(e.empSSN) as NumberOfE
from tblDepartment d join tblEmployee e 
 on d.depNum = e.depNum
group by d.depNum, d.depName
having count(e.empSSN) <=all (select count(e.empSSN) as NumberOfE
                              from tblDepartment d join tblEmployee e 
                              on d.depNum = e.depNum
                              group by d.depNum, d.depName)

--Q1
select d.depNum, d.depName, count(de.depName) as numDependents
from tblDepartment d left join tblEmployee e
on d.depNum = e.depNum left join tblDependent de
on e.empSSN = de.empSSN
group by d.depNum, d.depName
having count(de.depName) <=all(select count(de.depName) as numDependents
                              from tblDepartment d left join tblEmployee e
                               on d.depNum = e.depNum left join tblDependent de
                               on e.empSSN = de.empSSN
                               group by d.depNum, d.depName)

--Q2
select d.depNum, d.depName, count(de.depName) as numDependents
from tblDepartment d left join tblEmployee e
on d.depNum = e.depNum left join tblDependent de
on e.empSSN = de.empSSN
group by d.depNum, d.depName
having count(de.depName) >=all(select count(de.depName) as numDependents
                              from tblDepartment d left join tblEmployee e
                              on d.depNum = e.depNum left join tblDependent de
                              on e.empSSN = de.empSSN
                              group by d.depNum, d.depName)

--Q4
select e.empSSN, empName, sum(w.workHours) as sumWorkHours
from tblEmployee e join tblWorksOn w
on e.empSSN = w.empSSN
group by e.empSSN, empName
having sum(w.workHours) <=all (select sum(w.workHours) as sumWorkHours
                               from tblEmployee e join tblWorksOn w
                               on e.empSSN = w.empSSN
                               group by e.empSSN, empName)

--Q5
select e.empSSN, empName, sum(w.workHours) as sumWorkHours
from tblEmployee e join tblWorksOn w
on e.empSSN = w.empSSN
group by e.empSSN, empName
having sum(w.workHours) >=all (select sum(w.workHours) as sumWorkHours
                              from tblEmployee e join tblWorksOn w
                             on e.empSSN = w.empSSN
                             group by e.empSSN, empName)

--Q6
select p.proNum, p.proName, count(e.empSSN) as numOfEmployee
from tblEmployee e join tblWorksOn w
on e.empSSN = w.empSSN join tblProject p
on p.proNum = w.proNum
group by p.proNum, p.proName
having count(e.empSSN) <= all(select count(e.empSSN) as numOfEmployee
                              from tblEmployee e join tblWorksOn w
                              on e.empSSN = w.empSSN join tblProject p
                              on p.proNum = w.proNum
                              group by p.proNum, p.proName)

--Q7
select p.proNum, p.proName, count(e.empSSN) as numOfEmployee
from tblEmployee e join tblWorksOn w
on e.empSSN = w.empSSN join tblProject p
on p.proNum = w.proNum
group by p.proNum, p.proName
having count(e.empSSN) >= all(select count(e.empSSN) as numOfEmployee
                              from tblEmployee e join tblWorksOn w
                              on e.empSSN = w.empSSN join tblProject p
                              on p.proNum = w.proNum
                              group by p.proNum, p.proName)

--Q8
select p.proNum, p.proName, sum(w.workHours) as sumWorkHours
from tblProject p join tblWorksOn w
on p.proNum = w.proNum
group by p.proNum, p.proName
having sum(w.workHours) <=all(select sum(w.workHours) as sumWorkHours
                              from tblProject p join tblWorksOn w
                              on p.proNum = w.proNum
                              group by p.proNum, p.proName)

--Q9
select p.proNum, p.proName, sum(w.workHours) as sumWorkHours
from tblProject p join tblWorksOn w
on p.proNum = w.proNum
group by p.proNum, p.proName
having sum(w.workHours) >=all(select sum(w.workHours) as sumWorkHours
                              from tblProject p join tblWorksOn w
                              on p.proNum = w.proNum
                              group by p.proNum, p.proName)

--Q10
select d.depNum, d.depName, count(l.locNum) as numOfLocations
from tblDepartment d join tblDepLocation dl
on d.depNum = dl.depNum join tblLocation l
on dl.locNum = l.locNum
group by d.depNum, d.depName
having count(l.locNum) <=all(select count(l.locNum) as numOfLocations
                             from tblDepartment d join tblDepLocation dl
                             on d.depNum = dl.depNum join tblLocation l
                             on dl.locNum = l.locNum
                             group by d.depNum, d.depName)

--Q11
select l.locName, count(d.depNum) as numOfDepertments
from tblDepartment d join tblDepLocation dl
on d.depNum = dl.depNum join tblLocation l
on dl.locNum = l.locNum
group by l.locName
having count(d.depNum) >=all(select count(d.depNum) as numOfDepertments
                             from tblDepartment d join tblDepLocation dl
                             on d.depNum = dl.depNum join tblLocation l
                             on dl.locNum = l.locNum
                             group by l.locName)

--Q12
select l.locName, count(d.depNum) as numOfDepertments
from tblDepartment d join tblDepLocation dl
on d.depNum = dl.depNum join tblLocation l
on dl.locNum = l.locNum
group by l.locName
having count(d.depNum) <=all(select count(d.depNum) as numOfDepertments
                             from tblDepartment d join tblDepLocation dl
                             on d.depNum = dl.depNum join tblLocation l
                             on dl.locNum = l.locNum
                             group by l.locName)

--Q13
select e.empSSN, e.empName, count(d.depName) as numDependents
from tblEmployee e join tblDependent d
on e.empSSN = d.empSSN
group by e.empSSN, e.empName
having count(d.depName) >=all(select count(d.depName) as numDependents
                              from tblEmployee e join tblDependent d
                              on e.empSSN = d.empSSN
                              group by e.empSSN, e.empName)

--Q14
select e.empSSN, e.empName, count(d.depName) as numDependents
from tblEmployee e left join tblDependent d
on e.empSSN = d.empSSN
group by e.empSSN, e.empName
having count(d.depName) <=all(select count(d.depName) as numDependents
                              from tblEmployee e left join tblDependent d
                              on e.empSSN = d.empSSN
                              group by e.empSSN, e.empName)

--Q15 phong ban k co nguoi phu thuoc
--C1
select d.depNum, d.depName
from tblEmployee e join tblDepartment d
on e.depNum = d.depNum left join tblDependent de
on e.empSSN = de.empSSN
group by d.depNum, d.depName
having count(de.empSSN) = 0

--C2
select d.depNum, d.depName
from tblEmployee e join tblDepartment d
on e.depNum = d.depNum left join tblDependent de
on e.empSSN = de.empSSN
group by d.depNum, d.depName
having d.depNum not in(select distinct e.depNum
                       from tblEmployee e, tblDependent de
					   where e.empSSN = de.empSSN)

--Q16 nhan vien chua tham gia du an nao
select e.empSSN, e.empName, d.depName
from tblEmployee e join tblDepartment d
on e.depNum = d.depNum
group by e.empSSN, e.empName, d.depName
having e.empSSN not in(select distinct w.empSSN
                       from tblWorksOn w)









