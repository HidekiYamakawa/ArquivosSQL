create table Cinema(
    id integer primary key,
    nome varchar(30) not null,
    lotacao integer not null,
    id_end_cinefk integer not null,
    Constraint id_end_cinefk foreign key(id_end_cinefk) references End_cine(id));

create table End_cine(
    id integer primary key, 
    estado varchar(40) not null,
    cidade varchar(50) not null,
    bairro varchar(40) not null,
    rua varchar(150) not null,
    numero integer not null,
    cep varchar(9) not null);
    
create table Filmes(
    id integer primary key,
    titulo varchar(50)not null,
    titulo_2 varchar(50),
    genero varchar(60) not null,
    duracao varchar(15)not null,
    impropriedade varchar(2) not null,
    origem varchar(30)not null);
	
create table Cartazes(
	id integer primary key,
	status varchar(20) not null);
	
create table CineCar(
	id integer primary key,
	inicio date not null,
	fim date not null,
	id_cinefk integer not null,
	id_cartazfk integer not null,
	id_filmefk integer not null,
	Constraint id_cinefk foreign key(id_cinefk) references Cinema(id),
	Constraint id_cartazfk foreign key(id_cartazfk) references Cartazes(id),
	Constraint id_filmefk foreign key(id_filmefk) references Filmes(id));
	
create table Salas(
	id integer primary key,
	capacidade integer not null,
	id_cinefk integer not null,
	Constraint id_cinefk foreign key(id_cinefk) references Cinema(id));
	
create table Sessoes(
	id integer primary key,
	horario varchar(5) not null,
	id_salafk integer not null,
    id_filmefk integer not null,
	Constraint id_salafk foreign key(id_salafk) references Salas(id),
    Constraint id_filmefk foreign key(id_filmefk) references Filmes(id));
 	
create table Atuacao(
	id integer primary key,
	narracao varchar(3000),
	id_filmefk integer not null,
	id_pessoafk integer not null,
	id_papelfk integer not null,
	Constraint id_filmefk foreign key(id_filmefk) references Filmes(id),
	Constraint id_pessoafk foreign key(id_pessoafk) references Pessoas(id),
	Constraint id_papelfk foreign key(id_papelfk) references Papel(id));
	
create table Pessoas(
	id integer primary key,
	nome varchar(80) not null);
	
