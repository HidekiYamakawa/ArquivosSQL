1-
Visões fornecem um nível de segurança adicional para a tabela, restringindo o
acesso a um conjunto de colunas pré-determinadas;
Esconder a complexidade dos dados (união de várias tabelas);
Simplificar comandos do usuário (união de várias tabelas); 

2-
a)
CREATE TABLE DEPTO(
    cod_depto integer,
    desc_depto varchar(30),
    CONSTRAINT pk_cod_depto PRIMARY KEY (cod_depto)
);
create sequence sequence_dpto;
insert into DEPTO(cod_depto,desc_depto) values
    (nextval('sequence_dpto'),'Compras'),
    (nextval('sequence_dpto'),'Vendas'),
    (nextval('sequence_dpto'),'Producao'),
    (nextval('sequence_dpto'),'Contabilidade'),
    (nextval('sequence_dpto'),'Financeiro'),
    (nextval('sequence_dpto'),'Professor');

b)
CREATE TABLE PESSOA(
    cod_pessoa integer,
    cod_depto integer,
    desc_pessoa varchar(50),
    CONSTRAINT pk_cod_pessoa PRIMARY KEY (cod_pessoa),
    CONSTRAINT fk_cod_depto FOREIGN KEY (cod_depto) REFERENCES DEPTO(cod_depto)
);
create sequence sequence_psoa;
insert into PESSOA(cod_pessoa,cod_depto,desc_pessoa) values
    (nextval('sequence_psoa'),1,'Fer'),
    (nextval('sequence_psoa'),2,'Lucas'),
    (nextval('sequence_psoa'),3,'Taco'),
    (nextval('sequence_psoa'),4,'Felps'),
    (nextval('sequence_psoa'),5,'Fallen');

c)
ALTER TABLE PESSOA ADD COLUMN DT_NASC DATE;

UPDATE PESSOA SET DT_NASC = '1996-04-23' WHERE cod_pessoa = 1;
UPDATE PESSOA SET DT_NASC = '2000-12-29' WHERE cod_pessoa = 2;
UPDATE PESSOA SET DT_NASC = '1989-01-04' WHERE cod_pessoa = 3;
UPDATE PESSOA SET DT_NASC = '1999-07-13' WHERE cod_pessoa = 4;
UPDATE PESSOA SET DT_NASC = '1991-05-30' WHERE cod_pessoa = 5;

d)
create view pessoa_departamento as
    select desc_pessoa,dt_nasc
    from PESSOA, DEPTO
    where date_part('month',dt_nasc)=9
    order by desc_pessoa,dt_nasc;
    
    select distinct * from pessoa_departamento;

e)
create view pessoa_departamento as
    select desc_pessoa,desc_depto
    from PESSOA, DEPTO
    where pessoa.cod_depto=depto.cod_depto
    order by desc_pessoa,desc_depto;
    
    select * from pessoa_departamento;

f)
create view pessoa_decrescente as
	select desc_pessoa
    from PESSOA
    order by desc_pessoa desc;
    
    select * from pessoa_decrescente;

g)




CREATE TABLE PESSOA(
    cod_pessoa integer,
    cod_depto integer,
    desc_pessoa varchar(50),
    CONSTRAINT pk_cod_pessoa PRIMARY KEY (cod_pessoa),
    CONSTRAINT fk_cod_depto FOREIGN KEY (cod_depto) REFERENCES DEPTO(cod_depto)
);

CREATE TABLE DEPTO(
    cod_depto integer,
    desc_depto varchar(30),
    CONSTRAINT pk_cod_depto PRIMARY KEY (cod_depto)
);

create sequence sequence_dpto;
insert into DEPTO(cod_depto,desc_depto) values
	(nextval('sequence_dpto'),'Compras'),
    (nextval('sequence_dpto'),'Vendas'),
    (nextval('sequence_dpto'),'Producao'),
    (nextval('sequence_dpto'),'Contabilidade'),
    (nextval('sequence_dpto'),'Financeiro'),
    (nextval('sequence_dpto'),'Professor');
    
create sequence sequence_psoa;
insert into PESSOA(cod_pessoa,cod_depto,desc_pessoa) values
	(nextval('sequence_psoa'),1,'Fer'),
    (nextval('sequence_psoa'),2,'Lucas'),
    (nextval('sequence_psoa'),3,'Taco'),
    (nextval('sequence_psoa'),4,'Felps'),
    (nextval('sequence_psoa'),5,'Fallen');
    
    
ALTER TABLE PESSOA ADD COLUMN DT_NASC DATE;

UPDATE PESSOA SET DT_NASC = '1996-04-23' WHERE cod_pessoa = 1;
UPDATE PESSOA SET DT_NASC = '2000-12-29' WHERE cod_pessoa = 2;
UPDATE PESSOA SET DT_NASC = '1989-09-04' WHERE cod_pessoa = 3;
UPDATE PESSOA SET DT_NASC = '1999-07-13' WHERE cod_pessoa = 4;
UPDATE PESSOA SET DT_NASC = '1991-05-30' WHERE cod_pessoa = 5;

    
create view aniversariantes as
    select desc_pessoa,dt_nasc
    from PESSOA, DEPTO
    where date_part('month',dt_nasc)=9
    order by desc_pessoa,dt_nasc;
    
    select distinct * from aniversariantes;

create view pessoa_departamento as
	select desc_pessoa,desc_depto
    from PESSOA, DEPTO
    where pessoa.cod_depto=depto.cod_depto
    order by desc_pessoa,desc_depto;
    
    select * from pessoa_departamento;
    
create view pessoa_decrescente as
	select desc_pessoa
    from PESSOA
    order by desc_pessoa desc;
    
    select * from pessoa_decrescente;
    
create view departamento_vazio as
	select desc_depto
    from DEPTO, PESSOA
    where pessoa.cod_depto!=depto.cod_depto
    
create view departamento_preenchido as
	select desc_depto
    from DEPTO, PESSOA
    where pessoa.cod_depto=depto.cod_depto

    

