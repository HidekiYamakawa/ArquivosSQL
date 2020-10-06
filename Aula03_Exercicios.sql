1-
insert into Proprietario(codigo,nome,cpf,sexo,idade,telefone) values
    (nextval('sequence_prop'),'Carlos','48430816801','M',22,'1147213423'),
    (nextval('sequence_prop'),'Hideki','73047238972','M',48,'1183472591'),
    (nextval('sequence_prop'),'Patricia','73287502493','F',40,'1145820520'),
    (nextval('sequence_prop'),'Jose','82904802483','M',42,'1149356019'),
    (nextval('sequence_prop'),'Maria','47289523609','F',34,'1146349254');

insert into Imovel(codigo,endereco,descricao,valor_aluguel,tipo,status,proprietario) values
    (nextval('sequence_imov'),'Av. Marcus de Janeiro','Novinho em folha',670.00,'residencial','livre',3),
    (nextval('sequence_imov'),'Rod. Eng. Cand. do Rego Chaves','Caindo aos pedaços, mas tem uma vista ótima',520.00,'residencial','em reforma',2),
    (nextval('sequence_imov'),'Jesus Street','Grande porém um pouco pequeno',560.00,'comercial','alugado',1),
    (nextval('sequence_imov'),'Rua Atilio Guimaraes','Localização perfeita, mas não muito boa',620.00,'comercial','livre',4),
    (nextval('sequence_imov'),'Rua São Sebastião do Reino','Lindo porém um pouco feio',580.00,'comercial','livre',5);

insert into Inquilino(codigo,nome,cpf,sexo,idade,telefone) values
	(nextval('sequence_inqu'),'Pedro','43789630941','M',30,'1174923054'),
	(nextval('sequence_inqu'),'Mitinari','38540102394','M',53,'1134244729'),
	(nextval('sequence_inqu'),'Natalia','29836502305','F',22,'1146739506'),
	(nextval('sequence_inqu'),'Mayumi','42314342123','F',43,'1136254864'),
	(nextval('sequence_inqu'),'Yukio','23543982343','M',49,'1143573923');

insert into Corretor(codigo,nome,cpf,sexo,dt_nascimento,telefone,creci) values
	(nextval('sequence_corr'),'Yamamoto','73825268093','M','1989-03-04','1138925732','3215433532'),
	(nextval('sequence_corr'),'Yamaguchi','34202384720','F','1983-07-23','1145981243','2891467123'),
	(nextval('sequence_corr'),'Yamakawa','28932789354','M','1993-12-29','1109454321','7123895260'),
	(nextval('sequence_corr'),'Yamada','4321513546','M','1972-05-21','1135202848','2315576481'),
	(nextval('sequence_corr'),'Fukuda','3251565237','F','1995-01-10','1165406703','1857257393');

insert into Aluguel(imovel,inquilino,corretor,dt_aluguel,dt_vencimento,valor_final_aluguel) values
	(1,1,1,'2015-01-01','2017-12-31',24120.00),
	(2,2,2,'2014-04-16','2018-04-16',35000.00),
	(3,3,3,'2012-09-23','2020-09-23',70000.00),
	(4,4,4,'2015-11-25','2017-08-25',25000.00),
	(5,5,5,'2016-06-15','2016-10-15',8000.00);


2-
create table Fornecedor(
	codigo integer,
	razao_social varchar(100),
	telefone varchar(11),
	Constraint codigo_fornpk primary key(codigo)
);

create table Categoria(
	codigo integer,
	nome varchar(100),
	Constraint codigo_catepk primary key(codigo)
);

create table Produto(
	codigo integer,
	nome varchar(100),
	descricao varchar(100),
	cod_fornecedor integer,
	cod_categoria integer,
	Constraint codigo_prodpk primary key(codigo),
	Constraint cod_fornecedorfk foreign key(cod_fornecedor)
		references Fornecedor(codigo),
	Constraint cod_categoriapk foreign key(cod_categoria)
		references Categoria(codigo)
);


3-
create sequence sequence_forn;
insert into Fornecedor(codigo,razao_social,telefone) values
	(nextval('sequence_forn'),'Coca-Cola Indústrias Ltda','1143259382'),
	(nextval('sequence_forn'),'Madereira','1148275019'),
	(nextval('sequence_forn'),'Valve','1140183018'),
	(nextval('sequence_forn'),'EA','1146910910'),
	(nextval('sequence_forn'),'Intel','1140581234'),
	(nextval('sequence_forn'),'LG','1142434632');

create sequence sequence_cate;
insert into Categoria(codigo,nome) values
	(nextval('sequence_cate'),'Bebida'),
	(nextval('sequence_cate'),'Jogo'),
	(nextval('sequence_cate'),'Tecnologia'),
	(nextval('sequence_cate'),'Marcenaria'),
	(nextval('sequence_cate'),'Comida'),
	(nextval('sequence_cate'),'Papelaria');

create sequence sequence_prod;
insert into Produto(codigo,nome,descricao,cod_fornecedor,cod_categoria) values
	(nextval('sequence_prod'),'Mesa','Feita da melhor madeira',2,4),
	(nextval('sequence_prod'),'Coca-Cola','O melhor refrigerante',1,1),
	(nextval('sequence_prod'),'Processador i7 4770k','Um dos mais potentes processadores',5,3),
	(nextval('sequence_prod'),'Fifa','O melhor jogo de Futebol',4,2),
	(nextval('sequence_prod'),'CSGO','Melhor jogo FPS competitivo',3,2),
	(nextval('sequence_prod'),'Monitor 19 LCD','Melhor resolução dos monitores',6,3);


4-


