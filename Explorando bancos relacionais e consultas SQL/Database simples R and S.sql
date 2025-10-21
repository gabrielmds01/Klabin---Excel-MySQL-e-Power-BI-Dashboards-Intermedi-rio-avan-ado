-- Criação de banco e schema
create database teste;
use teste;

create table R(
    A char(2)
);

create table S(
    A char(2)
);

-- Criação de schema adicional
create schema if not exists;

create table person(
    person_id smallint unsigned,
    fname varchar(20),
    lname varchar(20),
    gender enum('M', 'F'),
    birth_date DATE,
    street varchar(30),
    city varchar(20),
    state varchar(20),
    country varchar(20),
    postal_code varchar(20),
    constraint pk_person primary key (person_id)
);

create table company.employee(
    Fname varchar(15) NOT NULL,
    Minit char,
    Lname varchar(15) NOT NULL,
    Ssn char(9) NOT NULL,
    Bdate DATE,
    Address varchar(30),
    sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int NOT NULL,
    primary key (Ssn)
);

insert into R(A) values ('a1'), ('a2'), ('a2'), ('a3');
insert into S(A) values ('a1'), ('a1'), ('a2'), ('a3'), ('a4'), ('a5');

-- Seleções iniciais
select concat(Fname, ' ', Lname) Complete_Name, Dname as Department_name 
from employee, departament
where (Ssn = Essn and Dno = Dnumber and Address like '%Houston%');

select Fname, Lname, Salary from employee where (Salary between 20000 and 40000);

select * from R;
select * from S;
select * from S where A not in (select A from R);

-- Operações com conjuntos
(select distinct R.A from R) UNION (select distinct S.A from S);
select distinct R.A from R where R.A in (select S.A from S);

-- Consultas com filtros incorretos (mantidos como estavam)
select * from R where A = 2;
select * from R where A = ('2');
select * from R where A = ('1') and ('2');
select * from R where A = 2;
select * from R where A = 1 and 2;
select * from R where A = 'a1' and 'a2';
select * from R where A = 'a1' or 'a2';

-- Consultas com joins
select distinct Pno
from works_on, employee
where (Essn = Ssn and Lname = 'Smith')
or (
    select Pnumber
    from project, department, employee
    where (Mgr_ssn = Ssn and Lname = 'Smith' and Dnum = Dnumber)
);

-- Consultas com EXISTS
select e.Fname, e.Lname 
from employee as e
where exists (
    select * from dependent as d
    where e.Ssn = d.Essn
);

select e.Fname, e.Lname 
from employee as e
where exists (
    select * from department
    where Ssn = Mgr_ssn
);

-- Seleções com GROUP BY
select Dno, count(*) as Number_of_employees, round(avg(Salary), 2) as Valores
from employee
group by Dno;

-- Agregações
select Pnumber, Pname, count(*)
from project, works_on
where Pnumber = Pno
group by Pnumber, Pname;

select count(distinct Salary) from employee;

select sum(Salary) as total_sal, max(Salary) as total_sal, min(Salary), avg(Salary) from employee;

select sum(Salary) as total_sal, max(Salary) as max_sal, min(Salary) as min_sal, avg(Salary) as avg_sal from employee;

-- Consultas com múltiplas tabelas
select d.Dname, concat(e.Fname, ' ', e.Lname) as Manager, Address 
from departament as d, employee as e, works_on as w, project as p
where (d.Dnumber = e.Dno and e.Ssn = d.Mgr_ssn and w.Pno = p.Pnumber)
order by d.Dname, e.Fname, e.Lname;

select distinct d.Dname, concat(e.Fname, ' ', e.Lname) as Employee, p.Pname as Project_name, Address
from departament as d, employee e, works_on w, project p
where (d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber)
order by d.Dname desc, e.Fname asc, e.Lname asc;

-- Consulta com subselect e filtro de local
SELECT 
    Dname AS Departament_Name, 
    CONCAT(Fname, ' ', Lname) AS Manager
FROM 
    departament d,
    dept_locations l,
    employee e
WHERE 
    d.Dnumber = l.Dnumber 
    AND Dlocation = 'Stafford' 
    AND Mgr_ssn = e.Ssn;