create table Papel(
	id integer primary key,
	descricao varchar(1000) not null);
	
	insert into End_cine(id,estado,cidade,bairro,rua,numero,cep) values
	(1,'S�o Paulo','Mogi das Cruzes','Pindorama','Rua do mato',87,'08721-500'),
	(2,'S�o Paulo','Guararema','Guara','Rua do burgues',77,'08767-210'),
	(3,'S�o Paulo','S�o Paulo','Vila Montes','Rua dos mano',69,'08799-235'),
	(4,'S�o Paulo','Guarulhos','Plane','Rua dos abiones',11,'08732-322'),
	(5,'S�o Paulo','Suzano','Macaros','Rua dos labrones',15,'08732-902');
	
	insert into Cinema(id,nome,lotacao,id_end_cinefk) values
	(1,'CinekMogi',1600,1),
	(2,'CinekGuararema',840,2),
	(3,'CinekS�oPaulo',2000,3),
	(4,'CinekGuarulhos',1800,4),
	(5,'CinekSuzano',1200,5);
	
	insert into Filmes(id,titulo,titulo_2,genero,duracao,impropriedade,origem) values
	(1,'Avengers: Endgame','Vingadores: Ultimato','A��o','181 min','12','Estados Unidos'),
	(2,'POKEMON Detective Pikachu','POKEMON Detetive Pikachu','Aventura','102 min','L',
	 'Estados Unidos e Jap�o'),
	(3,'MIB: International','Homens de Preto: Internacional','A��o','115 min','12','Estados Unidos'),
	(4,'Captain Marvel', 'Capit� Marvel','A��o','124 min','12','Estados Unidos'),
	(5,'Iron Man','Homem de Ferro','A��o','126 min','12','Estados Unidos'),
	(6,'Captain America: The First Avenger','Capit�o Am�rica: O Primeiro Vingador','A��o',
	'124 min','12','Estados Unidos'),
	(7,'Thor',null,'A��o','115 min','12','Estados Unidos'),
	(8,'Guardians of the Galaxy','Guardi�es da Gal�xia','Fic��o cient�fica','121 min','12','Estados Unidos'),
	(9,'Grown Ups','Gente Grande','Com�dia','115 min','12','Estados Unidos'),
	(10,'High School Musical',null,'Com�dia Musical','93 min','L','Estados Unidos');
	
	insert into Cartazes(id,status) values
	(1,'Em Cartaz'),
	(2,'Em Breve'),
	(3,'Fora de Cartaz');
	
	insert into CineCar(id,inicio,fim,id_cinefk,id_cartazfk,id_filmefk) values
	(1,'2019-04-25','2019-06-24',1,1,1),
	(2,'2019-04-25','2019-06-24',2,1,1),
	(3,'2019-04-25','2019-06-24',3,1,1),
	(4,'2019-04-25','2019-06-24',4,1,1),
	(5,'2019-04-25','2019-06-24',5,1,1),
	(6,'2019-05-09','2019-07-08',1,1,2),
	(7,'2019-05-09','2019-07-08',2,3,2),
	(8,'2019-05-09','2019-07-08',3,1,2),
	(9,'2019-05-09','2019-07-08',4,1,2),
	(10,'2019-05-09','2019-07-08',5,3,2),
	(11,'2019-06-13','2019-08-12',1,2,3),
	(12,'2019-06-13','2019-08-12',2,3,3),
	(13,'2019-06-13','2019-08-12',3,2,3),
	(14,'2019-06-13','2019-08-12',4,2,3),
	(15,'2019-06-13','2019-08-12',5,2,3),
	(16,'2019-03-09','2019-05-08',1,3,4),
	(17,'2019-03-09','2019-05-08',2,3,4),
	(18,'2019-03-09','2019-05-08',3,3,4),
	(19,'2019-03-09','2019-05-08',4,3,4),
	(20,'2019-03-09','2019-05-08',5,3,4),
	(21,'2008-04-30','2008-06-29',1,3,5),
	(22,'2008-04-30','2008-06-29',2,3,5),
	(23,'2008-04-30','2008-06-29',3,3,5),
	(24,'2008-04-30','2008-06-29',4,3,5),
	(25,'2008-04-30','2008-06-29',5,3,5),
	(26,'2011-07-29','2011-09-28',1,3,6),
	(27,'2011-07-29','2011-09-28',2,3,6),
	(28,'2011-07-29','2011-09-28',3,3,6),
	(29,'2011-07-29','2011-09-28',4,3,6),
	(30,'2011-07-29','2011-09-28',5,3,6),
	(31,'2011-04-29','2011-04-28',1,3,7),
	(32,'2011-04-29','2011-04-28',2,3,7),
	(33,'2011-04-29','2011-04-28',3,3,7),
	(34,'2011-04-29','2011-04-28',4,3,7),
	(35,'2011-04-29','2011-04-28',5,3,7),
	(36,'2014-07-31','2014-09-30',1,3,8),
	(37,'2014-07-31','2014-09-30',2,3,8),
	(38,'2014-07-31','2014-09-30',3,3,8),
	(39,'2014-07-31','2014-09-30',4,3,8),
	(40,'2014-07-31','2014-09-30',5,3,8),
	(41,'2010-09-24','2010-11-24',1,3,9),
	(42,'2010-09-24','2010-11-24',2,3,9),
	(43,'2010-09-24','2010-11-24',3,3,9),
	(44,'2010-09-24','2010-11-24',4,3,9),
	(45,'2010-09-24','2010-11-24',5,3,9),
	(46,'2006-12-03','2010-12-03',1,3,10),
	(47,'2006-12-03','2010-12-03',2,3,10),
	(48,'2006-12-03','2010-12-03',3,3,10),
	(49,'2006-12-03','2010-12-03',4,3,10),
	(50,'2006-12-03','2010-12-03',5,3,10);
	
	insert into Salas(id,capacidade,id_cinefk) values
	(1,230,1),
	(2,330,1),
	(3,240,1),
	(4,300,1),
	(5,250,1),
	(6,250,1),
	(7,210,2),
	(8,180,2),
	(9,210,2),
	(10,240,2),
	(11,400,3),
	(12,340,3),
	(13,320,3),
	(14,300,3),
	(15,230,3),
	(16,310,3),
	(17,100,3),
	(18,320,4),
	(19,320,4),
	(20,320,4),
	(21,320,4),
	(22,320,4),
	(23,200,4),
	(24,300,5),
	(25,150,5),
	(26,280,5),
	(27,240,5),
	(28,230,5);
	
	insert into Sessoes(id,horario,id_salafk,id_filmefk) values
	(1,'13:10',1,1),(2,'13:10',7,1),(3,'13:10',11,1),(4,'13:10',18,1),(5,'13:10',24,1),
	(6,'14:40',2,1),(7,'14:40',8,1),(8,'14:40',12,2),(9,'14:40',19,1),(10,'14:40',25,1),
	(11,'16:50',3,2),(12,'16:50',9,1),(13,'16:50',13,2),(14,'16:50',20,2),(15,'16:50',26,1),
	(16,'17:30',4,1),(17,'17:30',10,1),(18,'17:30',14,1),(19,'17:30',21,1),(20,'17:30',27,1),
	(21,'18:40',5,2),(22,'18:40',15,1),(23,'18:40',22,2),(24,'18:40',28,2),
	(25,'19:30',6,1),(26,'19:30',16,1),(27,'19:30',23,1),
	(28,'20:50',17,2);
    
    insert into Pessoas(id,nome) values
	(01,'Chris Hemsworth'),
	(02,'Robert Downey Jr.'),
	(03,'Anthony Russo'),
	(04,'Justice Smith'),
	(05,'Ryan Reynolds'),
	(06,'Rob Letterman'),
	(07,'Tessa Thompson'),
	(08,'Barry Sonnenfeld'),
	(09,'Brie Larson'),
	(10,'Samuel L. Jackson'),
	(11,'Anna Boden'),
	(13,'Jon Favreau'),
	(14,'Sebastian Stan'),
	(15,'Chris Evans'),
	(16,'Joe Johnston'),
	(17,'Natalie Portman'),
	(18,'Kenneth Branagh'),
	(19,'James Gunn'),
	(20,'Chris Pratt'),
	(21,'Adam Sandler'),
	(22,'Salma Hayek'),
	(23,'Dennis Dugan'),
	(24,'Zac Efron'),
	(25,'Vanessa Hudgens'),
	(26,'Kenny Ortega');


