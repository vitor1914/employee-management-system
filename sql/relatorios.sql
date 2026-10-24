
-- RELATORIO 1: Indicadores gerais da empresa
SELECT
    COUNT(*) AS total_cadastrados,
    SUM(CASE WHEN status = 'Ativo' THEN 1 ELSE 0 END)
        AS total_ativos,
    SUM(CASE WHEN status = 'Inativo' THEN 1 ELSE 0 END)
        AS total_inativos,
    SUM(CASE WHEN status = 'Afastado' THEN 1 ELSE 0 END)
        AS total_afastados,
    ROUND(AVG(salario), 2) AS media_salarial,
    ROUND(SUM(CASE
        WHEN status = 'Ativo' THEN salario
        ELSE 0
    END), 2) AS folha_ativos
FROM funcionarios;

-- RELATORIO 2: Resumo por departamento
SELECT
    d.nome AS departamento,
    COUNT(f.id_funcionario) AS quantidade,
    ROUND(AVG(f.salario), 2) AS salario_medio,
    ROUND(SUM(CASE
        WHEN f.status = 'Ativo' THEN f.salario
        ELSE 0
    END), 2) AS folha_ativos
FROM departamentos d
LEFT JOIN funcionarios f
    ON d.id_departamento = f.id_departamento
GROUP BY d.id_departamento, d.nome
ORDER BY folha_ativos DESC;

-- RELATORIO 3: Cargos com maior salario medio
SELECT
    c.nome AS cargo,
    COUNT(f.id_funcionario) AS quantidade,
    ROUND(AVG(f.salario), 2) AS salario_medio,
    ROUND(MAX(f.salario), 2) AS maior_salario,
    ROUND(MIN(f.salario), 2) AS menor_salario
FROM cargos c
LEFT JOIN funcionarios f
    ON c.id_cargo = f.id_cargo
GROUP BY c.id_cargo, c.nome
ORDER BY salario_medio DESC;

-- RELATORIO 4: Distribuicao da folha por departamento
WITH folha AS (
    SELECT
        d.nome AS departamento,
        SUM(CASE
            WHEN f.status = 'Ativo' THEN f.salario
            ELSE 0
        END) AS total_folha
    FROM departamentos d
    LEFT JOIN funcionarios f
        ON d.id_departamento = f.id_departamento
    GROUP BY d.id_departamento, d.nome
)
SELECT
    departamento,
    ROUND(total_folha, 2) AS total_folha,
    ROUND(
        100.0 * total_folha /
        NULLIF(SUM(total_folha) OVER (), 0),
        2
    ) AS percentual_folha
FROM folha
ORDER BY total_folha DESC;

-- RELATORIO 5: Evolucao dos reajustes salariais
SELECT
    strftime('%Y-%m', data_alteracao) AS mes,
    COUNT(*) AS quantidade_reajustes,
    ROUND(SUM(salario_novo - salario_anterior), 2)
        AS aumento_acumulado
FROM historico_salarios
GROUP BY strftime('%Y-%m', data_alteracao)
ORDER BY mes;

-- RELATORIO 6: Tempo de empresa em anos completos
SELECT
    nome,
    data_admissao,
    CAST(
        (julianday('now') - julianday(data_admissao)) / 365.2425
        AS INTEGER
    ) AS anos_de_empresa
FROM funcionarios
ORDER BY anos_de_empresa DESC;

-- RELATORIO 7: Funcionarios com salario acima da media
SELECT
    nome,
    salario,
    ROUND((SELECT AVG(salario) FROM funcionarios), 2)
        AS media_geral
FROM funcionarios
WHERE salario > (SELECT AVG(salario) FROM funcionarios)
ORDER BY salario DESC;

-- RELATORIO 8: Ferias futuras agendadas
SELECT
    f.nome,
    fe.data_inicio,
    fe.data_fim,
    CAST(
        julianday(fe.data_fim) - julianday(fe.data_inicio) + 1
        AS INTEGER
    ) AS dias_corridos
FROM ferias fe
JOIN funcionarios f
    ON f.id_funcionario = fe.id_funcionario
WHERE fe.status = 'Agendada'
  AND fe.data_inicio >= date('now')
ORDER BY fe.data_inicio;
