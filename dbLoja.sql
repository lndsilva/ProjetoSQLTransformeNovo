-- apagar o banco de dados
drop database dbLoja;

-- criar o banco de dados
create database dbLoja;

-- acessar o banco de dados
use dbLoja;

-- criando as tabelas do banco de dados
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
cpf char(14) not null unique,
telCel char(10),
dataNasc date,
sexo char(1),
salario decimal(9,2),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado varchar(100),
siglaEst char(2),
complemento varchar(100),
primary key(codFunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(50) not null,
email varchar(100),
cnpj char(18) not null unique,
primary key(codForn)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
email varchar(100),
telCel char(9),
cpf char(14) not null unique,
primary key(codCli)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(30) not null unique,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc)references tbFuncionarios(codFunc)
);

create table tbProdutos(
codProd int not null auto_increment,
nome varchar(100),
valor decimal(9,2),
quantidade int,
dataEnt date,
validade date,
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn)
);

create table tbVendas(
codVenda int not null auto_increment,
dataVenda date,
horaVenda time,
quantidade int,
valorTotal decimal(9,2),
codProd int not null,
codUsu int not null,
codCli int not null,
primary key(codVenda),
foreign key(codProd)references tbProdutos(codProd),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codCli)references tbClientes(codCli)
);

-- visualizando a estrutura da tabela
desc tbFuncionarios;
desc tbFornecedores;
desc tbClientes;
desc tbUsuarios;
desc tbProdutos;
desc tbClientes;

-- inserindo registro nas tabelas

insert into tbFuncionarios
	(nome,email,cpf,telCel,dataNasc,sexo,salario,logradouro,
		numero,cep,bairro,cidade,estado,siglaEst,
		complemento)
	values('Amarildo Fernadez','amarildo.fernadez@gmail.com',
		'125.254.758-99','97528-8548','1996/06/05',
		'M',4500.55,'Rua das Miragens','55A','04750-000',
		'Santo Amaro','Sao Paulo','Sao Paulo','SP',
		'Casa dos fundos');

-- visualizando os registros das tabelas

select * from tbFuncionarios;
