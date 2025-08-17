create table Cliente (
    idCliente int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) unique,
    telefone char(11)
);

alter table cliente
add column nascimento char (8);

create table Cliente_PF (
    idClientePF int primary key,
    cpf char(11) unique not null,
    foreign key (idClientePF) references Cliente(idCliente)
);

create table Cliente_PJ (
    idClientePJ int primary key,
    cnpj char(14) unique not null,
    razaoSocial varchar(255),
    foreign key (idClientePJ) references Cliente(idCliente)
);


create table Produto (
    idProduto int auto_increment primary key,
    nome varchar(100) not null,
    categoria enum('eletronico','vestimenta','brinquedos','alimentos','moveis') not null,
    preco decimal(10,2) not null,
    avaliacao float default 0
);


create table Estoque (
    idEstoque int auto_increment primary key,
    localizacao varchar(255),
    quantidade int default 0
);


create table Produto_Estoque (
    idProduto int,
    idEstoque int,
    quantidade int default 0,
    primary key (idProduto, idEstoque),
    foreign key (idProduto) references Produto(idProduto),
    foreign key (idEstoque) references Estoque(idEstoque)
);


create table Fornecedor (
    idFornecedor int auto_increment primary key,
    nome varchar(100) not null,
    cnpj char(14) unique not null
);


create table Produto_Fornecedor (
    idProduto int,
    idFornecedor int,
    primary key (idProduto, idFornecedor),
    foreign key (idProduto) references Produto(idProduto),
    foreign key (idFornecedor) references Fornecedor(idFornecedor)
);


create table Vendedor (
    idVendedor int auto_increment primary key,
    nome varchar(100) not null,
    cnpj char(14) unique,
    cpf char(11) unique,
    contato varchar(50)
);


create table Produto_Vendedor (
    idProduto int,
    idVendedor int,
    quantidade int default 0,
    primary key (idProduto, idVendedor),
    foreign key (idProduto) references Produto(idProduto),
    foreign key (idVendedor) references Vendedor(idVendedor)
);


create table Pedido (
    idPedido int auto_increment primary key,
    idCliente int not null,
    dataEmissao date not null,
    status enum('cancelado','confirmado','em processamento') default 'em processamento',
    valorTotal decimal(10,2),
    foreign key (idCliente) references Cliente(idCliente)
);


create table Pedido_Produto (
    idPedido int,
    idProduto int,
    quantidade int default 1,
    primary key (idPedido, idProduto),
    foreign key (idPedido) references Pedido(idPedido),
    foreign key (idProduto) references Produto(idProduto)
);


create table Pagamento (
    idPagamento int auto_increment primary key,
    tipo enum('boleto','cartao','pix','dois_cartoes'),
    limiteDisponivel decimal(10,2)
);


create table Pedido_Pagamento (
    idPedido int,
    idPagamento int,
    primary key (idPedido, idPagamento),
    foreign key (idPedido) references Pedido(idPedido),
    foreign key (idPagamento) references Pagamento(idPagamento)
);


create table Entrega (
    idEntrega int auto_increment primary key,
    idPedido int unique,
    status enum('aguardando','enviado','entregue','cancelado') default 'aguardando',
    codigoRastreio varchar(50) unique,
    foreign key (idPedido) references Pedido(idPedido)
);

