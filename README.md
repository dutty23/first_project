# Sistema de Gestão de E-commerce

![MySQL](https://img.icons8.com/color/48/000000/mysql-logo.png)

Bem-vindo ao repositório do **Sistema de Gestão de E-commerce**! Este projeto de E-commerce, desenvolvido como parte do Bootcamp da DIO! Este projeto fictício foi criado para simular uma plataforma de vendas online, permitindo que os participantes do bootcamp apliquem os conhecimentos adquiridos em um ambiente prático. A proposta é desenvolver um sistema que facilite a interação entre clientes, produtos e fornecedores, proporcionando uma experiência de compra eficiente e intuitiva.

## Visão Geral

Este repositório contém a estrutura e os scripts SQL para criação e gerenciamento de um banco de dados completo para um sistema de e-commerce. O objetivo principal é oferecer uma solução robusta para armazenar e gerenciar informações sobre produtos, fornecedores, clientes, pedidos, estoques e pagamentos.

## Estrutura do Banco de Dados

O banco de dados está organizado em diversas tabelas, cada uma responsável por armazenar dados específicos:

## Estrutura do Banco de Dados

- **Cliente**:  
  Armazena informações gerais dos clientes, com um campo `Identificacao_cliente` que distingue entre cliente Pessoa Física (PF) e Pessoa Jurídica (PJ).
- **ClientePj e ClientePf**:  
  Essas tabelas armazenam informações específicas para clientes do tipo Pessoa Jurídica e Pessoa Física, respectivamente. Ambas são associadas à tabela `Cliente` via `idCliente` (chave estrangeira).
- **Fornecedor**:  
  Armazena informações sobre os fornecedores, com a chave primária `idFornecedor`.
- **Produto**:  
  Armazena os produtos, incluindo categoria, descrição e preço.
- **Estoque**:  
  Contém informações sobre os estoques, como a quantidade de itens e localização.
- **Produto_tem_estoque**:  
  Relaciona produtos com estoques, informando a quantidade de cada produto disponível em cada local.
- **Terceiro_Vendedor**:  
  Armazena informações sobre vendedores terceirizados (representantes de vendas).
- **Produto_por_Vendedor**:  
  Relaciona vendedores terceiros com produtos, especificando a quantidade fornecida por cada vendedor.
- **Disponibiliza**:  
  Relaciona fornecedores com produtos, indicando quais produtos estão disponíveis por cada fornecedor.
- **Pedido**:  
  Armazena informações sobre os pedidos realizados pelos clientes, incluindo o status do pedido e o valor do frete.
- **Relacao_Produto_Pedido**:  
  Relaciona produtos com pedidos, incluindo a quantidade e o status de cada produto no pedido.
- **Pagamento**:  
  Armazena informações sobre as formas de pagamento de pedidos, referenciando o pedido correspondente.
- **Entrega**:  
  Armazena informações sobre a entrega do pedido, incluindo status, código de rastreio e transportadora.


Cada tabela foi projetada com integridade referencial e relacionamentos claros para garantir a consistência e eficiência do banco de dados.

## Tecnologias Utilizadas

- ![MySQL](https://img.icons8.com/color/24/000000/mysql-logo.png) **MySQL**: Utilizado para a criação e gestão do banco de dados.
- **Workbench**: Ferramenta utilizada para modelagem e geração dos scripts SQL.

## Como Utilizar

1. Clone o repositório para sua máquina local.
2. Importe os scripts SQL em seu servidor MySQL.
3. Execute os scripts para criar as tabelas e relacionamentos.
4. Comece a adicionar dados e explore a estrutura do banco de dados.

## Contribuição

Contribuições são bem-vindas! Se você quiser melhorar o design do banco de dados, adicionar novas funcionalidades ou corrigir bugs, sinta-se à vontade para enviar um pull request. 


