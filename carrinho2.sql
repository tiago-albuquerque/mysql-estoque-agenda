/**
carrinho de compras
@author Tiago S. A. Paz
*/

create database carrinhotiago;

use carrinhotiago;
-- decimal -> tipo de dado numerico não inteiro 10,2 dez digitos com 2 casas decimais de precisão
create table carrinho(
codigo int primary key auto_increment,
    produto varchar(250) not null,
    quantidade int,
    valor decimal(10,2) not null
);

describe carrinho;

-- cruid create
insert into carrinho(produto,quantidade,valor)
values ('Caneta Bic cx30',10,17.50);

insert into carrinho(produto,quantidade,valor)
values ('Papel A4 cx10',20,25.90);

insert into carrinho(produto,quantidade,valor)
values ('Lapis grafite cx20',40,18.95);

insert into carrinho(produto,quantidade,valor)
values ('Grampeador cx40',25,28.35);

insert into carrinho(produto,quantidade,valor)
values ('Borracha branca cx50',12,22.48);

-- cruid read
select * from carrinho;

-- operações matemáticas no banco de dados

select sum(valor * quantidade) as total from carrinho;

-- timestamp default current_timestamp -> data e hora automatico.
-- Date -> tipo de dados relacionado a data - ano/mês/dia.
create table estoque (
codigo int primary key auto_increment,
barcode varchar(50) unique,
produto varchar(100) not null,
fabricante varchar(100) not null,
datacad timestamp default current_timestamp,
dataval date not null,
quantidade int not null,
estoquemin int not null,
medida varchar(50) not null,
valor decimal(10,2),
loc varchar(100)
);


describe estoque;

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('Caneta Bic azul','BIC',20221005,100,10,'cx',28.75,'setor A p2');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('Caderno 500 folhas','Faber castel',18991201,120,20,'CX',29.90,'setor B p5');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('Lapis Madeira Grafite','Faber Castel',20210920,50,10,'CX',18.50,'setor C p8');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('Cola Papel','Latex',20210805,30,5,'CX',12.90,'setor D p3');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('Tinta Tecido','Acrilex',20220510,5,10,'CX',22.35,'setor E p2');

insert into estoque(produto,fabricante,dataval,quantidade,estoquemin,medida,valor,loc)
values ('Borracha Branca','Latex',20220618,7,10,'CX',12.25,'setor F p3');

select * from estoque;

select * from estoque where codigo = 1;
update estoque set produto = 'Caneta Bic vermelha' where codigo = 1;
update estoque set produto = 'Lápis Gragite',fabricante = 'Bic',estoquemin = '15',medida = 'Pacote',valor = 17.85,loc = 'setor M p6' where codigo = 4;
delete from estoque where codigo = 3;


select sum(valor * quantidade) as total from estoque;

-- Relatório de reposição do estoque 1
select * from estoque where quantidade < estoquemin;

-- Relatório de reposição do estoque 2
-- date_format() -> formatar a exibição da data
-- %d (dia) %m (mês) %y (ano 2 digitos) %Y (ano 4 digitos)
select codigo as código,produto,
date_format(dataval,'%d/%m%/%Y') as data_validade,
quantidade, estoquemin as estoque_mínimo
from estoque where quantidade < estoquemin;

-- Relatório de produtos vencidos 1
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y') as data_validade
from estoque;

-- Relatório de validade dos produtos 2
-- datediff() -> retorna a diferença em dias de duas datas
-- curdate -> data atual
select codigo as código,produto,
date_format(dataval,'%d/%m/%Y') as data_validade,
datediff(dataval,curdate()) as dias_restantes
from estoque;











