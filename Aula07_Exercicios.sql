create table genero(
 id numeric(5) not null,
nome varchar(100),
 constraint genero_pkey primary key (id)
); 

create table filme(
 id numeric(5) not null,
nome varchar(100), duracao
varchar(100), sinopse
varchar(2000), genero
numeric(5),
 data timestamp,
 constraint pk_genero primary key (id), constraint fk_genero_filme
foreign key (genero) references genero (id) on update no action on
delete no action
);

insert into genero values (nextval('seq_genero'),'drama');
insert into genero values (nextval('seq_genero'),'comedia');
insert into genero values (nextval('seq_genero'),'terror'); 
insert into genero values (nextval('seq_genero'),'romance');
insert into genero values (nextval('seq_genero'),'suspense');

insert into filme values (1,'os outros','90 min','aaaaaaaaaaaa',5,'2006/08/15');
insert into filme values (2,'duplex','120 min','aaaaaaaaaaaa',2,'2001/08/15');
insert into filme values (3,'click','100 min','aaaaaaaaaaaa',2,'2005/08/15'); 
insert into filme values (4,'o piano','90 min','aaaaaaaaaaaa',1,'2005/06/12'); 

CREATE FUNCTION abc (varchar)
RETURNS NUMERIC AS
'
	SELECT id from genero where nome=$1;
'
LANGUAGE 'sql';

SELECT abc('comedia');




CREATE FUNCTION ex2 (integer,varchar)
RETURNS VARCHAR AS
'
	insert into genero values ($1,$2);
	SELECT nome FROM genero where id=$1;
'
LANGUAGE 'sql';

SELECT ex2(6,'aventura');


CREATE SEQUENCE seq_genero;
drop table genero cascade;
drop sequence seq_genero;
select * from genero;
CREATE FUNCTION ex4 (bigint,varchar)
RETURNS VARCHAR AS
'
	insert into genero values ($1,$2);
	SELECT nome FROM genero where id=$1;
'
LANGUAGE 'sql';

SELECT ex4(nextval('seq_genero'),'ação');


CREATE FUNCTION ex5 (numeric)
RETURNS VARCHAR AS
'
	DELETE FROM genero WHERE id=$1;
	SELECT nome FROM genero WHERE id=$1;
'
LANGUAGE 'sql';

SELECT ex5(7);


CREATE FUNCTION ex6 (varchar)
RETURNS VARCHAR AS
'
	DELETE FROM genero WHERE nome=$1;
	SELECT nome FROM genero WHERE nome=$1;
'
LANGUAGE 'sql';

SELECT ex6('ação');