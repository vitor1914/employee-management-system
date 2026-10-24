
# Dicionário de Dados — Sistema de Funcionários

## departamentos
- id_departamento: identificador único.
- nome: nome do departamento.
- localizacao: local de atuação.

## cargos
- id_cargo: identificador único.
- nome: título do cargo.
- salario_base: referência salarial do cargo.

## funcionarios
- id_funcionario: identificador único.
- nome: nome completo.
- email: e-mail único.
- telefone: telefone de contato.
- data_admissao: data de entrada no formato AAAA-MM-DD.
- id_departamento: referência ao departamento.
- id_cargo: referência ao cargo.
- salario: salário atual cadastrado.
- status: Ativo, Inativo ou Afastado.

## historico_salarios
- id_historico: identificador do registro.
- id_funcionario: funcionário relacionado.
- salario_anterior: salário antes da alteração.
- salario_novo: salário depois da alteração.
- data_alteracao: data do reajuste.
- motivo: justificativa da alteração.

## ferias
- id_ferias: identificador do registro.
- id_funcionario: funcionário relacionado.
- data_inicio: primeiro dia das férias.
- data_fim: último dia das férias.
- status: Agendada, Concluida ou Cancelada.

## Relacionamentos
- departamentos 1:N funcionarios.
- cargos 1:N funcionarios.
- funcionarios 1:N historico_salarios.
- funcionarios 1:N ferias.

## Regras
- E-mails não podem se repetir.
- Salários não podem ser negativos.
- Funcionários precisam ter departamento e cargo válidos.
- Datas são armazenadas como texto ISO: AAAA-MM-DD.
