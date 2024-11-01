CREATE DATABASE bd_exporta;
USE bd_exporta;

CREATE TABLE departamento (
	id INT PRIMARY KEY auto_increment NOT NULL,
    nome VARCHAR(50),
    localizacao VARCHAR(50),
    orcamento DECIMAL(10, 2)
);

INSERT INTO departamento (nome, localizacao, orcamento) values 
	('Recursos Humanos','São Paulo',50000.00),
    ('Financeiro','Rio de Janeiro',75000.00),
    ('Marketing','Belo Horizonte',60000.00),
    ('TI','Curitiba',90000.00),
    ('Vendas','Porto Alegre',45000.00);
	
SELECT * FROM departamento
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

DROP TABLE departamento;

DELETE FROM departamento
where id = 5;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\depto.csv'
INTO TABLE departamento
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n';

START TRANSACTION;

UPDATE departamento SET orcamento = orcamento + 1000.00 WHERE nome = 'TI';

UPDATE departamento SET orcamento = orcamento + 1000.00 WHERE nome = 'Financeiro';

COMMIT;

START TRANSACTION;

UPDATE departamento SET orcamento = orcamento - 5000.00 WHERE nome = 'Marketing';

UPDATE departamento SET orcamento = orcamento - 3000.00 WHERE nome = 'Vendas';

ROLLBACK;