CREATE DATABASE concessionaria_ac4;
USE concessionaria_ac4;
CREATE TABLE Ano (
	idAno INT NOT NULL AUTO_INCREMENT,
	ano INT(4) NOT NULL,
	PRIMARY KEY (idAno)
);

CREATE TABLE Mes (
	idMes INT NOT NULL AUTO_INCREMENT,
	mes INT(2) NOT NULL,
	PRIMARY KEY (idMes)
);

CREATE TABLE Veiculo (
	idVeiculo INT NOT NULL AUTO_INCREMENT,
	descricao TEXT(500),
	valor FLOAT(15) NOT NULL,
	idModelo INT NOT NULL,
	idFabricante INT NOT NULL,
	idAnoFabricacao INT NOT NULL,
	dataCompra DATETIME NOT NULL,
	PRIMARY KEY (idVeiculo)
);

CREATE TABLE VendasAnuais (
	idVendas INT NOT NULL AUTO_INCREMENT,
	qtd INT(80) NOT NULL,
	idVeiculo INT NOT NULL,
	idAnodaVenda INT NOT NULL,
	idMesdaVenda INT NOT NULL,
	PRIMARY KEY (idVendas)
);

CREATE TABLE Modelo (
	idModelo INT NOT NULL AUTO_INCREMENT,
	Descricao TEXT(500),
	PRIMARY KEY (idModelo)
);

CREATE TABLE Fabricante (
	idFabricante INT NOT NULL AUTO_INCREMENT,
	nome varchar(25) NOT NULL,
	cidade varchar(50) NOT NULL,
	endereco varchar(150) NOT NULL,
	UF varchar(2) NOT NULL,
	telefone varchar(20) NOT NULL,
	contato varchar(40) NOT NULL,
	PRIMARY KEY (idFabricante)
);

ALTER TABLE Veiculo ADD CONSTRAINT Veiculo_fk0 FOREIGN KEY (idModelo) REFERENCES Modelo(idModelo);

ALTER TABLE Veiculo ADD CONSTRAINT Veiculo_fk1 FOREIGN KEY (idFabricante) REFERENCES Fabricante(idFabricante);

ALTER TABLE Veiculo ADD CONSTRAINT Veiculo_fk2 FOREIGN KEY (idAnoFabricacao) REFERENCES Ano(idAno);

ALTER TABLE VendasAnuais ADD CONSTRAINT VendasAnuais_fk0 FOREIGN KEY (idVeiculo) REFERENCES Veiculo(idVeiculo);

ALTER TABLE VendasAnuais ADD CONSTRAINT VendasAnuais_fk1 FOREIGN KEY (idAnodaVenda) REFERENCES Ano(idAno);

ALTER TABLE VendasAnuais ADD CONSTRAINT VendasAnuais_fk2 FOREIGN KEY (idMesdaVenda) REFERENCES Mes(idMes);
