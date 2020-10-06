
 CREATE TABLE cargo(   
     codigo   numeric(5) NOT NULL,   
     nome    varchar(100) NOT NULL,   
     salario_base   numeric(10,2) NOT NULL,   
     CONSTRAINT pk_cargo_cod PRIMARY KEY (codigo) 
 ) ; 
 CREATE TABLE cidade(   
     codigo   numeric(5) NOT NULL,   
     nome    varchar(100) NOT NULL,   
     CONSTRAINT pk_cidade_cod PRIMARY KEY (codigo) 
 ) ; 
 CREATE TABLE departamento(   
     codigo   numeric(5) NOT NULL,   
     nome    varchar(100) NOT NULL,   
     CONSTRAINT pk_depto_cod PRIMARY KEY (codigo) 
 ) ; 
 CREATE TABLE funcionario(   
     codigo   numeric(5) NOT NULL,   
     nome    varchar(100) NOT NULL,   
     telefone   varchar(50),   
     salario   numeric(10,2) NOT NULL,   
     cod_cargo   numeric(5) NOT NULL,   
     cod_cidade   numeric(5) NOT NULL,   
     cod_depto   numeric(5) NOT NULL,   
     gerente   numeric(5),   
     CONSTRAINT pk_func_cod PRIMARY KEY (codigo),   
     CONSTRAINT fk_func_cargo FOREIGN KEY (cod_cargo)  
     	REFERENCES cargo (codigo) ON UPDATE NO ACTION ON DELETE NO ACTION,   
     CONSTRAINT fk_func_cidade FOREIGN KEY (cod_cidade)  
     	REFERENCES cidade (codigo) ON UPDATE NO ACTION ON DELETE NO ACTION,   
     CONSTRAINT fk_func_depto FOREIGN KEY (cod_depto)  
     	REFERENCES departamento (codigo) ON UPDATE NO ACTION  ON DELETE NO ACTION,   
     CONSTRAINT fk_func_gerente FOREIGN KEY (gerente)  
     	REFERENCES funcionario (codigo) ON UPDATE NO ACTION  ON DELETE NO ACTION 
 ) ; 
 CREATE TABLE filme(   
     codigo   numeric(8),   
     titulo    varchar(200) not null,   
     fk_diretor   numeric(8) not null,   
     resenha   varchar(500),   
     duracao   time not null,   
     valor    numeric(8,2) not null,  
     situacao  varchar(30) not null, /*disponivel, alugado */   
     CONSTRAINT pk_filme_cod PRIMARY KEY (codigo) 
 ); 
 CREATE TABLE diretor(   
     codigo   numeric(8), 
     nome    varchar(150) not null,   
     data_nascimento  date,   
     CONSTRAINT pk_diretor PRIMARY KEY (codigo) 
 ); 
 
 ALTER TABLE filme  ADD  CONSTRAINT fk_filme_diretor  FOREIGN KEY (fk_diretor)  REFERENCES diretor(codigo); 
 CREATE TABLE cliente(   
     codigo   numeric(8),   
     nome    varchar(150) not null,   
     data_nascimento  date,   
     CONSTRAINT pk_cliente PRIMARY KEY (codigo) 
 ); 
 CREATE TABLE locacao(   
     codigo   numeric(8),   
     data    date not null,  
     hora    time not null,   
     dt_devolucao  date,   
     fk_filme   numeric(8) not null,   
     fk_cliente   numeric(8) not null,   
     fk_funcionario   numeric(8) not null,  
     CONSTRAINT pk_locacao PRIMARY KEY (codigo),   
     CONSTRAINT fk_locacao_funcionario FOREIGN KEY (fk_funcionario)  
     	REFERENCES funcionario(codigo),   
     CONSTRAINT fk_locacao_filme FOREIGN KEY (fk_filme) 
     	REFERENCES filme(codigo),   
     CONSTRAINT fk_locacao_cliente FOREIGN KEY  (fk_cliente) 
     	REFERENCES cliente(codigo) 
 ); 
 CREATE TABLE tipo_movimento(   
     codigo    varchar(1),   
     nome    varchar(80),   
     CONSTRAINT pk_tipomovimento PRIMARY KEY (codigo)  
 ); 
 CREATE TABLE movimentacao(   
     codigo   numeric(8),   
     data    date not null,   
     valor   numeric(8,2),   
     fk_tP_movimento  varchar(1) not null,   
     CONSTRAINT pk_movimento PRIMARY KEY (codigo),   
     CONSTRAINT fk_movimentacao_tipo_mov FOREIGN KEY (fk_tp_movimento)   
     	REFERENCES tipo_movimento(codigo) 
 ); 
 INSERT INTO cargo (codigo, nome, salario_base) VALUES 
 (1, 'estagiario', 800.00); 
 INSERT INTO cargo (codigo, nome, salario_base) VALUES 
 (2, 'gerente', 2000.00); 
 INSERT INTO cargo (codigo, nome, salario_base) VALUES 
 (3, 'supervisor', 1800.00); 
 INSERT INTO cargo (codigo, nome, salario_base) VALUES 
 (4, 'encarregado', 1500.00); 
 INSERT INTO cargo (codigo, nome, salario_base) VALUES 
 (5, 'auxiliar geral', 1000.00); 
 INSERT INTO cargo (codigo, nome, salario_base) VALUES 
 (6, 'analista de sistemas', 1000.00); 
 INSERT INTO cargo (codigo, nome, salario_base) VALUES 
 (7, 'analista de testes', 1000.00);
 select * from cargo;
 
 INSERT INTO cidade (codigo, nome) VALUES 
 (1, 'mogi das cruzes'); 
 INSERT INTO cidade (codigo, nome) VALUES 
 (2, 'Sao Paulo'); 
 INSERT INTO cidade (codigo, nome) VALUES 
 (3, 'Campinas'); 
 INSERT INTO cidade (codigo, nome) VALUES 
 (4, 'Sao Jose dos Campos'); 
 INSERT INTO cidade (codigo, nome) VALUES 
 (5, 'Limeira'); 
 
 INSERT INTO departamento (codigo, nome) VALUES 
 (1, 'vendas');  
 INSERT INTO departamento (codigo, nome) VALUES 
 (2, 'compras'); 
 INSERT INTO departamento (codigo, nome) VALUES 
 (3, 'PCP'); 
 INSERT INTO departamento (codigo, nome) VALUES 
 (4, 'producao'); 
 INSERT INTO departamento (codigo, nome) VALUES 
 (5, 'fabrica de software'); 
 INSERT INTO departamento (codigo, nome) VALUES 
 (6, 'testes'); 
 
 INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente)  VALUES 
 (1, 'Antonio Leite', '989 0999', 10000.00, 2, 3, 2, NULL); 
 INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) VALUES 
 (2, 'Lucas Silva', '8778 7878', 7000.00, 2, 1, 1, 1); 
 INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) VALUES 
 (3, 'Bruna Santos', '899 9987', 2000.98, 3, 3, 4, 2); 
 INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) VALUES 
 (4, 'Camila Rocha', '987 554545', 4000.98, 4, 2, 1, 1); 
 INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) VALUES 
 (5, 'Dayna Santos', '7655 6654', 600.00, 1, 4, 3, 1); 
 INSERT INTO funcionario (codigo, nome, telefone, salario, cod_cargo, cod_cidade, cod_depto, gerente) VALUES 
 (6, 'Emerson Santos', '899 99989', 6000.98, 2, 3, 4, 2); 
 
 INSERT INTO diretor (codigo, nome, data_nascimento)  VALUES 
 (1, 'Cristian Lemos', to_date('dd-MM-yyyy','27-05-1945')); 
 INSERT INTO diretor (codigo, nome, data_nascimento)  VALUES 
 (2, 'Raposo Tavares', to_date('dd-MM-yyyy','31-12-1915')); 
 INSERT INTO diretor (codigo, nome, data_nascimento)  VALUES 
 (3, 'Carmen Sandiego', to_date('dd-MM-yyyy','02-06-1938')); 
 
 INSERT INTO filme (codigo, titulo, resenha, fk_diretor, duracao, valor, situacao )  VALUES 
 (01, 'Guerra nas Estrelas','guerra, ficcao, ect' ,1,'01:30', 5.4, 'alugado'); 
 INSERT INTO filme (codigo, titulo, resenha, fk_diretor, duracao, valor, situacao)  VALUES 
 (02, 'Guerra nas Estrelas','guerra, ficcao, ect',1,'14:30',3.5, 'disponivel'); 
 INSERT INTO filme (codigo, titulo, resenha, fk_diretor, duracao, valor, situacao )  VALUES 
 (03, 'Um dia depois de amanha','baixa temperatura', 2,'11:00',3.4, 'alugado'); 
 INSERT INTO filme (codigo, titulo, resenha, fk_diretor, duracao, valor, situacao )  VALUES 
 (04, 'Um amor para sempre','romance',3,'14:00',4.6, 'disponivel'); 
 INSERT INTO filme (codigo, titulo, resenha, fk_diretor, duracao, valor, situacao )  VALUES 
 (05, 'Os 3 porquinhos','infantil',3,'16:30',2.45, 'alugado'); 
 
 INSERT INTO cliente (codigo, nome, data_nascimento)  VALUES 
 (1, 'Fernando Henrique','1980-09-13'); 
 INSERT INTO cliente (codigo, nome, data_nascimento)  VALUES 
 (2, 'Aline Moraes', '1930-12-09'); 
 INSERT INTO cliente (codigo, nome, data_nascimento)  VALUES 
 (3, 'Emerson Nogueira', '1923-10-09'); 
 INSERT INTO cliente (codigo, nome, data_nascimento)  VALUES 
 (4, 'Fausto Silva', '1978-12-07'); 
 INSERT INTO cliente (codigo, nome, data_nascimento)  VALUES 
 (5, 'Luiz Carlos Santana', '1922-12-07'); 
 
 INSERT INTO locacao (codigo, data, hora, fk_filme, fk_cliente, fk_funcionario)  VALUES 
 (1, '2008-03-12' , '1:30', 01,01,01); 
 INSERT INTO locacao (codigo, data, hora, fk_filme, fk_cliente, fk_funcionario)  VALUES 
 (2, '2008-01-30', '11:34' ,02,02,01); 
 INSERT INTO locacao (codigo, data, hora, fk_filme, fk_cliente, fk_funcionario) VALUES 
 (3, '2008-02-27', '12:30', 03,03,02); 
 INSERT INTO locacao (codigo, data, hora, fk_filme, fk_cliente, fk_funcionario)  VALUES 
 (4, '2008-05-01', '10:30',04,03,03); 
 INSERT INTO locacao (codigo, data, hora, fk_filme, fk_cliente, fk_funcionario)  VALUES 
 (5, '2008-07-16', '08:30', 01,04,01); 
 
 INSERT INTO tipo_movimento (codigo, nome) VALUES
 ('C', 'CREDITO'); 
 INSERT INTO tipo_movimento (codigo, nome) VALUES
 ('D', 'DEBITO');
 
 
 CREATE VIEW marketing_acess (nome_empregado, cidade, telefone, cargo, departamento)AS
 select a.nome, c.nome, a.telefone, g.nome, t.nome
 from funcionario as a,cidade as c,cargo as g,departamento as t
 where a.cod_cidade=c.codigo and a.cod_cargo=g.codigo and a.cod_depto=t.codigo;
 
 SELECT * FROM marketing_acess;
 

