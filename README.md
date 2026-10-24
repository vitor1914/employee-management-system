
# Employee Management System — SQL

[Português](#português) | [English](#english)

---

## Português

### Sobre o projeto

Sistema de gerenciamento de funcionários desenvolvido com SQL e SQLite,
com foco em modelagem relacional, consultas analíticas, relatórios
gerenciais e validação da qualidade dos dados.

O projeto simula uma base corporativa de Recursos Humanos utilizando
dados fictícios.

### Objetivos

- Modelar um banco de dados relacional.
- Aplicar chaves primárias e estrangeiras.
- Consultar e relacionar múltiplas tabelas.
- Analisar salários e departamentos.
- Criar relatórios de indicadores de RH.
- Validar a integridade e a consistência dos dados.

### Tecnologias

- SQL
- SQLite
- DB Browser for SQLite
- Git e GitHub

### Estrutura do projeto

```text
employee-management-system-sql/
├── sql/
│   ├── 01_criar_tabelas.sql
│   ├── 02_inserir_dados.sql
│   ├── 03_consultas.sql
│   ├── 04_relatorios.sql
│   └── 05_validacoes.sql
├── docs/
│   └── dicionario_de_dados.md
├── .gitignore
└── README.md
```

### Modelo de dados

O banco possui cinco tabelas:

- departamentos
- cargos
- funcionarios
- historico_salarios
- ferias

Os relacionamentos utilizam chaves estrangeiras para associar funcionários
a departamentos, cargos, histórico salarial e períodos de férias.

### Análises realizadas

- Quantidade de funcionários por departamento.
- Média salarial por departamento e cargo.
- Distribuição da folha salarial.
- Identificação dos maiores salários.
- Histórico de reajustes.
- Tempo de empresa.
- Situação dos funcionários.
- Programação de férias.
- Verificação da integridade dos dados.

### Como executar

1. Instale e abra o DB Browser for SQLite.
2. Crie um novo banco chamado `funcionarios.db`.
3. Abra a aba "Executar SQL".
4. Execute `01_criar_tabelas.sql`.
5. Execute `02_inserir_dados.sql` uma única vez.
6. Execute os demais scripts conforme a análise desejada.
7. Consulte os resultados na área de execução SQL.

Os scripts devem ser executados na ordem indicada para criação e carga
inicial do banco.

### Resultados esperados

- 5 departamentos.
- 8 cargos.
- 20 funcionários.
- 8 registros de histórico salarial.
- 8 registros de férias.

### Observações

Os registros são fictícios e foram criados exclusivamente para fins
educacionais e de demonstração.

O projeto não é um sistema de RH pronto para produção. Ele demonstra
fundamentos de SQL e análise de dados em um cenário corporativo simulado.

---

## English

### About the project

An employee management database developed with SQL and SQLite, focusing
on relational data modeling, analytical queries, management reports,
and data quality validation.

The project simulates a Human Resources database using fictional data.

### Objectives

- Design a relational database.
- Apply primary and foreign keys.
- Query and join multiple tables.
- Analyze salaries and departments.
- Build HR management reports.
- Validate data integrity and consistency.

### Technologies

- SQL
- SQLite
- DB Browser for SQLite
- Git and GitHub

### Database tables

The database contains five tables:

- departments
- job_positions
- employees
- salary_history
- vacations

The original SQL schema uses Portuguese table names.

### Analyses

- Employee distribution by department.
- Average salaries by department and job position.
- Payroll distribution.
- Highest salaries.
- Salary adjustment history.
- Employee tenure.
- Employee status analysis.
- Vacation scheduling.
- Data integrity checks.

### Expected dataset

- 5 departments.
- 8 job positions.
- 20 employees.
- 8 salary history records.
- 8 vacation records.

### Notes

All records are fictional and intended for educational and portfolio use.

This project demonstrates SQL and data analysis fundamentals in a
simulated corporate environment.

---

## Author

GitHub: [vitor1914](https://github.com/vitor1914)
