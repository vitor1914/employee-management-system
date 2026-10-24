
PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

INSERT INTO departamentos (nome, localizacao) VALUES
('Tecnologia', 'Brasilia'),
('Recursos Humanos', 'Brasilia'),
('Financeiro', 'Sao Paulo'),
('Comercial', 'Rio de Janeiro'),
('Operacoes', 'Belo Horizonte');

INSERT INTO cargos (nome, salario_base) VALUES
('Analista Junior', 3000.00),
('Analista Pleno', 5000.00),
('Analista Senior', 7500.00),
('Assistente Administrativo', 2500.00),
('Coordenador', 8500.00),
('Gerente', 12000.00),
('Desenvolvedor', 6500.00),
('Estagiario', 1500.00);

INSERT INTO funcionarios
(nome, email, telefone, data_admissao,
 id_departamento, id_cargo, salario, status)
VALUES
('Ana Souza', 'ana.souza@empresa.com', '61990000001',
 '2022-01-10', 1, 3, 7800, 'Ativo'),
('Bruno Lima', 'bruno.lima@empresa.com', '61990000002',
 '2023-03-15', 1, 7, 6500, 'Ativo'),
('Carla Mendes', 'carla.mendes@empresa.com', '61990000003',
 '2021-07-20', 2, 5, 9000, 'Ativo'),
('Daniel Alves', 'daniel.alves@empresa.com', '61990000004',
 '2024-02-01', 3, 1, 3200, 'Ativo'),
('Eduarda Costa', 'eduarda.costa@empresa.com', '61990000005',
 '2020-11-05', 4, 6, 12500, 'Ativo'),
('Felipe Rocha', 'felipe.rocha@empresa.com', '61990000006',
 '2023-06-12', 5, 2, 5200, 'Ativo'),
('Gabriela Dias', 'gabriela.dias@empresa.com', '61990000007',
 '2022-09-01', 1, 2, 5400, 'Ativo'),
('Henrique Melo', 'henrique.melo@empresa.com', '61990000008',
 '2024-05-20', 2, 4, 2600, 'Ativo'),
('Isabela Martins', 'isabela.martins@empresa.com', '61990000009',
 '2021-04-18', 3, 3, 7600, 'Ativo'),
('Joao Pedro', 'joao.pedro@empresa.com', '61990000010',
 '2023-08-07', 4, 1, 3100, 'Ativo'),
('Karen Oliveira', 'karen.oliveira@empresa.com', '61990000011',
 '2022-12-12', 5, 5, 8700, 'Ativo'),
('Lucas Ferreira', 'lucas.ferreira@empresa.com', '61990000012',
 '2020-06-30', 1, 6, 13000, 'Ativo'),
('Mariana Ribeiro', 'mariana.ribeiro@empresa.com', '61990000013',
 '2024-01-08', 2, 8, 1500, 'Ativo'),
('Nicolas Santos', 'nicolas.santos@empresa.com', '61990000014',
 '2023-10-16', 3, 2, 5100, 'Inativo'),
('Olivia Barros', 'olivia.barros@empresa.com', '61990000015',
 '2021-02-22', 4, 3, 7900, 'Ativo'),
('Paulo Nunes', 'paulo.nunes@empresa.com', '61990000016',
 '2024-07-01', 5, 4, 2500, 'Afastado'),
('Quezia Araujo', 'quezia.araujo@empresa.com', '61990000017',
 '2022-05-14', 1, 1, 3300, 'Ativo'),
('Rafael Gomes', 'rafael.gomes@empresa.com', '61990000018',
 '2020-03-09', 2, 6, 12200, 'Ativo'),
('Sofia Cardoso', 'sofia.cardoso@empresa.com', '61990000019',
 '2023-11-27', 3, 4, 2700, 'Ativo'),
('Thiago Freitas', 'thiago.freitas@empresa.com', '61990000020',
 '2024-04-10', 4, 8, 1500, 'Ativo');

INSERT INTO historico_salarios
(id_funcionario, salario_anterior, salario_novo,
 data_alteracao, motivo)
VALUES
(1, 7200, 7800, '2024-01-10', 'Promocao'),
(2, 6000, 6500, '2024-03-15', 'Reajuste salarial'),
(3, 8200, 9000, '2023-07-20', 'Promocao'),
(4, 3000, 3200, '2025-02-01', 'Reajuste salarial'),
(5, 11500, 12500, '2024-11-05', 'Promocao'),
(6, 4800, 5200, '2024-06-12', 'Reajuste salarial'),
(7, 5000, 5400, '2024-09-01', 'Reajuste salarial'),
(12, 12000, 13000, '2023-06-30', 'Promocao');

INSERT INTO ferias
(id_funcionario, data_inicio, data_fim, status)
VALUES
(1, '2026-01-05', '2026-01-19', 'Concluida'),
(2, '2026-11-02', '2026-11-16', 'Agendada'),
(3, '2026-12-01', '2026-12-15', 'Agendada'),
(4, '2026-03-10', '2026-03-24', 'Concluida'),
(5, '2026-08-01', '2026-08-15', 'Concluida'),
(6, '2026-12-10', '2026-12-24', 'Agendada'),
(7, '2026-07-01', '2026-07-15', 'Concluida'),
(8, '2026-11-10', '2026-11-20', 'Agendada');

COMMIT;
