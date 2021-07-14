select venda_id,descricao,fabricante,z.nome,r.nome,valor_total,data_venda from carrinho a inner join produto b on a.produto_id = b.id inner join cliente r on a.cliente_id = r.id inner join vendedor z on a.vendedor_id = z.id;

select venda_id,descricao,fabricante,nome,valor_total,data_venda from carrinho a inner join produto b on a.produto_id = b.id inner join cliente r on a.cliente_id = r.id;

select descricao,fabricante,valorproduto,qnt_estoque FROM produto INNER JOIN produto_estoque on id = idproduto;

select id,descricao,fabricante,valorproduto,qnt_estoque FROM produto INNER JOIN produto_estoque on id = idproduto order by id;

select nome,email,endereco,cidade,estado,pais from cliente INNER JOIN tabela_endereco on id = idendereco;

insert into tabela_endereco (idendereco,endereco,cidade,estado,pais) values (1,'Av, Pres Costa e Silva 1266 59614-000','Mossoró','RN','Brasil');

insert into cliente (id,nome,email) values (1,'Silveira','silveira@gmail.com');

insert into vendedor (id,nome,email) values (1,'Phillipe','pitagpg@gmail.com');

insert into produto (id,descricao,fabricante) values (1,'Placa de Video GTX1660 6GB','NVIDIA');
insert into produto (id,descricao,fabricante) values (2,'Placa de Video GTX1060 4GB','NVIDIA');
insert into produto (id,descricao,fabricante) values (3,'Placa de Video RX580 4GB','AMD RADEON');
insert into produto (id,descricao,fabricante) values (4,'Placa de Video RX470 4GB','AND RADEON');
insert into produto (id,descricao,fabricante) values (5,'Placa de Video GTX960 4GB','NVIDIA');

insert into produto_estoque (idproduto,valorproduto,qnt_estoque) values (5,929.00,6); 
insert into produto_estoque (idproduto,valorproduto,qnt_estoque) values (4,1529.00,3); 
insert into produto_estoque (idproduto,valorproduto,qnt_estoque) values (3,1329.00,3); 
insert into produto_estoque (idproduto,valorproduto,qnt_estoque) values (2,1500.00,4); 
insert into produto_estoque (idproduto,valorproduto,qnt_estoque) values (1,2.5000,4); 


insert into carrinho (vendedor_id,cliente_id,produto_id,venda_id,data_venda,valor_total) values (1,1,5,1,'2021-07-08 21:44:00-07',929.00);

create table tabela_endereco (
	cliente_id bigint references cliente(id) not null primary key,
	endereco varchar(250) not null,
	cidade varchar(250) not null,
	estado varchar(250) not null,
	pais varchar(250) not null 
);

create table cliente (
	id bigint not null primary key,
	nome varchar(80) not null,
	email varchar(80) not null
	);

create table vendedor (
	id bigint not null primary key,
	nome varchar(80) not null,
	email varchar(80) not null
	);

create table produto (
	id bigint not null primary key,
	descricao varchar(80) not null,
	fabricante varchar(80) not null
);

create table produto_estoque (
	idproduto bigint references produto(id) not null,
	valorproduto numeric (10,2),
	qnt_estoque bigint not null
);

alter table produto_estoque ADD primary key (idproduto); 


create table carrinho (
	vendedor_id bigint references vendedor(id) not null,
	cliente_id bigint references cliente(id) not null,
	produto_id bigint references produto(id) not null,
	venda_id serial primary key not null,
	data_venda timestamp,
	valor_total numeric(10,2) null
);

alter table carrinho ADD qntd_venda bigint null;

update carrinho set qntd_venda = 1 where venda_id = 1;
