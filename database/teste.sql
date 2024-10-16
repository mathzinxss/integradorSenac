-- Criação das tabelas
USE GFinanceiro
GO

CREATE TABLE Contas (
    id_conta INT PRIMARY KEY IDENTITY,
    id_usuario INT NOT NULL,
    nome_conta VARCHAR(100) NOT NULL,
    saldo DECIMAL(15,2) DEFAULT 0.00,
    data_cadastro DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
GO

CREATE TABLE Transacoes (
    id_transacao INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT,
    id_conta INT,
    valor DECIMAL(10, 2) NOT NULL,
    categoria VARCHAR(50),
    tipo_transacao CHAR(7),
    descricao VARCHAR(255),
    data_transacao DATETIME DEFAULT GETDATE(),
    CONSTRAINT CHK_Tipo_Transacao CHECK (tipo_transacao IN ('receita', 'despesa')),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_conta) REFERENCES Contas(id_conta)
);

CREATE TABLE Orcamentos (
    id_orcamento INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT,
    categoria VARCHAR(50),
    limite DECIMAL(10, 2) NOT NULL,
    mes INT CHECK (mes BETWEEN 1 AND 12),
    ano INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE Metas (
    id_meta INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT,
    descricao VARCHAR(255),
    valor_alvo DECIMAL(10, 2) NOT NULL,
    valor_atual DECIMAL(10, 2) DEFAULT 0.00,
    data_limite DATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE RecursosEducacionais (
    id_recurso INT PRIMARY KEY IDENTITY(1,1),
    titulo VARCHAR(255) NOT NULL,
    tipo_conteudo CHAR(10) CHECK (tipo_conteudo IN ('artigo', 'video', 'calculadora')),
    link_conteudo VARCHAR(255),
    descricao TEXT
)
