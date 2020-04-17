CREATE DATABASE concessionaria;
USE concessionaria;

CREATE TABLE Ano(
idAno int AUTO_INCREMENT,
ano int(4) NOT NULL,
PRIMARY KEY (idAno)
);

CREATE TABLE Mes(
idMes int AUTO_INCREMENT,
mes int(2) NOT NULL,
PRIMARY KEY (idMes)
);

CREATE TABLE VendasAnuais(
idVendas int AUTO_INCREMENT,
qtd int(4) NOT NULL,
idVeiculo int NOT NULL,
idAnodaVenda int NOT NULL,
idMesdaVenda int NOT NULL,
PRIMARY KEY (idVendas)
);

CREATE TABLE Modelo(
idModelo int AUTO_INCREMENT,
Descricao varchar(500) NOT NULL,
PRIMARY KEY (idModelo)
);

CREATE TABLE Fabricante(
idFabricante int AUTO_INCREMENT,
Nome varchar(30) NOT NULL,
cidade varchar (50) NOT NULL,
endereco varchar (150),
UF varchar (2) NOT NULL,
telefone int (14),
contato varchar (30),
PRIMARY KEY (idFabricante)
);

CREATE TABLE Veiculo(
idVeiculo int auto_increment,
Descricao text,
valor int (10) NOT NULL,
idModelo int NOT NULL,
idFabricante int NOT NULL,
idAnoFabricacao int,
dataCompra date NOT NULL,
PRIMARY KEY (idVeiculo)
);

ALTER TABLE Veiculo 
add constraint fk_veiculo_modelo 
foreign key (idModelo) 
references Modelo (idModelo);

ALTER TABLE Veiculo 
add constraint fk_veiculo_fabricante 
foreign key (idFabricante) 
references Fabricante (idFabricante);

ALTER TABLE Veiculo 
add constraint fk_veiculo_ano 
foreign key (idAnoFabricacao) 
references Ano (idAno);

ALTER TABLE VendasAnuais
add constraint fk_vendas_veiculo
foreign key (idVeiculo)
references Veiculo (idVeiculo);

ALTER TABLE VendasAnuais
add constraint fk_vendas_Ano
foreign key (idAnodaVenda)
references Ano (idAno);

ALTER TABLE VendasAnuais
add constraint fk_vendas_Mes
foreign key (idMesdaVenda)
references Mes (idMes);