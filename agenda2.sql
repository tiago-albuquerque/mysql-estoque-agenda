create database dbagendatiago;
use dbagendatiago;

-- verificar tabelas existentes
show tables;

-- criando uma tabela
-- toda tabela precisa ter uma chave primaria (PK)
-- int (tipo de dados -> números inteiros)
-- primary key -> (transforma este campo em chave primaria)
-- auto_increment -> (numeração automatica)
-- varchar -> (tipo de dados equivalente a string)
-- (50) (numero máximo de caracteres)
-- not null -> (preenchimento obrigatorio)
-- unique -> (não permite valores duplicados na tabela)

create table contatos(
	id int primary key auto_increment,
    nome varchar(50) not null,
    fone varchar(15) not null,
    email varchar(50) unique
);

-- descrição da tabela

describe contatos;

-- alterar o nome do campo da tabela
alter table contatos change nome contato varchar(50) not null;

-- adcionar um novo campo(coluna) a tabela
alter table contatos add column obs varchar(250);

-- adcionar um novo campo(coluna) a um local especifico na tabela
alter table contatos add column fone2  varchar(15) after fone;

-- modificar o tipo de dados e/ou validação na coluna
alter table contatos modify column fone2 int;
alter table contatos modify column email varchar(100) not null;

-- excluir uma coluna da tabela
alter table contatos drop column obs; 

-- excluir a tabela
-- drop table contatos;

-- cruid (create read update delete)
-- operação básicas do banco de dados

-- cruid create
insert into contatos(nome,fone,email)
values ('Tiago S. A. Paz','99999-9999','tiago@email.com');
insert into contatos(nome,fone,email)
values ('Ana Patrícia','988888-5552','ana@email.com');
insert into contatos(nome,fone,email)
values ('joão Silva','97755-4499','joao@email.com');
insert into contatos(nome,fone,email)
values ('Maria Silva','96688-7788','maria@email.com');
insert into contatos(nome,fone)
values ('Pedro Silva','95577-8899');




-- cruid read
-- selecionar todos os registros(dados) da tabela
select * from contatos;

-- selecionar colunas da tabela
select nome, fone from contatos;

-- selecionar colunas em ordem crescente e decrescente(asc desc)
select * from contatos order by nome;
select id, nome from contatos order by id desc;

-- uso de filtros
select * from contatos where id = 1;
select * from contatos where nome = 'Maria Silva';
select * from contatos where nome like 'A%';

-- cruid update
-- ATENÇÃO! não esqueça do where e usar sempre o ID para evitar problemas
update contatos set email = 'pedro@email.com' where id = 7;
update contatos set fone = '95566-7788' where id = 3;
update contatos set nome='Ana Silva',fone='97589-4545',email='ana@email.com' where id = 3;

-- cruid delete
-- ATENÇÃO! não esqueça do where e usar sempre o ID para evitar problemas
delete from contatos where id = 7;





