create table sedes(
	id numeric(10),
	nome varchar(50) not null,
	endereco varchar(50) not null,
	telefone varchar(20) not null,
	nomeGerente varchar(50) not null,
	multa numeric(10,2) not null,
	constraint pk_sedes primary key (id)
);

create table clientes(
	id numeric(10),
	nome varchar(50) not null,
	cnh varchar(20) not null,
	validadeCnh date not null,
	categoriaCnh varchar(3) not null,
	constraint pk_clientes primary key (id)
);

create table classesCarro(
	id numeric(10),
	-- campo nome: popular; luxo; super luxo
	nome varchar(20) not null,
	valorDiario numeric(10,2) not null,
	constraint pk_classesCarro primary key (id)
);

create table carros(
	id numeric(10),
	placa varchar(10) not null,
	modelo varchar(40) not null,
	ano varchar(9) not null,
	cor varchar(20) not null,
	quilometragem numeric(10,2)not null,
	descricao varchar(100) not null,
	-- campo situacao:alugado; disponivel; fora do ponto de origem
	situacao varchar(30) not null,
	origemCarro numeric(10) not null,
	localizacaoCarro numeric(10) not null,
	classeCarro numeric(10) not null,
	constraint pk_carros primary key(id),
	constraint fk_carros_sedeOrigem foreign key (origemCarro) 
    references sedes(id),
	constraint fk_carros_sedeLocAtual foreign key (localizacaoCarro) 
    references sedes(id),
	constraint fk_carros_classe foreign key (classeCarro) 
    references classesCarro(id)
);

create table reservas(
	id numeric(10),
	--campo diarais = quantidade de diarias
	diarias numeric(10)not null,
	dataLocacao date not null,
	dataRetorno date,
	quilometrosRodados numeric(10,2),
	multa numeric(10,2),
	--campo situação: finalizada; em aberto
	situacao varchar(15) not null,
	total numeric(10,2),
	carroReserva numeric(10) not null,
	clienteReserva numeric(10) not null,
	sedeLocacao numeric(10) not null,
	sedeDevolucao numeric(10),
	constraint pk_reservas primary key (id),
	constraint fk_reservas_sedesLocacao
	foreign key (sedeLocacao) 
    references sedes(id),
	constraint fk_reservas_sedesDevolucao foreign key (sedeDevolucao) 
    references sedes(id),
	constraint fk_reservas_carros foreign key (carroReserva) 
    references carros(id),
	constraint fk_reservas_clientes foreign key (clienteReserva) 
    references clientes(id)
);

CREATE SEQUENCE seq_sedes;
CREATE SEQUENCE seq_clientes;
CREATE SEQUENCE seq_classesC;
CREATE SEQUENCE seq_carros;
CREATE SEQUENCE seq_reservas;



INSERT INTO sedes(id,nome,endereco,telefone,nomeGerente,multa) values
(nextval('seq_sedes'),'Sede A','Rua A','11 4711-1111','Gerente A',200.00),
(nextval('seq_sedes'),'Sede B','Rua B','11 4711-2222','Gerente B',250.00);

INSERT INTO clientes(id,nome,cnh,validadeCnh,categoriaCnh) values
(nextval('seq_clientes'),'Carlos','11111111111','2020-06-20','A'),
(nextval('seq_clientes'),'Hideki','22222222222','2024-12-05','AB');

INSERT INTO classesCarro(id,nome,valorDiario) values
(nextval('seq_classesC'),'Popular',100.00),
(nextval('seq_classesC'),'Luxo',150.00),
(nextval('seq_classesC'),'Super Luxo',200.00);

INSERT INTO carros(id,placa,modelo,ano,cor,quilometragem,descricao,situacao,origemCarro,localizacaoCarro,classeCarro) values
(nextval('seq_carros'),'AAA1111','Uno','2018','Branco','30000','Flex','disponivel',
(select id from sedes where nome='Sede A'),
(select id from sedes where nome='Sede A'),
(select id from classesCarro where nome='Popular')),
(nextval('seq_carros'),'BBB2222','HRV','2017','Cinza','25000','Flex','disponivel',
(select id from sedes where nome='Sede B'),
(select id from sedes where nome='Sede B'),
(select id from classesCarro where nome='Luxo')),
(nextval('seq_carros'),'CCC3333','Model S','2019','Preto','10000','Gasolina','disponivel',
(select id from sedes where nome='Sede A'),
(select id from sedes where nome='Sede A'),
(select id from classesCarro where nome='Super Luxo'));

