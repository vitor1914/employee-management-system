
-- 1. Verificar emails duplicados
SELECT email, COUNT(*) AS quantidade
FROM funcionarios
GROUP BY email
HAVING COUNT(*) > 1;

-- 2. Verificar funcionarios sem departamento valido
SELECT f.id_funcionario, f.nome
FROM funcionarios f
LEFT JOIN departamentos d
    ON f.id_departamento = d.id_departamento
WHERE d.id_departamento IS NULL;

-- 3. Verificar funcionarios sem cargo valido
SELECT f.id_funcionario, f.nome
FROM funcionarios f
LEFT JOIN cargos c
    ON f.id_cargo = c.id_cargo
WHERE c.id_cargo IS NULL;

-- 4. Verificar campos obrigatorios vazios
SELECT id_funcionario, nome, email
FROM funcionarios
WHERE nome IS NULL OR TRIM(nome) = ''
   OR email IS NULL OR TRIM(email) = '';

-- 5. Verificar salarios abaixo de zero
SELECT id_funcionario, nome, salario
FROM funcionarios
WHERE salario < 0;

-- 6. Verificar datas de admissao futuras
SELECT id_funcionario, nome, data_admissao
FROM funcionarios
WHERE data_admissao > date('now');

-- 7. Verificar ferias com datas inconsistentes
SELECT *
FROM ferias
WHERE data_fim < data_inicio;

-- 8. Verificar integridade referencial
PRAGMA foreign_key_check;

-- 9. Verificar estrutura das tabelas
SELECT name, type
FROM sqlite_master
WHERE type IN ('table', 'index')
  AND name NOT LIKE 'sqlite_%'
ORDER BY type, name;

-- 10. Verificar quantidade de registros
SELECT 'departamentos' AS tabela, COUNT(*) AS registros
FROM departamentos
UNION ALL
SELECT 'cargos', COUNT(*) FROM cargos
UNION ALL
SELECT 'funcionarios', COUNT(*) FROM funcionarios
UNION ALL
SELECT 'historico_salarios', COUNT(*) FROM historico_salarios
UNION ALL
SELECT 'ferias', COUNT(*) FROM ferias;
