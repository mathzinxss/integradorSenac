-- Tabela de contas
CREATE TABLE Contas (
    id_conta INT PRIMARY KEY IDENTITY,
    id_usuario INT NOT NULL,
    nome_conta VARCHAR(100) NOT NULL,
    saldo DECIMAL(15, 2) NOT NULL,
    tipo_conta VARCHAR(50) NOT NULL, -- Novo campo para tipo de conta
    data_criacao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
GO

-- Tabela de categorias de transações (Nova tabela)
CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY IDENTITY,
    nome_categoria VARCHAR(100) NOT NULL,
    descricao_categoria VARCHAR(255)
);
GO

-- Tabela de transações
CREATE TABLE Transacoes (
    id_transacao INT PRIMARY KEY IDENTITY,
    id_conta INT NOT NULL,
    id_usuario INT NOT NULL,
    id_categoria INT NOT NULL, -- Adicionado campo de categoria
    valor DECIMAL(15, 2) NOT NULL,
    data_transacao DATETIME NOT NULL,
    tipo_transacao CHAR(1) NOT NULL, -- 'R' para receita, 'D' para despesa
    descricao VARCHAR(255),
    FOREIGN KEY (id_conta) REFERENCES Contas(id_conta),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);
GO

-- Tabela de orçamentos (agora com categorias)
CREATE TABLE Orcamentos (
    id_orcamento INT PRIMARY KEY IDENTITY,
    id_usuario INT NOT NULL,
    id_categoria INT, -- Pode ser associado a uma categoria específica
    id_conta INT, -- Ou associado a uma conta
    valor_max DECIMAL(15, 2) NOT NULL,
    periodo VARCHAR(50) NOT NULL, -- Ex: Mensal, Anual
    data_criacao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    FOREIGN KEY (id_conta) REFERENCES Contas(id_conta)
);
GO

-- Tabela de metas financeiras (agora com categorias)
CREATE TABLE Metas_Financeiras (
    id_meta INT PRIMARY KEY IDENTITY,
    id_usuario INT NOT NULL,
    id_categoria INT, -- Associado a uma categoria
    valor_meta DECIMAL(15, 2) NOT NULL,
    descricao_meta VARCHAR(255),
    data_prevista DATETIME NOT NULL,
    data_criacao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);
GO

-- Views para relatórios financeiros futuros
GO
CREATE VIEW Relatorio_Financeiro AS
SELECT 
    u.nome AS Usuario,
    c.nome_conta AS Conta,
    cat.nome_categoria AS Categoria,
    t.valor,
    t.data_transacao,
    t.tipo_transacao
FROM Transacoes t
JOIN Contas c ON t.id_conta = c.id_conta
JOIN Usuarios u ON t.id_usuario = u.id_usuario
JOIN Categorias cat ON t.id_categoria = cat.id_categoria
ORDER BY t.data_transacao DESC;
GO
