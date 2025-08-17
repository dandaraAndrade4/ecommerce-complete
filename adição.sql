insert into Cliente(nome, email, telefone, nascimento) values
			('Ana Silva','anasilva03@email.com','21999999999', 10052007),
			('Loja XPTO','contatorh@xpto.com','2133333333', 11021997);
            
insert into Cliente(nome, email, telefone, nascimento) values
			('Ana Maria Braga', 'anamarialouro@gmail.com', '21996326598', 13081962),
            ('Lalisa Manoban', 'lalisacatlover@gmail.com', '21997236895', 27031997),
            ('Roseanne Park', 'hanklovesrosie@gmail.com', '21996361102', 11021998);
            
insert into Cliente(nome, email, telefone, nascimento) values
			('Jennie Kim', 'kumakingdog@yahoo.com', '21965326532', 13011996),
            ('Kim Jisoo', 'dalgombestboy@gmail.com', '21987785632', 03011995);

insert into Cliente_PF(idClientePF, cpf) values
			(1, '12345678901'),
            (2, '12345678954'),
			(3, '98765432100'),
			(4, '11122233344'),
			(5, '12345678000');

insert into Cliente_PJ (idClientePJ, cnpj, razaoSocial) VALUES
			(6, '11222333444455', 'Tech Solutions LTDA'),
			(7, '99887766554433', 'Supermercado Bom Preço');

insert into Produto(nome, categoria, preco, avaliacao) values
			('Notebook samsung', 'eletronico', 3500, 4.5),
            ('Notebook dell', 'eletronico', 2500, 5),
            ('Saia shein', 'vestimenta', 30, 4.5),
			('Camiseta', 'vestimenta', 79.90, 4.2);

insert into Estoque(localizacao, quantidade) values
			('Rio de Janeiro', 100),
			('São Paulo', 500);

insert into Fornecedor(nome, cnpj) values
			('TechFornecedora', '99887766000100'),
			('Jordan Soluções', '12345678998765');

insert into Vendedor(nome, cnpj, cpf,  contato) values
			('Loja Online','11223344000155', null, '21988887777'),
			('Simba vendas', null, '12345678912', '21999887654');

insert into Pedido(idCliente, dataEmissao, status, valorTotal) values
			(4, '2024-08-01', default, 500),
            (5, '2025-10-04', 'confirmado', 3579.90);

insert into Pedido_Produto values
			(1, 1, 1),
            (1, 2, 1);

insert into Pagamento(tipo, limiteDisponivel) values
			('cartao', 5000);

insert into Pedido_Pagamento values
			(1, 1);

insert into Entrega(idPedido, status, codigoRastreio) values
			(1, 'enviado', 'BR123456789BR');


select * from Produto where categoria = 'eletronico';
select idPedido, valorTotal, valorTotal*0.1 as desconto from Pedido;
select nome, preco from Produto order by preco desc;
select idCliente, count(*) as total_pedidos
from Pedido
group by idCliente
having total_pedidos > 0;

select c.nome, count(p.idPedido) as total_pedidos
from Cliente c
join Pedido p on c.idCliente = p.idCliente
group by c.nome;
