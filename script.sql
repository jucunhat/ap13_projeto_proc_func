--1.4 Escreva os seguintes stored procedures (incluindo um bloco anônimo de teste para cada um):
--1.4.1 Exibe o número de estudantes maiores de idade.
--considerei que todos os maiores de idade estão na feixa 2 e 3
DROP PROCEDURE sp_conta_maior_de_idade
CREATE OR REPLACE PROCEDURE sp_conta_maior_de_idade1 (IN idade INT, OUT contagem INT)
LANGUAGE plpgsql
AS $$
BEGIN
	SELECT COUNT(AGE) FROM tb_projeto s WHERE s.AGE >= 2 INTO contagem;
END;
$$

DO 
$$
DECLARE
	contagem INT;
BEGIN
	CALL sp_conta_maior_de_idade1(1, contagem);
	RAISE NOTICE '% alunos maiores de idade', contagem;
END;
$$

-- CREATE TABLE tb_projeto(
-- 	id SERIAL PRIMARY KEY,
-- 	AGE INT,
-- 	GENDER INT,
-- 	SALARY INT,
-- 	PREP_EXAM INT,
-- 	NOTES INT,
-- 	GRADE INT
-- );
-- SELECT * FROM tb_projeto