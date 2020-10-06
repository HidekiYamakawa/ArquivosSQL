create table Cliente(
    idcliente integer,
    nome varchar(50),
    Constraint idclientepk primary key(idcliente)
);
create table Tipo_filme(
    idtipo integer,
    descricao varchar(50),
    qtd_dias_locacao integer,
    vlr_multa_dia numeric(5,2),
    Constraint idtipopk primary key(idtipo)
);
create table Filme(
    idfilme integer,
    titulo varchar(50),
    idtipo integer,
    Constraint idfilmepk primary key(idfilme),
    Constraint idtipo foreign key(idtipo) references Tipo_filme
);
create table Locacao(
    idlocacao integer,
    idcliente integer,
    idfilme integer,
    data_locacao date,
    data_prev_devolucao date,
    data_devolucao date,
    multa numeric(5,2),
    status varchar(50),
    Constraint idlocacaopk primary key(idlocacao),
    Constraint idclientefk foreign key(idcliente) references Cliente,
    Constraint idfilme foreign key(idfilme) references Filme
);

create sequence seq_cliente;
create sequence seq_tipo;
create sequence seq_filme;
create sequence seq_locacao;

insert into Cliente(idcliente,nome) values
(nextval('seq_cliente'),'Fer'),
(nextval('seq_cliente'),'Fallen'),
(nextval('seq_cliente'),'Kng'),
(nextval('seq_cliente'),'Taco'),
(nextval('seq_cliente'),'Lucas');

insert into Tipo_filme(idtipo,descricao,qtd_dias_locacao,vlr_multa_dia) values
(nextval('seq_tipo'),'Ação',5,12.00),
(nextval('seq_tipo'),'Aventura',3,10.00),
(nextval('seq_tipo'),'Comedia',2,10.00),
(nextval('seq_tipo'),'Drama',5,10.00),
(nextval('seq_tipo'),'Terror',4,10.00);

insert into Filme(idfilme,titulo,idtipo) values
(nextval('seq_filme'),'Capitão América',(select idtipo from Tipo_filme where descricao='Ação')),
(nextval('seq_filme'),'Capitã Marvel',(select idtipo from Tipo_filme where descricao='Aventura')),
(nextval('seq_filme'),'Homem de Ferro',(select idtipo from Tipo_filme where descricao='Drama')),
(nextval('seq_filme'),'Homem-Aranha',(select idtipo from Tipo_filme where descricao='Comedia')),
(nextval('seq_filme'),'Vingadores',(select idtipo from Tipo_filme where descricao='Terror'));

BEGIN WORK;
insert into Locacao(idlocacao,idcliente,idfilme,data_locacao,data_prev_devolucao,data_devolucao,multa,status) values
(nextval('seq_locacao'),1,1,'2019-01-01','2019-01-02',null,null,'Alocado'),
(nextval('seq_locacao'),1,2,'2019-01-01','2019-01-02',null,null,'Alocado'),
(nextval('seq_locacao'),1,3,'2019-01-01','2019-01-02',null,null,'Alocado');
COMMIT WORK;

select * from Locacao;


BEGIN WORK;
UPDATE Locacao set data_devolucao='2019-01-02' where idcliente=1 and idfilme=1;
UPDATE Locacao set data_devolucao='2019-01-02' where idcliente=1 and idfilme=2;
UPDATE Locacao set data_devolucao='2019-01-02' where idcliente=1 and idfilme=3;
COMMIT WORK;

select * from Filme;

BEGIN WORK;
insert into Filme(idfilme,titulo,idtipo) values
(nextval('seq_filme'),'JUMANJI',(select idtipo from Tipo_filme where descricao='Aventura'));
SAVEPOINT save;
insert into Filme(idfilme,titulo,idtipo) values
(nextval('seq_filme'),'Thor',(select idtipo from Tipo_filme where descricao='Ação'));
ROLLBACK to save;
insert into Filme(idfilme,titulo,idtipo) values
(nextval('seq_filme'),'Guardians of the Galaxy',(select idtipo from Tipo_filme where descricao='Ação'));
COMMIT WORK;



