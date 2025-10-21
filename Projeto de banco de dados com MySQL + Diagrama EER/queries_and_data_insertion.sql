-- inserção de dados e queries
use ecommerce;
show tables;

-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF, Address) 
values('Maria','M','Silva',12346789,'rua silva 29, Carangola - Cidade das flores'),
	('Matheus','O','Pimentel',987654321,'rua alameda 289, Centro - Cidade das flores'),
	('Ricardo','F','Silva',45678913,'avenida vinha 1009, Centro - Cidade das flores'),
	('Julia','S','França',789123456,'rua lareijas 861, Centro - Cidade das flores'),
	('Roberta','G','Assis',98745631,'avenida koller 19, Centro - Cidade das flores'),
	('Isabela','M','Cruz',654789123,'rua alameda 28, Centro - Cidade das flores');

select * from clients;
    
-- idProduct, Pname, classification_kids boolean, category('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size)
values	('Headset', false, 'Eletrônico', '4', null),
		('Barbie', true, 'Brinquedos', '3', null),
		('Tshirt', true, 'Vestuário', '5', null),
		('Microfone', false, 'Eletrônico', '4', null),
		('Sofá', false, 'Móveis', '3', '3x57x80'),
		('Arroz', false, 'Alimentos', '2', null),
		('FireStick', false, 'Eletrônico', '3', null);

select * from clients;
-- tem que deixar default para pegar o default setado na criação do database
insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) 
values	(1, default, 'compra via aplicativo', null, 1),
		(2, default, 'compra via aplicativo', 50, 0),
		(3, default, 'Confirmado', null, 1),
		(4, default, 'compra via web site', 150, 0);
        
	select * from orders;

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
(1, 1, 1, null),
(2, 1, 1, null),
(3, 2, 1, null);

-- storageLocation, quantity OK
insert into productStorage (storageLocation, quantity) values
('Rio de Janeiro', 1000),
('Rio de Janeiro', 500),
('São Paulo', 10),
('São Paulo', 100),
('São Paulo', 10),
('Brasília', 60);

insert into storageLocation (idLproduct, idLstorage, location) values
(1, 2, 'RJ'),
(2, 6, 'GO');
-- OK
insert into supplier (SocialName, CNPJ, contact) values
('Almeida e filhos', 123456789123456, '21985474'),
('Eletrônicos Silva', 854519649143457, '21985484'),
('Eletrônicos Valma', 934567893934695, '21975474');

insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
(1,1,500),
(1,2,400);

-- OK
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);

select * from seller;

insert into productSeller (idPseller, idPproduct, prodQuantity) values
(1,6,80),
(2,7,10);

select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient; -- quero ver os pedidos feitos pelos clientes, vendo cliente e pedido

select concat(Fname,' ',Lname)Client, idOrder Request, orderStatus Status -- posso concatenar para deixar visualmente melhor e definir um alias, podendo ser usado o AS ou não.
from clients c 
join orders o on c.idClient = o.idOrderClient; 

select count(*) 
from clients c, orders o 
where c.idClient = idOrderClient;

/*Explicação:
Faz uma implícita implícita entre as tabelas clientse orders.
Usa a condição c.idClient = idOrderClientpara ligar cada cliente aos pedidos.
O count(*)retorna o número total de cópias cliente-pedido (ou seja, quantos pedidos existem no total).*/

select count(*) 
from clients c 
join orders o on c.idClient = o.idOrderClient;

/* 1. clients é a tabela principal.
2. Faz INNER JOINcom orders, associando cada pedido ao cliente.
3. Junta com productOrder, associando cada pedido aos produtos contidos.
4. Agrupa poridClient , ou seja, organiza o resultado por cliente (mas sem funções de agregação explícita)
o GROUP BYaqui não é muito útil sem funções como COUNT, SUMetc.
Provavelmente é apenas para remover duplicatas visuais de clientes.*/
-- recuperação de pedido com produto associado
select * 
from clients c
    inner join orders o on c.idClient = o.idOrderClient
    inner join productOrder p on p.idPOorder = o.idOrder
group by idClient;

-- Recuperar quantos pedidos foram realizados pelos clientes?
select c.idClient, Fname, count(*) as Number_of_orders
from clients c
    inner join orders o on c.idClient = o.idOrderClient
group by idClient;

/*
Assim como demonstrado durante o desafio, realize a criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realize a persistência de dados para realização de testes. Especifique ainda queries mais complexas do que as apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:
Recuperações simples com SELECT Statement
Filtros com WHERE Statement
Crie expressões para gerar atributos derivados
Defina ordenações dos dados com ORDER BY
Condições de filtros aos grupos – HAVING Statement
Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

Algumas das perguntas que podes fazer para embasar as queries SQL:
Quantos pedidos foram feitos por cada cliente?
Algum vendedor também é fornecedor?
Relação de produtos fornecedores e estoques;
Relação de nomes dos fornecedores e nomes dos produtos;
*/

-- Recuperações simples
select * from clients;
select * from orders where orderStatus = 'Confirmado';

-- Filtros com ONDE
select * from product;
select Pname, category, avaliação
from product
where category = 'Eletrônico' and avaliação >= 4;

-- Expressão derivada (atributo calculado)
select idOrder, sendValue, 
       sendValue * 0.1 as shipping_tax,
       sendValue + (sendValue * 0.1) as total_value
from orders
where sendValue is not null;

-- Ordenação
select Pname, category, avaliação
from product
order by avaliação desc, Pname asc;

-- Agrupamento com HAVING
select category, avg(avaliação) as avg_rating
from product
group by category
having avg_rating >= 3;

-- Junção entre tabelas
select c.Fname, o.idOrder, p.Pname, po.poQuantity
from clients c
inner join orders o on c.idClient = o.idOrderClient
inner join productOrder po on o.idOrder = po.idPOorder
inner join product p on po.idPOproduct = p.idProduct
order by c.Fname;

-- Quantos pedidos foram feitos por cada cliente
select c.idClient, concat(c.Fname, ' ', c.Lname) as ClientName, count(o.idOrder) as Number_of_orders
from clients c
left join orders o on c.idClient = o.idOrderClient
group by c.idClient
order by Number_of_orders desc;

-- Algum vendedor também é fornecedor?
select s.SocialName
from seller s
inner join supplier f on s.CNPJ = f.CNPJ;

-- Relação de produtos, fornecedores e estoques
select p.Pname, s.SocialName as Supplier, ps.quantity as Supplied_Quantity, st.storageLocation, st.quantity as InStock
from product p
inner join productSupplier ps on p.idProduct = ps.idPsProduct
inner join supplier s on s.idSupplier = ps.idPsSupplier
left join storageLocation sl on sl.idProduct = p.idProduct
left join productStorage st on st.idStorage = sl.idLstorage;

-- Relação de nomes de fornecedores e produtos
select s.SocialName as Supplier, p.Pname as Product
from supplier s
inner join productSupplier ps on s.idSupplier = ps.idPsSupplier
inner join product p on ps.idPsProduct = p.idProduct
order by s.SocialName;











