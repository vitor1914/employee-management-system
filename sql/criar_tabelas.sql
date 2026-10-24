
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS departamentos (
    id_departamento INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    localizacao TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS cargos (
    id_cargo INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    salario_base REAL NOT NULL CHECK (salario_base >= 0)
);

CREATE TABLE IF NOT EXISTS funcionarios (
    id_funcionario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT,
    data_admissao TEXT NOT NULL,
    id_departamento INTEGER NOT NULL,
    id_cargo INTEGER NOT NULL,
    salario REAL NOT NULL CHECK (salario >= 0),
    status TEXT NOT NULL DEFAULT 'Ativo'
        CHECK (status IN ('Ativo', 'Inativo', 'Afastado')),
    FOREIGN KEY (id_departamento)
        REFERENCES departamentos(id_departamento),
    FOREIGN KEY (id_cargo)
        REFERENCES cargos(id_cargo)
);

CREATE TABLE IF NOT EXISTS historico_salarios (
    id_historico INTEGER PRIMARY KEY AUTOINCREMENT,
    id_funcionario INTEGER NOT NULL,
    salario_anterior REAL NOT NULL CHECK (salario_anterior >= 0),
    salario_novo REAL NOT NULL CHECK (salario_novo >= 0),
    data_alteracao TEXT NOT NULL,
    motivo TEXT NOT NULL,
    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
);

CREATE TABLE IF NOT EXISTS ferias (
    id_ferias INTEGER PRIMARY KEY AUTOINCREMENT,
    id_funcionario INTEGER NOT NULL,
    data_inicio TEXT NOT NULL,
    data_fim TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'Agendada'
        CHECK (status IN ('Agendada', 'Concluida', 'Cancelada')),
    CHECK (data_fim >= data_inicio),
    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
);

CREATE INDEX IF NOT EXISTS idx_funcionarios_departamento
    ON funcionarios(id_departamento);

CREATE INDEX IF NOT EXISTS idx_funcionarios_cargo
    ON funcionarios(id_cargo);

CREATE INDEX IF NOT EXISTS idx_funcionarios_status
    ON funcionarios(status);

CREATE INDEX IF NOT EXISTS idx_historico_funcionario
    ON historico_salarios(id_funcionario);

CREATE INDEX IF NOT EXISTS idx_ferias_funcionario
    ON ferias(id_funcionario);