SELECT nome_empregado,telefone FROM marketing_acess where cidade='mogi das cruzes';
 

CREATE VIEW dados_filmes (titulo, resenha, duracao, diretor) AS
SELECT a.titulo, a.resenha, a.duracao, c.nome
FROM filme as a, diretor as c
WHERE a.fk_diretor=c.codigo;

SELECT * FROM dados_filmes;

SELECT titulo,diretor FROM dados_filmes WHERE diretor='Raposo Tavares';



CREATE VIEW dados_locacao(dt_locacao, filme, diretor, cliente, dt_nascimento_cliente, funcionario) AS
SELECT l.data, f.titulo, d.nome, c.nome, c.data_nascimento, func.nome
FROM locacao as l, filme as f, diretor as d, cliente as c, funcionario as func
WHERE l.fk_filme=f.codigo and f.fk_diretor=d.codigo and l.fk_cliente=c.codigo and l.fk_funcionario=func.codigo;

SELECT * FROM dados_locacao;

SELECT * FROM dados_locacao WHERE dt_locacao BETWEEN '2008-01-01' AND '2008-03-31';


select * from locacao
select * from movimentacao

BEGIN WORK;
INSERT INTO locacao (codigo, data, hora, fk_filme, fk_cliente, fk_funcionario)  VALUES 
(1, '2008-03-12' , '1:30', 01,01,01); 
INSERT INTO movimentacao(codigo, data, valor, fk_tP_movimento) VALUES
(1,(select data from locacao where codigo=1),20.00,'D');
COMMIT WORK;



