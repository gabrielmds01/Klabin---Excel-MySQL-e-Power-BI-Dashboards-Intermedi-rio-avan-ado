-- case statement

use company;

show tables;

select Fname, Salary, Dno from employee;
-- desabilitar o safe mode
update employee set Salary =
		case
			when Dno=5 then Salary+ 2000
            when Dno=4 then Salary+ 1500
            when Dno=1 then Salary+ 3000
            else Salary + 0
		end;

use company;        
-- JOIN Statement
desc employee;
desc works_on;
-- Join ON -> INNER JOIN ON
show tables;
desc departament;
select * from employee JOIN works_on on Ssn = Essn;
select * from employee, works_on where Ssn = Essn;
select * from employee JOIN departament on Ssn = Mgr_ssn;

select Fname, Lname, Address
	from (employee join departament on Dno=Dnumber)
    where Dname = 'Research';


select * from dept_locations; -- address e Dnumber
select * from departament; -- Dname, Dept_create_date

select Dname as Departament, Dept_crate_date as StartDate, Dlocation as Location
	from departament JOIN dept_locations using(Dnumber)
    order by Dept_create_date; -- posso usar o alias para referencias também, um ou outro

ALTER TABLE nome_da_tabela RENAME COLUMN nome_antigo_coluna TO novo_nome_coluna; -- alterar o nome da coluna na tabela departament
ALTER TABLE departament RENAME COLUMN Dept_crate_date TO Dept_create_date;

select * from departament;

-- CROSS JOIN - Produto Cartesiano

select * from employee cross join dependent;

-- JOIN com mais de 3 tabelas

-- project, works_on e employee
select concat(Fname,' ', Lname) as Complete_name, Dno as DeptNumber, Pname as ProjectName,Pno as ProjectNumber, Plocation as Location
	from employee
	inner join works_on on Ssn = Essn
    inner join project on Pno = Pnumber
    where Pname like 'Product%'
    order by Pnumber;
    
-- departament, dept_location, employee
select Dnumber, Dname, concat(Fname,' ', Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus
	from departament
	inner join dept_locations using(Dnumber)
    inner join employee on Ssn = Mgr_ssn
    group by Dnumber
    having count(*)>1;
    
select Dnumber, Dname, concat(Fname,' ', Lname) as Manager, Salary, round(Salary*0.05,2) as Bonus
	from departament
	inner join dept_locations using(Dnumber)
    inner join (dependent inner  join employee on Ssn = Essn) on Ssn = Mgr_ssn
    group by Dnumber;
    
-- departament, project e employee
show tables;
select * from departament;
select * from employee;
select * from project;

select Dnumber, Dname, concat(Fname,' ', Lname) as Manager, Salary
	from project
    inner join departament on Dnumber = Mgr_ssn
    inner join employee on Salary = Sex
    
    


    


    





