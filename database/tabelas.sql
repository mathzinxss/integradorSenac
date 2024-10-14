-- Criar tabela Usuarios
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)  UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    data_cadastro DATETIME DEFAULT GETDATE()
);

-- Criar tabela Contas
CREATE TABLE Contas (
    id_contas INT PRIMARY KEY IDENTITY(1,1),
    id_usuario INT,
    nome_conta VARCHAR(100) NOT NULL,
    saldo DECIMAL(10, 2) DEFAULT 0.00,
    data_cadastro DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);