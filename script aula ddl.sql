create database	vendas;
use vendas;

/* CRIAR TABELA */
create table cliente(
cli_cod int primary key,
cli_nome varchar(30),
cli_ativo int default 1,
cli_data_nasc date,
cli_cpf varchar(11) unique);

/*DESCREVER TABELA*/
desc cliente;

/*EXIBIR INFORMAÇÕES NA TABELA*/
select * from cliente;

/*INSERIR VALORES NA TABELA*/
insert into cliente values (1,'João',0,'1979-10-30','12345678190');
insert into cliente values (2, 'Maria',0,'2014-2-1');
insert into cliente(cli_cod, cli_nome, cli_data_nasc) values (3,'José','2012-05-03');

/*DELETAR DADOS DA LINHA*/
delete from cliente where cli_cod = 1;

/*EXCLUIR TABELA*/
drop table cliente;

/*EXIBE AS INFORMAÇÕES DAS RESTRIÇÕES*/
select * from information_schema.table_constraints
where constraint_schema ='vendas';

create table produto(
	pro_id int primary key,
	pro_descricao varchar(50) not null,
    pro_preco decimal(7,2) not null,
    pro_quantidade int not null
);

create table pedido(
	ped_cod int primary key,
    ped_data date not null,
    ped_valor decimal(7,2) not null);

create table itempedido (
	ped_cod int,
    pro_id int,
    ite_quantidade int,
    ite_valor decimal(7,2),
    foreign key(ped_cod) references pedido(ped_cod),
    foreign key(pro_id) references produto(pro_id),
    primary key(ped_cod, pro_id));
