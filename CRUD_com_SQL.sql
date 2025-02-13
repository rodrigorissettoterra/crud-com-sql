-- CRUD -> Create, Read, Update and Delete --

-- CRIAÇÃO --
-- Criação de um banco de dados --
CREATE DATABASE cadastro;

-- Usar o banco de dados cadastro --
USE cadastro;

-- Criação de uma tabela --
CREATE TABLE pessoas (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
rg VARCHAR(7),
cpf VARCHAR(11),
limite INT(10)
);

-- Inserir registros nesta tabela --
INSERT INTO pessoas (nome, rg, cpf, limite) VALUES
("Rodrigo", "1234567", "99999999999", 20000),
("Bruna", "1597530", "88888888888", 7500),
("Solange", "9517539", "77777777777", 5000),
("Nena", "1111117", "66666666666", 1000)
;

-- Visualizando a inserção dos registros -- 
SELECT * FROM pessoas;
-- Resultado: --
-- # id_usuario, nome, rg, cpf, limite --
-- '1', 'Rodrigo', '1234567', '99999999999', '20000' --
-- '2', 'Bruna', '1597530', '88888888888', '7500' --
-- '3', 'Solange', '9517539', '77777777777', '5000' --
-- '4', 'Nena', '1111117', '66666666666', '1000' --



-- LEITURA --
-- Pesquisando todos os dados de um usuário específico --
SELECT *
FROM pessoas
WHERE nome = "Solange";
-- Resultado: --
-- # id_usuario, nome, rg, cpf, limite --
-- '3', 'Solange', '9517539', '77777777777', '5000' --

-- Pesquisando nomes e limites de usuários que não possuam o rg = 1234567 --
SELECT nome, limite
FROM pessoas
WHERE RG <> "1234567";
-- Resultado: --
-- # nome, limite --
-- 'Bruna', '7500' --
-- 'Solange', '5000' --
-- 'Nena', '1000' --

-- Pesquisando nome, rg e cpf de usuários que tenham um limite entre 4000 e 8000 --
SELECT nome, rg, cpf
FROM pessoas
WHERE limite > 4000 AND limite < 8000;
-- Resultado: --
-- # nome, rg, cpf --
-- 'Bruna', '1597530', '88888888888' --
-- 'Solange', '9517539', '77777777777' --


-- UPDATE --
-- Inserindo um novo registro na tabela pessoas --
INSERT INTO pessoas (nome, rg, cpf, limite) VALUES ("Joaquim", "5653999", "07422922933", 99999);

-- Verificando se esse registro foi corretamente adicionado à tabela --
SELECT * FROM pessoas;
-- Resultado: --
-- # id_usuario, nome, rg, cpf, limite --
-- '1', 'Rodrigo', '1234567', '99999999999', '20000' --
-- '2', 'Bruna', '1597530', '88888888888', '7500' --
-- '3', 'Solange', '9517539', '77777777777', '5000' --
-- '4', 'Nena', '1111117', '66666666666', '1000' --
-- '5', 'Joaquim', '5653999', '07422922933', '99999' --

-- Atualizando valores nos registros --
-- O limite do usuário Rodrigo passará a ser de 25000 --
-- O rg de Nena passará a ser 2587419 --
UPDATE pessoas
SET limite = '25000'
WHERE id_usuario = 1;

UPDATE pessoas
SET rg = '2587419'
WHERE id_usuario = 4;

-- Verificando se esse registro foi corretamente adicionado à tabela --
SELECT * FROM pessoas;
-- Resultado: --
-- # id_usuario, nome, rg, cpf, limite --
-- '1', 'Rodrigo', '1234567', '99999999999', '25000' --
-- '2', 'Bruna', '1597530', '88888888888', '7500' --
-- '3', 'Solange', '9517539', '77777777777', '5000' --
-- '4', 'Nena', '2587419', '66666666666', '1000' --
-- '5', 'Joaquim', '5653999', '07422922933', '99999' --


-- DELETE -- 
-- Deletendo da tabela pessoas o usuário de id_usuario 2
DELETE FROM pessoas
WHERE id_usuario = 2;

-- Verificando o resultado da exclusão de usuário --
SELECT * FROM pessoas;
-- Resultado: --
-- # id_usuario, nome, rg, cpf, limite --
-- '1', 'Rodrigo', '1234567', '99999999999', '25000' --
-- '3', 'Solange', '9517539', '77777777777', '5000' --
-- '4', 'Nena', '2587419', '66666666666', '1000' --
-- '5', 'Joaquim', '5653999', '07422922933', '99999' --