insert into Papel(id,descricao)values	
	(01,'Um Vingador e rei de Asgard baseado na divindade n�rdica de mesmo nome. Thor agora possui um machado m�stico conhecido como Stormbreaker, ap�s a destrui��o de seu martelo Mjolnir em Thor: Ragnarok'),
	(02,' O l�der e benfeitor dos Vingadores que � auto-descrito como g�nio, bilion�rio, playboy e filantropo que usa trajes eletromec�nicos de sua pr�pria cria��o.'),
	(03,'Diretor de Vingadores: Ultimato'),
	(04,'um ex-treinador de Pok�mon procurando por seu pai desaparecido; ele tamb�m � parceiro do Pikachu, e a �nica pessoa capaz de entender o que ele fala.'),
	(05,'um Pok�mon detetive de classe mundial excepcionalmente inteligente que s� o tempo pode compreender. Reynolds tamb�m faz os movimentos faciais do personagem. Ele tamb�m apareceu no final do filme como Harry Goodman, o pai desaparecido de Tim e um famoso detetive de Ryme City.'),
	(06,'Diretor de POKEMON Detetive Pikachu'),
	(07,'Como a Agente M'),
	(08,'Como o Agente H'),
	(09,'Diretor de MIB: International'),
	(10,'Uma pilota da For�a A�rea dos EUA, que � exposta a energia emanada de uma explos�o de um motor experimental de tecnologia Kree, o que lhe concedeu poderes .Larson descreveu Danvers como uma "crente na verdade e na justi�a" e uma "ponte entre a Terra e o espa�o. Ela est� lutando entre as falhas que est�o dentro dela e todo bem que ela quer tentar espalhar e tornar o mundo um lugar melhor".'),
	(11,'Um agente da S.H.I.E.L.D.[12] Fury aparece sem o seu tapa-olho, j� que o filme � ambientado na d�cada de 1990, antes dele perder seu olho.Um agente da S.H.I.E.L.D. Fury aparece sem o seu tapa-olho, j� que o filme � ambientado na d�cada de 1990, antes dele perder seu olho.'),
	(12,'Diretora de Capit� Marvel'),
	(13,'Um industrialista "g�nio, bilion�rio, playboy, fil�ntropo", ele � diretor executivo das Ind�strias Stark e um fabricante de armas para os militares dos Estados Unidos.'),
	(14,'Protagoniza Happy Hogan'),
	(15,'Diretor de Iron Man'),
	(16,'Um sargento do Ex�rcito dos Estados Unidos, melhor amigo de Rogers e membro do seu comando selvagem.'),
	(17,'Um jovem fr�gil e fraco que � aprimorado ao �pice da habilidade humana atrav�s de um soro experimental para ser usado como arma de guerra pelos EUA.'),
	(18,'Diretor de Capitao America'),
	(19,'Uma cientista e interesse amoroso de Thor. A Marvel Studios declarou em um an�ncio que a personagem foi atualizada a partir do retrato inicial dos quadrinhos para a adapta��o do filme.'),
	(20,' O pr�ncipe herdeiro de Asgard, baseado na divindade da mitologia n�rdica de mesmo nome.'),
	(21,'Diretor de Thor'),
	(22,'Uma Sakaaran'),
	(23,'� um aventureiro interestelar que foi raptado da Terra quando ainda era bem jovem. Ap�s recuperar um artefato antigo, Quill ter� que reunir uma improv�vel equipe de desajustados c�smicos para impedir que um poderoso vil�o destrua a gal�xia.'),
	(24,'Diretor de guardioes da galaxia'),
	(25,'Como Lenny Feder'),
	(26,'Como Roxanne Chase-Feder'),
	(27,'Diretor de Grown Ups'),
	(28,'Como Troy Bolton, o namorado de Gabriella, o aluno masculino mais popular da East High School, e o capit�o do time de basquete do col�gio. Na v�spera de Ano Novo, depois de cantar com Gabriella, ele se v� desenvolvendo uma queda por ela. '),
	(29,'Como Gabriella Montez, a namorada de Troy, uma nova aluna e uma das brainiacs do time de torcida escol�stico. Ela desenvolve um amor por Troy depois de encontr�-lo em uma festa de Ano Novo.'),
	(30,'Diretor de High School Music');

