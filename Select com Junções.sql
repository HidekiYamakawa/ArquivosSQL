create table Turma(
    codigo serial,
    turma varchar(30),
    descricao varchar(50),
    Constraint codigopk primary key(codigo)
);

create table Aluno(
    rgm varchar(11),
    nome varchar(40),
    telefone varchar(10),
    cod_turma serial,
    Constraint rgmpk primary key(rgm),
    Constraint codigofk foreign key(cod_turma) references Turma(codigo)
);

insert into Turma(turma,descricao) values
('SI','Sistemas de Informação'),
('ADS','Análise e Desenvolvimento de Sistemas'),
('Redes','Redes de Computadores');

insert into Aluno(rgm,nome,telefone) values
('27801','Antonio Jose','99999-0000'),
('9234','Luiza Silva','98888-0000'),
('1251','Renata Souza','97777-0000');

select nome,rgm,turma from Aluno,Turma where codigo=cod_turma

select a.nome,a.rgm,t.turma from Aluno as a, Turma as t where t.codigo=a.cod_turma