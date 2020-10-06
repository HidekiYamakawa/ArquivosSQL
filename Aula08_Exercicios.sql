create table curso(
 id numeric(5),
 nome varchar(100) not null,
 constraint curso_pkey primary key (id)
);
create table aluno(
 rgm numeric(6),
 nome varchar(60) not null,
 curso numeric(5) not null,
 constraint pk_aluno_rgm primary key (rgm),
 constraint aluno_curso_fkey foreign key (curso) references curso (id)
on update no action on delete no action
);
create table disciplina(
 codigo numeric(6),
 nome varchar(60) not null,
 constraint pk_disciplina_codigo primary key (codigo)
);
create table tiponota(
 codigo numeric(6),
 nome varchar(60) not null check (nome in('p1', 'p2', 'exame')),
 constraint tiponota_pkey primary key (codigo)
);
create table notas(
 id numeric(5),
 rgm_aluno numeric(6),
 codigo_disciplina numeric(6),
 tipo_nota numeric(6),
 nota numeric(4,2),
 constraint notas_pkey primary key (id),
 constraint notas_codigo_disc_fkey foreign key (codigo_disciplina)
references disciplina (codigo) on update no action on delete no action,
 constraint notas_rgm_aluno_fkey foreign key (rgm_aluno)
references aluno (rgm) on update no action on delete no action,
 constraint notas_tipo_nota_fkey foreign key (tipo_nota)
references tiponota (codigo) on update no action on delete no action
);
create table situacao(
 aluno numeric(5),
 situacao varchar(100) check (situacao in('aprovado', 'reprovado', 'cursando', 'dp')),
 disciplina numeric(6) not null,
 id serial not null,
 constraint id primary key (id),
 constraint disc foreign key (disciplina) references disciplina (codigo)
on update restrict on delete restrict,
 constraint pessoa foreign key (aluno) references aluno (rgm)
on update restrict on delete restrict
);
insert into curso (id, nome) values (1, 'tds');
insert into curso (id, nome) values (2, 'sisinfo');
insert into aluno (rgm, nome, curso) values (1, 'bruno', 1);
insert into aluno (rgm, nome, curso) values (2, 'ze', 2);
insert into aluno (rgm, nome, curso) values (3, 'joao', 1);
insert into disciplina (codigo, nome) values (1, 'bd');
insert into disciplina (codigo, nome) values (2, 'ioo');
insert into tiponota (codigo, nome) values (1, 'p1');
insert into tiponota (codigo, nome) values (2, 'p2');
insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)
values (1, 1, 1, 1, 9.00);
insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)
values (2, 1, 1, 2, 7.00);
insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)
values (3, 2, 1, 1, 8.00);
insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)
values (4, 2, 1, 2, 6.00);
insert into situacao (aluno, situacao, disciplina, id)
values (1, 'aprovado', 1, 1);
insert into situacao (aluno, situacao, disciplina, id)
values (3, 'reprovado', 1, 2);


CREATE OR REPLACE FUNCTION ex1 (varchar)
RETURNS NUMERIC AS
'
	SELECT n.id
	FROM notas as n,tiponota as t
	WHERE n.tipo_nota=t.codigo AND t.nome=$1;
'
LANGUAGE 'sql';

SELECT ex1('p1');

SELECT n.id,n.nota
	FROM notas as n,tiponota as t
	WHERE n.tipo_nota=t.codigo AND t.nome='p1';
	
	
CREATE OR REPLACE FUNCTION ex2 (varchar)
RETURNS VARCHAR AS
'
	SELECT nome
	FROM tiponota
	WHERE nome=$1;
'
LANGUAGE 'sql';

SELECT ex2('p1');

CREATE OR REPLACE FUNCTION ex3 (id numeric,rgm numeric,disc numeric, t numeric,n numeric)
RETURNS VOID AS
$body$
	BEGIN
		if SELECT nome FROM tiponota WHERE nome=$4 == null then
			RAISE NOTICE 'Não existe este tipo de nota';
		else
			insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota) values ($1, $2, $3, $4, $5);
			RAISE NOTICE 'Nota registrada com sucesso';
		end if;
	END;
$body$
LANGUAGE 'plpgsql';

SELECT ex3(5,3,1,'p1',10.00);

	
	
	



CREATE OR REPLACE FUNCTION ex4 (rgm numeric,disc varchar)
RETURNS numeric AS 
'
		SELECT n.nota 
		FROM notas as n,aluno as a,disciplina as d, tiponota as t
		WHERE n.tipo_nota=t.codigo 
		AND t.nome=p1
		AND n.rgm_aluno=a.rgm 
		AND n.codigo_disciplina=d.codigo
		AND a.rgm=$1
		AND d.nome=$2;
'
LANGUAGE 'sql';

SELECT ex4(1,'bd');



CREATE OR REPLACE FUNCTION ex5 (rgm numeric,disc varchar)
RETURNS numeric AS 
'
		SELECT n.nota 
		FROM notas as n,aluno as a,disciplina as d, tiponota as t
		WHERE n.tipo_nota=t.codigo 
		AND t.nome=p1
		AND n.rgm_aluno=a.rgm 
		AND n.codigo_disciplina=d.codigo
		AND a.rgm=$1
		AND d.nome=$2;
'
LANGUAGE 'sql';

SELECT ex5(1,'bd');



CREATE OR REPLACE FUNCTION ex6 (rgm numeric,disc varchar)
RETURNS numeric AS 
$body$
	BEGIN
		SELECT n.nota 
		FROM notas as n,aluno as a,disciplina as d
		AND n.rgm_aluno=a.rgm 
		AND n.codigo_disciplina=d.codigo
		AND a.rgm=$1
		AND d.nome=$2;
		
		RETURN();
	END;
$body$
LANGUAGE 'sql';

SELECT ex6(1,'bd');