-- Banco: company (esquema de exemplo)

CREATE SCHEMA IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `company`;

-- Criar tabela employee primeiro, sem FK que referencie departament (para evitar ciclo)
-- DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  Fname VARCHAR(15) NOT NULL,
  minit CHAR(1),
  Lname VARCHAR(15) NOT NULL,
  Ssn CHAR(9) NOT NULL,
  Bdate DATE,
  Address VARCHAR(100),
  Sex CHAR(1),
  Salary DECIMAL(10,2),
  Super_ssn CHAR(9),
  Dno INT NOT NULL DEFAULT 1,
  CONSTRAINT pk_employee PRIMARY KEY (Ssn),
  CONSTRAINT chk_salary_employee CHECK (Salary > 2000.0)
);

-- Criar departament (note: Mgr_ssn será FK para employee; deixamos nullable até criar FK)
-- DROP TABLE IF EXISTS `departament`;
CREATE TABLE `departament` (
  Dname VARCHAR(15) NOT NULL,
  Dnumber INT NOT NULL,
  Mgr_ssn CHAR(9),
  Mgr_start_date DATE,
  Dept_crate_date DATE,
  PRIMARY KEY (Dnumber),
  UNIQUE (Dname)
);

-- Criar project (referencia departament)
-- DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  Pname VARCHAR(15) NOT NULL,
  Pnumber INT NOT NULL,
  Plcation VARCHAR(15),
  Dnum INT NOT NULL,
  PRIMARY KEY (Pnumber),
  CONSTRAINT unique_project UNIQUE (Pname)
);

-- Criar dept_locations (referencia departament)
-- DROP TABLE IF EXISTS `dept_locations`;
CREATE TABLE `dept_locations` (
  Dnumber INT NOT NULL,
  Dlocation VARCHAR(15) NOT NULL,
  CONSTRAINT pk_dept_locations PRIMARY KEY (Dnumber, Dlocation)
);

-- Criar works_on (referencia employee e project) - colunas Pno / Pnumber nomenclatura mantida
-- DROP TABLE IF EXISTS `works_on`;
CREATE TABLE `works_on` (
  Essn CHAR(9) NOT NULL,
  Pno INT NOT NULL,
  Hours DECIMAL(3,1) NOT NULL,
  PRIMARY KEY (Essn, Pno)
);

-- Criar dependent (referencia employee)
-- DROP TABLE IF EXISTS `dependent`;
CREATE TABLE `dependent` (
  Essn CHAR(9) NOT NULL,
  Dependent_name VARCHAR(15) NOT NULL,
  Sex CHAR(1),
  Bdate DATE,
  Relationship VARCHAR(15),
  Age INT,
  PRIMARY KEY (Essn, Dependent_name)
);