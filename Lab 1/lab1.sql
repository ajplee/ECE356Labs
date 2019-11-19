---- 1b

select job, count(*) as count from Employee group by job order by count asc;

---- 1e

select deptID from Employee where job = "engineer" group by deptID having count(job) = (select max(c) from (select deptID, count(job) as c from Employee where job = "engineer" group by deptID) as max);

---- 2a

select empName, empID from Employee where empID not in (select empID from Assigned);

---- 2e

select projID, sum(salary) from Employee left outer join Assigned on Employee.empID = Assigned.empID group by projID;

---- 3a

update Employee set salary = salary * 1.1 where empID in (select * from(select e.empId from Employee as e INNER JOIN Assigned as a ON e.empID = a.empID INNER JOIN Project as p ON a.projID = p.projID where title = 'compiler') as x);

---- 3b

update Employee set salary = salary *  (case when (job = "janitor" and deptID in (select deptID from Department where location = "Waterloo")) then 1.08 when job = "janitor" then 1.05 when deptID in (select deptID from Department where location = "Waterloo") then 1.08 else 1.00 end);

