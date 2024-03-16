CREATE DATABASE dbpratica01;
USE dbpratica01;

CREATE table FUNCIONARIO(
	COD_FUNC int (4) primary key,
    NOME varchar(100),
    CPF varchar(15),
    SALARIO decimal(4,2),
    ENDERECO varchar(252),
    SEXO varchar(1));

CREATE table DEPARTAMENTO(
	COD_DEPART int(4) primary key,
    NOME varchar(30),
    DATA_INICIAL date);
    


    