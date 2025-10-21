use company_constraints;
select * from employee order by Fname, Lname;

-- nome do departamento, nome do gerente
select d.Dname, concat(e.Fname,' ',e.Lname) as Manager, Address 
from departament as d, employee as e, works_on as w, project as p
	where (d.Dnumber = e.Dno and e.Ssn = d.Mgr_ssn and w.Pno = p.Pnumber)
    order by d.Dname, e.Fname, e.Lname;

-- recupero todos os empregados e seus projetos em andamento
select distinct d.Dname as Departament, concat(e.Fname,' ',e.Lname) as Employee, p.Pname as Project_name, Address
	from departament as d, employee e, works_on w, project p
    where (d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber)
    order by d.Dname desc, e.Fname asc, e.Lname asc;
    
-- funções e cláusulas de agrupamento

select * from employee;
select count(*) from employee;
	where Dno = Dnumber and Dname = 'Reserach';
    
select Dno, count(*), avg(Salary) 
from employee
group by Dno;

select Dno, count(*) as  Number_of_employees, round(avg(Salary),2) as Valores
from employee
group by Dno;

select Pnumber, Pname, count(*)
from project, works_on
where Pnumber = Pno
group by Pnumber, Pname;

select count(distinct Salary)
from employee;

select sum(Salary) as total_sal, max(Salary) as max_sal, min(Salary) as min_sal, avg(Salary) as avg_sal from employee;

-- group by

select Pnumber, Pname, count(*), avg(Salary)
	from project, works_on, employee
    where Pnumber = Pno and Ssn = Essn
    group by Pnumber, Pname;
    
select Pnumber, Pname, count(*) as Number_of_register, round(avg(Salary),2) as AVG_Salary
from project, works_on, employee
where Pnumber = Pno and Ssn = Essn
group by Pnumber
order by avg(Salary) desc;

-- group by e having

select Pnumber, Pname, count(*)
from project, works_on
where Pnumber = Pno
group by Pnumber, Pname
having count(*) > 2;

select Dno, count(*)
	from employee
    where Salary > 30000
    group by Dno
    having count(*)>=2;
    
select Dno, count(*)
from employee
	where Salary>20000
		and Dno in (select Dno from employee
					group by Dno
                    having count(*)>5)
	group by Dno;





	
