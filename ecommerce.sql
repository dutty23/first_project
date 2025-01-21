CREATE DATABASE Ecommerce;

USE Ecommerce;

-- Tabela Cliente armazenando informações gerais dos clientes
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    Endereco VARCHAR(45),
    Identificacao_cliente ENUM('PJ', 'PF') NOT NULL,
    Contato VARCHAR(45),
    UNIQUE(idCliente, ClienteType),
    CHECK(ClienteType in (PJ, PF))
);

-- Tabela ClientePj armazenando informações específicas de clientes Pessoa Jurídica
CREATE TABLE ClientePj (
    idCliente INT,
    CNPJ VARCHAR(14) NOT NULL,
    Razao_social VARCHAR(45),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

-- Tabela ClientePf armazenando informações específicas de clientes Pessoa Física
CREATE TABLE ClientePf (
    idCliente INT,
    Cpf VARCHAR(11) NOT NULL,
    Data_nascimento DATE,
    Sobrenome VARCHAR(45),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

-- Tabela Fornecedor armazenando informações dos fornecedores
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    Razao_social VARCHAR(45),
    CNPJ VARCHAR(14),
    Contato VARCHAR(45)
);

-- Tabela Produto armazenando informações dos produtos
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45),
    Valor FLOAT
);

-- Tabela Estoque armazenando informações sobre os estoques
CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    Local VARCHAR(45),
    Quantidade INT
);

-- Tabela Produto_tem_estoque relacionando produtos com estoques
CREATE TABLE Produto_tem_estoque (
    idEstoque INT,
    idProduto INT,
    Quantidade INT,
    PRIMARY KEY (idEstoque, idProduto),
    FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Terceiro armazenando informações dos vendedores terceiros
CREATE TABLE Terceiro_Vendedor(
    idVendedor INT AUTO_INCREMENT PRIMARY KEY,
    Razao_social VARCHAR(45),
    Local VARCHAR(45),
    Contato VARCHAR(45)
);

-- Tabela Produto_por_Vendedor relacionando produtos com vendedores terceiros
CREATE TABLE Produto_por_Vendedor (
    idVendedor INT,
    idProduto INT,
    Quantidade INT,
    PRIMARY KEY (idVendedor, idProduto),
    FOREIGN KEY (idVendedor) REFERENCES Terceiro_Vendedor(idVendedor),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Disponibiliza relacionando fornecedores com produtos
CREATE TABLE Disponibiliza (
    idFornecedor INT,
    idProduto INT,
    PRIMARY KEY (idFornecedor, idProduto),
    FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

-- Tabela Pedido armazenando informações dos pedidos
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    Status_pedido VARCHAR(45),
    Descricao VARCHAR(45),
    Frete FLOAT,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabela Relacao_Produto_Pedido relacionando produtos com pedidos
CREATE TABLE Relacao_Produto_Pedido (
    idProduto INT,
    idPedido INT,
    Quantidade INT,
    Status_produto VARCHAR(45),
    PRIMARY KEY (idProduto, idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Tabela Pagamento armazenando informações sobre as formas de pagamento
CREATE TABLE Pagamento (
    idForma_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    Forma_pagamento VARCHAR(45),
    idPedido INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

-- Tabela Entrega armazenando informações das entregas
CREATE TABLE Entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    Status_entrega VARCHAR(45),
    Codigo_rastreio VARCHAR(45),
    Transportadora VARCHAR(45),
    idPedido INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);
