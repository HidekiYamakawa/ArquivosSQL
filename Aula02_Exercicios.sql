create table Proprietario(
    codigo integer,
    nome varchar(50) not null,
    cpf varchar(11) unique,
    sexo char check(sexo='M' or sexo='F'),
    idade integer check(idade>21 and idade<80),
    telefone varchar(11) not null,
    Constraint codigo_propk primary key(codigo)
);

create sequence sequence_prop;

drop table Aluguel;
drop table Corretor;
drop table Inquilino;
drop table Imovel;
drop table Proprietario;

insert into Proprietario(codigo,nome,cpf,sexo,idade,telefone) values
	(1,'Carlos','48430816801','M',22,'1147213423'),
    (2,'Hideki','73047238972','M',48,'1183472591'),
    (3,'Patricia','73287502493','F',40,'1145820520');
    
insert into Proprietario(codigo,nome,cpf,sexo,idade,telefone) values
	(nextval('sequence_prop'),'Carlos','48430816801','M',22,'1147213423'),
    (nextval('sequence_prop'),'Hideki','73047238972','M',48,'1183472591'),
    (nextval('sequence_prop'),'Patricia','73287502493','F',40,'1145820520'),
    (nextval('sequence_prop'),'Jose','82904802483','M',42,'1149356019'),
    (nextval('sequence_prop'),'Maria','47289523609','F',34,'1146349254');
    
    select * from Proprietario

create table Imovel(
    codigo integer,
    endereco varchar(100) not null,
    descricao varchar(100) not null,
    valor_aluguel numeric(5,2) check(valor_aluguel>500),
    tipo varchar(11) check(tipo in ('residencial','comercial')),
    status varchar(10) check(status in ('alugado','livre','em reforma')),
    proprietario integer,
    Constraint codigo_imopk primary key(codigo),
    Constraint proprietariofk foreign key(proprietario) 
    	references Proprietario(codigo) ON DELETE CASCADE ON UPDATE CASCADE 
);

create sequence sequence_imov;

insert into Imovel(codigo,endereco,descricao,valor_aluguel,tipo,status,proprietario) values
	(1,'Av. Marcus de Janeiro','Novinho em folha',670.00,'residencial','livre',3),
    (2,'Rod. Eng. Cand. do Rego Chaves','Caindo aos pedaços, mas tem uma vista ótima',520.00,'residencial','em reforma',2),
    (3,'Jesus Street','Grande porém um pouco pequeno',560.00,'comercial','alugado',1);
    
insert into Imovel(codigo,endereco,descricao,valor_aluguel,tipo,status,proprietario) values
	(nextval('sequence_imov'),'Av. Marcus de Janeiro','Novinho em folha',670.00,'residencial','livre',3),
    (nextval('sequence_imov'),'Rod. Eng. Cand. do Rego Chaves','Caindo aos pedaços, mas tem uma vista ótima',520.00,'residencial','em reforma',2),
    (nextval('sequence_imov'),'Jesus Street','Grande porém um pouco pequeno',560.00,'comercial','alugado',1),
    (nextval('sequence_imov'),'Rua Atilio Guimaraes','Localização perfeita, mas não muito boa',620.00,'comercial','livre',4),
	(nextval('sequence_imov'),'Rua São Sebastião do Reino','Lindo porém um pouco feio',580.00,'comercial','livre',5);
    

create table Inquilino(
    codigo integer,
    nome varchar(50) not null,
    cpf varchar(11) unique,
    sexo char check(sexo='M' or sexo='F'),
	idade integer check(idade>21 and idade<80),
    telefone varchar(11) not null,
    Constraint codigo_inqpk primary key(codigo)
);

create sequence sequence_inqu;

insert into Inquilino(codigo,nome,cpf,sexo,idade,telefone) values
	(1,'Pedro','43789630941','M',30,'1174923054'),
    (2,'Mitinari','38540102394','M',53,'1134244729'),
    (3,'Natalia','29836502305','F',22,'1146739506');
	
insert into Inquilino(codigo,nome,cpf,sexo,idade,telefone) values
	(nextval('sequence_inqu'),'Pedro','43789630941','M',30,'1174923054'),
	(nextval('sequence_inqu'),'Mitinari','38540102394','M',53,'1134244729'),
	(nextval('sequence_inqu'),'Natalia','29836502305','F',22,'1146739506'),
	(nextval('sequence_inqu'),'Mayumi','42314342123','F',43,'1136254864'),
	(nextval('sequence_inqu'),'Yukio','23543982343','M',49,'1143573923');

create table Corretor(
    codigo integer,
    nome varchar(50) not null,
    cpf varchar(11) unique,
    sexo char check(sexo='M' or sexo='F'),
    dt_nascimento date,
    telefone varchar(11) not null,
    creci varchar(10) not null unique,
    Constraint codigo_corpk primary key(codigo)
);

create sequence sequence_corr;

insert into Corretor(codigo,nome,cpf,sexo,dt_nascimento,telefone,creci) values
	(1,'Yamamoto','73825268093','M','1989-03-04','1138925732','3215433532'),
    (2,'Yamaguchi','34202384720','F','1983-07-23','1145981243','2891467123'),
    (3,'Yamakawa','28932789354','M','1993-12-29','1109454321','7123895260');
	
