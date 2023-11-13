-- 1.4.2 Exibe o percentual de estudantes de cada sexo.
DROP PROCEDURE sp_percentual_genero
CREATE PROCEDURE sp_percentual_genero(IN genero INT, OUT percentual_f NUMERIC(10, 2), OUT percentual_m NUMERIC (10, 2))
LANGUAGE plpgsql
AS $$
DECLARE
	contagem_tot INT;
	contagem_f INT;
	contagem_m INT;
BEGIN
	SELECT COUNT(*) FROM tb_projeto s INTO contagem_tot;
	SELECT COUNT(GENDER) FROM tb_projeto s WHERE s.GENDER = 1 INTO contagem_f;
	SELECT COUNT(GENDER) FROM tb_projeto s WHERE s.GENDER = 2 INTO contagem_m;
	
	percentual_f = (contagem_f / CAST(contagem_tot AS NUMERIC)) * 100;
	percentual_m = (contagem_m / CAST(contagem_tot AS NUMERIC)) * 100;
END;
$$

DO $$
DECLARE
	percentual_f NUMERIC(10, 2);
	percentual_m NUMERIC (10, 2);
BEGIN
	CALL sp_percentual_genero(1, percentual_f, percentual_m);
	RAISE NOTICE 'Estudantes do genero feminino representam % %% e estudantes do genero masculino representam % %%', percentual_f, percentual_m;
END;
$$

-- --1.4 Escreva os seguintes stored procedures (incluindo um bloco anônimo de teste para cada um):
-- --1.4.1 Exibe o número de estudantes maiores de idade.
-- --considerei que todos os maiores de idade estão na feixa 2 e 3
-- DROP PROCEDURE sp_conta_maior_de_idade
-- CREATE OR REPLACE PROCEDURE sp_conta_maior_de_idade1 (IN idade INT, OUT contagem INT)
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
-- 	SELECT COUNT(AGE) FROM tb_projeto s WHERE s.AGE >= 2 INTO contagem;
-- END;
-- $$

-- DO 
-- $$
-- DECLARE
-- 	contagem INT;
-- BEGIN
-- 	CALL sp_conta_maior_de_idade1(1, contagem);
-- 	RAISE NOTICE '% alunos maiores de idade', contagem;
-- END;
-- $$

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