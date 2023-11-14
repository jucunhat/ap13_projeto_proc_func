-- 1.5.1 Responde (devolve boolean) se é verdade que todos os estudantes de renda acima de
-- 410 são aprovados (grade > 0).
CREATE OR REPLACE FUNCTION fn_estudantes_aprovados() RETURNS BOOLEAN AS $$
DECLARE
    estudante RECORD;
BEGIN
    FOR estudante IN SELECT * FROM tb_projeto  WHERE SALARY >= 5 LOOP
        IF estudante.GRADE > 0 THEN
            RETURN FALSE;
        END IF;
    END LOOP;
    RETURN TRUE;
END; $$
LANGUAGE plpgsql;

DO $$
DECLARE
    aprovados BOOLEAN;
BEGIN
    aprovados := fn_estudantes_aprovados();
    RAISE NOTICE 'Todos os estudantes com renda acima de 410 são aprovados: %', aprovados;
END $$;

-- -- 1.4.3 Recebe um sexo como parâmetro em modo IN e utiliza oito parâmetros em modo OUT
-- -- para dizer qual o percentual de cada nota (variável grade) obtida por estudantes daquele
-- -- sexo.
-- DROP PROCEDURE sp_percentuais
-- CREATE OR REPLACE PROCEDURE sp_percentuais(p_gender INTEGER, OUT grade1_percent NUMERIC (10, 2), 
-- 										   OUT grade2_percent NUMERIC(10, 2), OUT grade3_percent NUMERIC(10, 2), 
-- 										   OUT grade4_percent NUMERIC(10, 2), OUT grade5_percent NUMERIC(10, 2), 
-- 										   OUT grade6_percent NUMERIC(10, 2), OUT grade7_percent NUMERIC(10, 2), 
-- 										   OUT grade8_percent NUMERIC(10, 2))
-- AS $$
-- DECLARE
--     total_de_estudantes INTEGER;
-- BEGIN
--     SELECT COUNT(*) INTO total_de_estudantes FROM tb_projeto WHERE GENDER = p_gender;

--     SELECT COUNT(*) INTO grade1_percent FROM tb_projeto WHERE GENDER = p_gender AND GRADE = 1;
--     grade1_percent := (grade1_percent::NUMERIC / total_de_estudantes) * 100;

--     SELECT COUNT(*) INTO grade2_percent FROM tb_projeto WHERE GENDER = p_gender AND GRADE = 2;
--     grade2_percent := (grade2_percent::NUMERIC / total_de_estudantes) * 100;

--     SELECT COUNT(*) INTO grade3_percent FROM tb_projeto WHERE GENDER = p_gender AND GRADE = 3;
--     grade3_percent := (grade3_percent::NUMERIC / total_de_estudantes) * 100;

--     SELECT COUNT(*) INTO grade4_percent FROM tb_projeto WHERE GENDER = p_gender AND GRADE = 4;
--     grade4_percent := (grade4_percent::NUMERIC / total_de_estudantes) * 100;

--     SELECT COUNT(*) INTO grade5_percent FROM tb_projeto WHERE GENDER = p_gender AND GRADE = 5;
--     grade5_percent := (grade5_percent::NUMERIC / total_de_estudantes) * 100;

--     SELECT COUNT(*) INTO grade6_percent FROM tb_projeto WHERE GENDER = p_gender AND GRADE = 6;
--     grade6_percent := (grade6_percent::NUMERIC / total_de_estudantes) * 100;

--     SELECT COUNT(*) INTO grade7_percent FROM tb_projeto WHERE GENDER = p_gender AND GRADE = 7;
--     grade7_percent := (grade7_percent::NUMERIC / total_de_estudantes) * 100;

--     SELECT COUNT(*) INTO grade8_percent FROM tb_projeto WHERE GENDER = p_gender AND GRADE = 8;
--     grade8_percent := (grade8_percent::NUMERIC / total_de_estudantes) * 100;
-- END; $$
-- LANGUAGE plpgsql;

-- DO $$
-- DECLARE
--     grade1_percent NUMERIC(10, 2);
--     grade2_percent NUMERIC(10, 2);
--     grade3_percent NUMERIC(10, 2);
--     grade4_percent NUMERIC(10, 2);
--     grade5_percent NUMERIC(10, 2);
--     grade6_percent NUMERIC(10, 2);
--     grade7_percent NUMERIC(10, 2);
--     grade8_percent NUMERIC(10, 2);
-- BEGIN
--     CALL sp_percentuais(1, grade1_percent, grade2_percent, grade3_percent, grade4_percent, grade5_percent, grade6_percent, grade7_percent, grade8_percent);
--     RAISE NOTICE 'Percentuais de notas para o sexo: %, %, %, %, %, %, %, %', grade1_percent, grade2_percent, grade3_percent, grade4_percent, grade5_percent, grade6_percent, grade7_percent, grade8_percent;
-- END $$;

-- -- 1.4.2 Exibe o percentual de estudantes de cada sexo.
-- DROP PROCEDURE sp_percentual_genero
-- CREATE PROCEDURE sp_percentual_genero(IN genero INT, OUT percentual_f NUMERIC(10, 2), OUT percentual_m NUMERIC (10, 2))
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE
-- 	contagem_tot INT;
-- 	contagem_f INT;
-- 	contagem_m INT;
-- BEGIN
-- 	SELECT COUNT(*) FROM tb_projeto s INTO contagem_tot;
-- 	SELECT COUNT(GENDER) FROM tb_projeto s WHERE s.GENDER = 1 INTO contagem_f;
-- 	SELECT COUNT(GENDER) FROM tb_projeto s WHERE s.GENDER = 2 INTO contagem_m;
	
-- 	percentual_f = (contagem_f / CAST(contagem_tot AS NUMERIC)) * 100;
-- 	percentual_m = (contagem_m / CAST(contagem_tot AS NUMERIC)) * 100;
-- END;
-- $$

-- DO $$
-- DECLARE
-- 	percentual_f NUMERIC(10, 2);
-- 	percentual_m NUMERIC (10, 2);
-- BEGIN
-- 	CALL sp_percentual_genero(1, percentual_f, percentual_m);
-- 	RAISE NOTICE 'Estudantes do genero feminino representam % %% e estudantes do genero masculino representam % %%', percentual_f, percentual_m;
-- END;
-- $$

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