insert into Corretor(codigo,nome,cpf,sexo,dt_nascimento,telefone,creci) values
	(nextval('sequence_corr'),'Yamamoto','73825268093','M','1989-03-04','1138925732','3215433532'),
	(nextval('sequence_corr'),'Yamaguchi','34202384720','F','1983-07-23','1145981243','2891467123'),
	(nextval('sequence_corr'),'Yamakawa','28932789354','M','1993-12-29','1109454321','7123895260'),
	(nextval('sequence_corr'),'Yamada','4321513546','M','1972-05-21','1135202848','2315576481'),
	(nextval('sequence_corr'),'Fukuda','3251565237','F','1995-01-10','1165406703','1857257393');

create table Aluguel(
    imovel integer,
    inquilino integer,
    corretor integer,
    dt_aluguel date not null,
    dt_vencimento date not null,
    valor_final_aluguel numeric(10,2) check(valor_final_aluguel>600),
    Constraint codigo_alupk primary key(imovel,inquilino,corretor),
    Constraint imovelfk foreign key(imovel)
    	references Imovel(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    Constraint inquilinofk foreign key(inquilino)
    	references Inquilino(codigo),
    Constraint corretorfk foreign key(corretor)
    	references Corretor(codigo)
);

insert into Aluguel(imovel,inquilino,corretor,dt_aluguel,dt_vencimento,valor_final_aluguel) values
	(1,1,1,'2015-01-01','2017-12-31',24120.00),
	(2,2,2,'2014-04-16','2018-04-16',35000.00),
	(3,3,3,'2012-09-23','2020-09-23',70000.00),
	(4,4,4,'2015-11-25','2017-08-25',25000.00),
	(5,5,5,'2016-06-15','2016-10-15',8000.00);
    
    
create table Proprietario2(
    codigo integer,
    nome varchar(50) not null,
    cpf varchar(11) unique,
    site varchar(200),
    sexo char check(sexo='M' or sexo='F'),
    idade integer check(idade>21 and idade<80),
    telefone varchar(11) not null,
    Constraint codigo_pro2pk primary key(codigo)
);


insert into Proprietario2(codigo,nome,cpf,site,sexo,idade,telefone) (select codigo,nome,cpf,'www.google.com',
                                                                     sexo,idade,telefone from Proprietario);
select * from Proprietario2
    
create table Imovel2(
    codigo integer,
    endereco varchar(100) not null,
    descricao varchar(100) not null,
    matricula varchar(100),
    valor_aluguel numeric(5,2) check(valor_aluguel>500),
    tipo varchar(11) check(tipo in ('residencial','comercial')),
    status varchar(10) check(status in ('alugado','livre','em reforma')),
    proprietario integer,
    Constraint codigo_imo2pk primary key(codigo),
    Constraint proprietariofk foreign key(proprietario) 
    	references Proprietario(codigo) ON DELETE CASCADE ON UPDATE CASCADE 
);

insert into Imovel2(codigo,endereco,descricao,matricula,valor_aluguel,tipo,status,proprietario)
	(select codigo,endereco,descricao,'3214567890',valor_aluguel,tipo,status,proprietario from Imovel);
    
    select * from Imovel2
	
	
	
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

create sequence sequence_prod;
insert into Produto(codigo,nome,descricao,cod_fornecedor,cod_categoria) values
	(nextval('sequence_prod'),'Mesa','Feita da melhor madeira',2,4),
	(nextval('sequence_prod'),'Coca-Cola','O melhor refrigerante',1,1),
	(nextval('sequence_prod'),'Processador i7 4770k','Um dos mais potentes processadores',5,3),
	(nextval('sequence_prod'),'Fifa','O melhor jogo de Futebol',4,2),
	(nextval('sequence_prod'),'CSGO','Melhor jogo FPS competitivo',3,2),
	(nextval('sequence_prod'),'Monitor 19 LCD','Melhor resolução dos monitores',6,3);

create table Fornecedor(
	codigo integer,
	razao_social varchar(100),
	telefone varchar(11),
	Constraint codigo_fornpk primary key(codigo)
);

create sequence sequence_forn;
insert into Fornecedor(codigo,razao_social,telefone) values
	(nextval('sequence_forn'),'Coca-Cola Indústrias Ltda','1143259382'),
	(nextval('sequence_forn'),'Madereira','1148275019'),
	(nextval('sequence_forn'),'Valve','1140183018'),
	(nextval('sequence_forn'),'EA','1146910910'),
	(nextval('sequence_forn'),'Intel','1140581234'),
	(nextval('sequence_forn'),'LG','1142434632');

create table Categoria(
	codigo integer,
	nome varchar(100),
	Constraint codigo_catepk primary key(codigo)
);

create sequence sequence_cate;
insert into Categoria(codigo,nome) values
	(nextval('sequence_cate'),'Bebida'),
	(nextval('sequence_cate'),'Jogo'),
	(nextval('sequence_cate'),'Tecnologia'),
	(nextval('sequence_cate'),'Marcenaria'),
	(nextval('sequence_cate'),'Comida'),
	(nextval('sequence_cate'),'Papelaria');
	
	select * from Produto