INSERT INTO reservas(id,diarias,dataLocacao,dataRetorno,quilometrosRodados,multa,situacao,total,carroReserva,clienteReserva,sedeLocacao,sedeDevolucao) values
(nextval('seq_reservas'),3,'2019-11-12',null,null,null,'em aberto',null,
(select id from carros where placa='AAA1111'),
(select id from clientes where nome='Carlos'),
(select localizacaoCarro from carros where placa='AAA1111'),
(select id from sedes where nome='Sede A')),
(nextval('seq_reservas'),5,'2019-11-12',null,null,null,'em aberto',null,
(select id from carros where placa='CCC3333'),
(select id from clientes where nome='Hideki'),
(select localizacaoCarro from carros where placa='CCC3333'),
(select id from sedes where nome='Sede B'));

CREATE OR REPLACE FUNCTION func_attkm()
RETURNS trigger AS
'
	BEGIN
		UPDATE carros set quilometragem=NEW.quilometrosRodados where id=NEW.carroReserva;
        RETURN NEW;
	END;
'
Language 'plpgsql'; 

CREATE TRIGGER func_attkm AFTER update ON reservas
 FOR EACH ROW EXECUTE PROCEDURE func_attkm();
 
select * from reservas;

 UPDATE reservas set dataRetorno='2019-11-15',quilometrosRodados=30500,multa=0,total=300,situacao='finalizada' 
 where carroReserva=(select id from carros where placa='AAA1111');
 
 
CREATE OR REPLACE FUNCTION func_restringir_aluguel()
RETURNS trigger AS
'
	BEGIN
		IF (select situacao from carros where id=NEW.carroReserva)=''alugado'' THEN
        RAISE EXCEPTION ''Carro ja esta Alugado'';
        END IF;
        
        IF (select situacao from carros where id=NEW.carroReserva)=''fora do ponto de origem'' THEN
        RAISE EXCEPTION ''Carro esta fora do ponto de origem'';
        END IF;
        
        IF (select situacao from carros where id=NEW.carroReserva)=''disponivel'' THEN
        UPDATE carros SET situacao=''alugado'' where id=NEW.carroReserva;
        END IF;
        RETURN NEW;
	END;
'
Language 'plpgsql'; 

CREATE TRIGGER func_restringir_aluguel BEFORE INSERT ON reservas
 FOR EACH ROW EXECUTE PROCEDURE func_restringir_aluguel();
 
 select * from reservas;
 select * from carros;
 
 INSERT INTO reservas(id,diarias,dataLocacao,dataRetorno,quilometrosRodados,multa,situacao,total,carroReserva,clienteReserva,sedeLocacao,sedeDevolucao) values
(nextval('seq_reservas'),4,'2019-11-26',null,null,null,'em aberto',null,
(select id from carros where placa='BBB2222'),
(select id from clientes where nome='Carlos'),
(select localizacaoCarro from carros where placa='BBB2222'),
(select id from sedes where nome='Sede A'));


CREATE OR REPLACE FUNCTION func_devolucao()
RETURNS trigger AS
'
	BEGIN        
        
        IF (select origemCarro from carros where id=NEW.carroReserva)=OLD.sedeDevolucao THEN
        UPDATE carros SET situacao=''disponivel'' where id=NEW.carroReserva;
        UPDATE carros SET localizacaoCarro=origemCarro where id=NEW.carroReserva;
        END IF;
        
        IF (select origemCarro from carros where id=NEW.carroReserva)!=OLD.sedeDevolucao THEN
        UPDATE carros SET situacao=''fora de ponto de origem'' where id=NEW.carroReserva;
        UPDATE carros SET localizacaoCarro=OLD.sedeDevolucao where id=NEW.carroReserva;
        END IF;
        
        RETURN NEW;
	END;
'
Language 'plpgsql'; 

CREATE TRIGGER func_devolucao AFTER UPDATE ON reservas
 FOR EACH ROW EXECUTE PROCEDURE func_devolucao();
 
  UPDATE reservas set dataRetorno='2019-11-30',quilometrosRodados=32450,multa=0,total=600,situacao='finalizada' 
 where carroReserva=(select id from carros where placa='BBB2222');
 
 
 CREATE VIEW estatisticas AS
 SELECT c.modelo,c.placa,r.quilometrosRodados,count(r.carroReserva),avg(r.quilometrosRodados)
 FROM carros as c, reservas as r
 WHERE r.carroReserva=c.id
 GROUP BY c.modelo, c.placa, r.quilometrosRodados;
 
 SELECT * FROM estatisticas;
 