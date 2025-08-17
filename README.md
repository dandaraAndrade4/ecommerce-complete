# ecommerce-complete

Este projeto apresenta a modelagem lógica de um **sistema de e-commerce**, implementada em **MySQL**.  
O modelo foi construído a partir de um **EER** refinado com base no cenário proposto:

- **Cliente PF e PJ** (especialização de Cliente, garantindo exclusividade);
- **Pagamento** com múltiplas formas associadas a cada pedido;
- **Entrega** com status e código de rastreio.

## Estrutura
- Clientes (PF e PJ)
- Produtos, Fornecedores, Vendedores e Estoque
- Pedidos, Pagamentos e Entregas
- Relacionamentos muitos-para-muitos tratados com tabelas associativas

## Exemplos de Queries
- Recuperações simples com `SELECT`
- Filtros com `WHERE`
- Atributos derivados (`valorTotal * 0.1`)
- Ordenações (`ORDER BY`)
- Filtros em grupos (`HAVING`)
- Junções (`JOIN`) entre múltiplas tabelas
