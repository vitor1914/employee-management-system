
-- 1. Listar todos os funcionarios
SELECT *
FROM funcionarios
ORDER BY nome;

-- 2. Funcionarios com departamento e cargo
SELECT
    f.id_funcionario,
    f.nome,
    d.nome AS departamento,
    c.nome AS cargo,
    f.salario,
    f.status
FROM funcionarios f
JOIN departamentos d
    ON f.id_departamento = d.id_departamento
JOIN cargos c
    ON f.id_cargo = c.id_cargo
ORDER BY f.nome;

-- 3. Somente funcionarios ativos
SELECT nome, email, salario
FROM funcionarios
WHERE status = 'Ativo'
ORDER BY nome;

-- 4. Funcionarios com salario acima de R$ 5.000
SELECT nome, salario
FROM funcionarios
WHERE salario > 5000
ORDER BY salario DESC;

-- 5. Pesquisar funcionario pelo nome
SELECT *
FROM funcionarios
WHERE nome LIKE '%Ana%';

-- 6. Funcionarios admitidos a partir de 2023
SELECT nome, data_admissao
FROM funcionarios
WHERE data_admissao >= '2023-01-01'
ORDER BY data_admissao;

-- 7. Contagem de funcionarios por departamento
SELECT
    d.nome AS departamento,
    COUNT(f.id_funcionario) AS total_funcionarios
FROM departamentos d
LEFT JOIN funcionarios f
    ON d.id_departamento = f.id_departamento
GROUP BY d.id_departamento, d.nome
ORDER BY total_funcionarios DESC;

-- 8. Media salarial por departamento
SELECT
    d.nome AS departamento,
    ROUND(AVG(f.salario), 2) AS salario_medio
FROM departamentos d
JOIN funcionarios f
    ON d.id_departamento = f.id_departamento
GROUP BY d.id_departamento, d.nome
ORDER BY salario_medio DESC;

-- 9. Os cinco maiores salarios
SELECT nome, salario
FROM funcionarios
ORDER BY salario DESC
LIMIT 5;

-- 10. Funcionarios sem status ativo
SELECT nome, status
FROM funcionarios
WHERE status <> 'Ativo';

-- 11. Funcionarios sem ferias cadastradas
SELECT f.nome
FROM funcionarios f
LEFT JOIN ferias fe
    ON f.id_funcionario = fe.id_funcionario
WHERE fe.id_ferias IS NULL;

-- 12. Historico de alteracoes salariais
SELECT
    f.nome,
    h.salario_anterior,
    h.salario_novo,
    h.data_alteracao,
    h.motivo,
    ROUND(h.salario_novo - h.salario_anterior, 2)
        AS diferenca_salarial
FROM historico_salarios h
JOIN funcionarios f
    ON h.id_funcionario = f.id_funcionario
ORDER BY h.data_alteracao DESC;

-- 13. Proximas ferias agendadas
SELECT
    f.nome,
    fe.data_inicio,
    fe.data_fim,
    fe.status
FROM ferias fe
JOIN funcionarios f
    ON fe.id_funcionario = f.id_funcionario
WHERE fe.status = 'Agendada'
ORDER BY fe.data_inicio;

-- 14. Folha salarial dos funcionarios ativos
SELECT
    COUNT(*) AS total_ativos,
    ROUND(SUM(salario), 2) AS folha_salarial,
    ROUND(AVG(salario), 2) AS salario_medio
FROM funcionarios
WHERE status = 'Ativo';

-- 15. Distribuicao de funcionarios por status
SELECT
    status,
    COUNT(*) AS quantidade
FROM funcionarios
GROUP BY status
ORDER BY quantidade DESC;
