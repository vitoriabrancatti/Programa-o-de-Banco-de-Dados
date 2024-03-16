CREATE DATABASE vendas;
USE vendas;
CREATE TABLE cliente(
	cli_cod INT primary KEY,
    cli_nome VARCHAR(30),
    cli_ativo INT DEFAULT 1,
    cli_data_nasc DATE,
    cli_cpf VARCHAR(11) unique
);
INSERT INTO cliente VALUES(1, 'João', 0, '1979-10-30', 431988802);
INSERT INTO cliente VALUES(2, 'Maria', 0, '2014-2-2',4215998801);

CREATE TABLE produto (
	pro_id int primary key auto_increment,
    pro_descricao varchar(50) not null,
    pro_quant int not null,
    pro_preco decimal(7,2)
);

CREATE TABLE pedido (
	ped_id int auto_increment primary key,
    ped_data date not null, 
    ped_valor decimal(7,2) not null
);

CREATE TABLE itempedido(
	ped_cod int, 
    pro_cod int, 
    ite_quantidade int, 
    ite_valor decimal(7,2),
    constraint fk_ped_cod foreign key(ped_cod) references pedido(ped_id),
    constraint fk_pro_cod foreign key(pro_cod) references produto(pro_id),
    primary key(pro_cod, ped_cod)
);
INSERT INTO pedido(ped_id, ped_valor, ped_data) values 
(1, 14.0, '2024-02-12');
INSERT INTO pedido(ped_id, ped_valor, ped_data) values
(2, 30.5, '2024-03-15');

INSERT INTO produto values
(1, 'caneta', 100, 1.0),
(2, 'caderno', 200, 2.0);

INSERT INTO itempedido values(1,1,1,2.5),(1,2,1,5.00);

select *from cliente;
select *from produto;
select *from pedido;
select *from itempedido;

alter table pedido
add cli_cod int;

alter table pedido
add constraint fk_cli_cod
foreign key(cli_cod)
references cliente(cli_cod);

update pedido set cli_cod = 2 where ped_id = 2;
update pedido set cli_cod = 1 where ped_id = 1;

select p.ped_id, p.ped_data, c.cli_nome from cliente c, pedido p where p.cli_cod = c.cli_cod;

