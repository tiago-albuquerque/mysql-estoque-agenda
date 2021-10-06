create database loja;
use loja;

create table carrinho(
codigo int primary key auto_increment,
produto varchar(250) not null,
quantidade int,
valor decimal(10,2) not null
);

insert into carrinho(produto,quantidade,valor)
values ('Galão tinta 18l',25,165.89);

insert into carrinho(produto,quantidade,valor)
values ('Pincel rolo lã 30cm cx50',20,18.90);

insert into carrinho(produto,quantidade,valor)
values ('Saco cimento 50kg',200,39.90);

insert into carrinho(produto,quantidade,valor)
values ('Argamassa ac3 20kg',150,8.90);

insert into carrinho(produto,quantidade,valor)
values ('Piso cerâmico 50x50 branco cx2.5m',20,24.90);

select * from carrinho;
describe carrinho;

select sum(valor * quantidade) as total from carrinho;