insert into Atuacao(id,narracao,id_filmefk,id_pessoafk,id_papelfk) values
	(01,'Ap�s Thanos eliminar metade das criaturas vivas, os Vingadores t�m de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espa�o sem �gua e comida, Steve Rogers e Natasha Romanov lideram a resist�ncia contra o tit� louco.',1,03,03),
    (11,'Ap�s Thanos eliminar metade das criaturas vivas, os Vingadores t�m de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espa�o sem �gua e comida, Steve Rogers e Natasha Romanov lideram a resist�ncia contra o tit� louco.',1,01,01),
    (12,'Ap�s Thanos eliminar metade das criaturas vivas, os Vingadores t�m de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espa�o sem �gua e comida, Steve Rogers e Natasha Romanov lideram a resist�ncia contra o tit� louco.',1,02,02),
    
    (02,'Um jovem une for�as com o detetive Pikachu para desvendar o mist�rio por tr�s do desaparecimento de seu pai. Perseguindo pistas pelas ruas de Ryme City, a dupla din�mica logo descobre uma trama desonesta que representa uma amea�a ao universo Pok�mon.',2,06,06),
	(21,'Um jovem une for�as com o detetive Pikachu para desvendar o mist�rio por tr�s do desaparecimento de seu pai. Perseguindo pistas pelas ruas de Ryme City, a dupla din�mica logo descobre uma trama desonesta que representa uma amea�a ao universo Pok�mon.',2,04,04),
    (22,'Um jovem une for�as com o detetive Pikachu para desvendar o mist�rio por tr�s do desaparecimento de seu pai. Perseguindo pistas pelas ruas de Ryme City, a dupla din�mica logo descobre uma trama desonesta que representa uma amea�a ao universo Pok�mon.',2,05,05),

    (03,'Kay e Jay, os "Homens de Preto", s�o o maior segredo j� mantido no universo. Eles s�o agentes de uma ag�ncia n�o-oficializada do governo e respons�veis por monitorar todos os encontros com alien�genas na terra. Enquanto os dois investigam uma s�rie de atividades extraterrestres, descobrem um terrorista intergal�ctico cuja miss�o � assassinar dois embaixadores de gal�xias opostas.',3,08,09),
	(31,'Kay e Jay, os "Homens de Preto", s�o o maior segredo j� mantido no universo. Eles s�o agentes de uma ag�ncia n�o-oficializada do governo e respons�veis por monitorar todos os encontros com alien�genas na terra. Enquanto os dois investigam uma s�rie de atividades extraterrestres, descobrem um terrorista intergal�ctico cuja miss�o � assassinar dois embaixadores de gal�xias opostas.',3,01,09),
    (32,'Kay e Jay, os "Homens de Preto", s�o o maior segredo j� mantido no universo. Eles s�o agentes de uma ag�ncia n�o-oficializada do governo e respons�veis por monitorar todos os encontros com alien�genas na terra. Enquanto os dois investigam uma s�rie de atividades extraterrestres, descobrem um terrorista intergal�ctico cuja miss�o � assassinar dois embaixadores de gal�xias opostas.',3,07,08),

    (04,'A Capit� Marvel se envolve em uma guerra gal�ctica entre duas ra�as alien�genas.',4,11,12),
    (41,'A Capit� Marvel se envolve em uma guerra gal�ctica entre duas ra�as alien�genas.',4,09,10),
    (42,'A Capit� Marvel se envolve em uma guerra gal�ctica entre duas ra�as alien�genas.',4,10,11),
	
    (05,'Tony Stark � um industrial bilion�rio e inventor brilhante que realiza testes b�licos no exterior, mas � sequestrado por terroristas que o for�am a construir uma arma devastadora. Em vez disso, ele constr�i uma armadura blindada e enfrenta seus sequestradores. Ao voltar para os EUA, Stark aprimora a armadura e a utiliza para combater o crime.',5,13,15),
    (51,'Tony Stark � um industrial bilion�rio e inventor brilhante que realiza testes b�licos no exterior, mas � sequestrado por terroristas que o for�am a construir uma arma devastadora. Em vez disso, ele constr�i uma armadura blindada e enfrenta seus sequestradores. Ao voltar para os EUA, Stark aprimora a armadura e a utiliza para combater o crime.',5,02,13),
    (52,'Tony Stark � um industrial bilion�rio e inventor brilhante que realiza testes b�licos no exterior, mas � sequestrado por terroristas que o for�am a construir uma arma devastadora. Em vez disso, ele constr�i uma armadura blindada e enfrenta seus sequestradores. Ao voltar para os EUA, Stark aprimora a armadura e a utiliza para combater o crime.',5,13,14),
	
    (06,'Steve Rogers � um jovem que participa de experi�ncias visando a cria��o do supersoldado americano. Quando os oficiais militares conseguem transform�-lo em uma arma humana, eles percebem que n�o podem arriscar a vida do jovem nas batalhas de guerra.',6,16,18),
    (61,'Steve Rogers � um jovem que participa de experi�ncias visando a cria��o do supersoldado americano. Quando os oficiais militares conseguem transform�-lo em uma arma humana, eles percebem que n�o podem arriscar a vida do jovem nas batalhas de guerra.',6,15,17),
    (62,'Steve Rogers � um jovem que participa de experi�ncias visando a cria��o do supersoldado americano. Quando os oficiais militares conseguem transform�-lo em uma arma humana, eles percebem que n�o podem arriscar a vida do jovem nas batalhas de guerra.',6,14,16),

    (07,'Como filho de Odin, rei dos deuses n�rdicos, Thor logo herdar� o trono de Asgard de seu idoso pai. Por�m, no dia de sua coroa��o, Thor reage com brutalidade quando os inimigos dos deuses entram no pal�cio violando o tratado. Como puni��o, Odin manda Thor para a Terra. Enquanto seu irm�o Loki conspira em Asgard, Thor, agora sem seus poderes, enfrenta sua maior amea�a.',7,18,21),
    (71,'Como filho de Odin, rei dos deuses n�rdicos, Thor logo herdar� o trono de Asgard de seu idoso pai. Por�m, no dia de sua coroa��o, Thor reage com brutalidade quando os inimigos dos deuses entram no pal�cio violando o tratado. Como puni��o, Odin manda Thor para a Terra. Enquanto seu irm�o Loki conspira em Asgard, Thor, agora sem seus poderes, enfrenta sua maior amea�a.',7,01,20),
    (72,'Como filho de Odin, rei dos deuses n�rdicos, Thor logo herdar� o trono de Asgard de seu idoso pai. Por�m, no dia de sua coroa��o, Thor reage com brutalidade quando os inimigos dos deuses entram no pal�cio violando o tratado. Como puni��o, Odin manda Thor para a Terra. Enquanto seu irm�o Loki conspira em Asgard, Thor, agora sem seus poderes, enfrenta sua maior amea�a.',7,17,19),
	
    (08,'O aventureiro do espa�o Peter Quill torna-se presa de ca�adores de recompensas depois que rouba a esfera de um vil�o trai�oeiro, Ronan. Para escapar do perigo, ele faz uma alian�a com um grupo de quatro extraterrestres. Quando Quill descobre que a esfera roubada possui um poder capaz de mudar os rumos do universo, ele e seu grupo dever�o proteger o objeto para salvar o futuro da gal�xia.',8,19,24),
    (81,'O aventureiro do espa�o Peter Quill torna-se presa de ca�adores de recompensas depois que rouba a esfera de um vil�o trai�oeiro, Ronan. Para escapar do perigo, ele faz uma alian�a com um grupo de quatro extraterrestres. Quando Quill descobre que a esfera roubada possui um poder capaz de mudar os rumos do universo, ele e seu grupo dever�o proteger o objeto para salvar o futuro da gal�xia.',8,20,23),
    (82,'O aventureiro do espa�o Peter Quill torna-se presa de ca�adores de recompensas depois que rouba a esfera de um vil�o trai�oeiro, Ronan. Para escapar do perigo, ele faz uma alian�a com um grupo de quatro extraterrestres. Quando Quill descobre que a esfera roubada possui um poder capaz de mudar os rumos do universo, ele e seu grupo dever�o proteger o objeto para salvar o futuro da gal�xia.',8,19,22),
	
    (09,'A morte do treinador de basquete da inf�ncia de velhos amigos os re�ne no mesmo lugar que celebraram um campeonato anos atr�s. Os amigos, acompanhados de suas esposas e filhos, descobrem que idade n�o significa o mesmo que maturidade.',9,23,27),
    (91,'A morte do treinador de basquete da inf�ncia de velhos amigos os re�ne no mesmo lugar que celebraram um campeonato anos atr�s. Os amigos, acompanhados de suas esposas e filhos, descobrem que idade n�o significa o mesmo que maturidade.',9,21,25),
    (92,'A morte do treinador de basquete da inf�ncia de velhos amigos os re�ne no mesmo lugar que celebraram um campeonato anos atr�s. Os amigos, acompanhados de suas esposas e filhos, descobrem que idade n�o significa o mesmo que maturidade.',9,22,26),
	
    (10,'Estudantes conspiram contra uma estrela do basquete e uma t�mida novata, para evitar que eles cantem em uma produ��o musical.',10,26,30),	
    (101,'Estudantes conspiram contra uma estrela do basquete e uma t�mida novata, para evitar que eles cantem em uma produ��o musical.',10,24,28),	
    (102,'Estudantes conspiram contra uma estrela do basquete e uma t�mida novata, para evitar que eles cantem em uma produ��o musical.',10,25,29);	

    select genero from Filmes where genero=genero group by genero
    
    select titulo from Filmes
    
    select titulo,status from Filmes as c,CineCar as b,Cartazes as a where b.id_cartazfk=a.id and b.id_cartazfk=1 and c.id=b.id_filmefk group by titulo,status
    
    select titulo,status from Cinema as d,Filmes as c,CineCar as b,Cartazes as a where b.id_cartazfk=a.id and b.id_cartazfk=1 and c.id=b.id_filmefk and b.id_cinefk=d.id and b.id_cinefk=1 group by titulo,status

	
    select a.id,capacidade from Salas as a,Cinema as b where a.id_cinefk=b.id and a.id_cinefk=1
    
    select count(a.id) from Salas as a,Cinema as b where a.id_cinefk=b.id and id_cinefk=1
    
    select count(a.id),b.titulo from Sessoes as a,Filmes as b where a.id_filmefk=b.id and a.id_filmefk=1 group by titulo
    
    select sum(a.capacidade) from Salas as a,Filmes as b,Sessoes as c where c.id_filmefk=b.id and c.id_filmefk=1 and c.id_salafk=a.id
    
    
    
    