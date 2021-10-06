create database agenda;
use agenda;

create table contatos(
id int primary key auto_increment,
    nome varchar(60) not null,
    fone varchar(20) not null,
    email varchar(60) unique
);

describe contatos;

insert into contatos(nome,fone,email)
values ('João silva','11-95588-8699','joao@email.com');

insert into contatos(nome,fone,email)
values ('Maria José','11-97788-6464','mariajose@email.com');

insert into contatos(nome,fone,email)
values ('Pedro Almeida','11-3535-6565','pedro@email.com');

insert into contatos(nome,fone,email)
values ('Paulo Viera','11-98877-5588','paulo@email.com');

select * from contatos;

update contatos set nome='Maria Silva',fone='97589-4545',email='Mariasilva@email.com' where id = 8;


