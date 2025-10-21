-- Script gerado a partir do seu sql_history
 -- Correções de sintaxe
 -- Ordem de criação respeitando dependências
 -- Constraints adicionadas via ALTER TABLE quando necessário

-- Banco: first_example

show databases;
use first_example;
show tables;
CREATE DATABASE IF NOT EXISTS `first_example` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `first_example`;

-- Tabela person
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  person_id SMALLINT UNSIGNED NOT NULL,
  fname VARCHAR(20),
  lname VARCHAR(20),
  gender ENUM('M','F'),
  birth_date DATE,
  street VARCHAR(30),
  city VARCHAR(20),
  state VARCHAR(20),
  country VARCHAR(20),
  postal_code VARCHAR(20),
  CONSTRAINT pk_person PRIMARY KEY (person_id)
);

-- Inserts example (usei os inserts do histórico)
INSERT INTO `person` (person_id, fname, lname, gender, birth_date, street, city, state, country, postal_code) VALUES
  (2, 'Carolina', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'),
  (3, 'Roberta', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'),
  (4, 'Luiz', 'Silva', 'M', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');

-- exemplo de deleção que apareceu no histórico (opcional)
-- DELETE FROM person WHERE person_id IN (2,3,4);

-- Inserções posteriores (IDs 5 e 6)
INSERT INTO `person` (person_id, fname, lname, gender, birth_date, street, city, state, country, postal_code) VALUES
  (5, 'Roberta', 'Silva', 'F', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89'),
  (6, 'Luiz', 'Silva', 'M', '1979-08-21', 'rua tal', 'Cidade J', 'RJ', 'Brasil', '26054-89');

-- Visualizar
-- SELECT * FROM person;


-- Tabela favorite_food
-- DROP TABLE IF EXISTS `favorite_food`;
CREATE TABLE `favorite_food` (
  person_id SMALLINT UNSIGNED NOT NULL,
  food VARCHAR(50) NOT NULL,
  CONSTRAINT pk_favorite_food PRIMARY KEY (person_id, food)
);

-- Inserções de exemplo
INSERT INTO `favorite_food` (person_id, food) VALUES
  (1, 'lasanha'),
  (5, 'carne assada'),
  (6, 'fetuccine');

select * from person;

