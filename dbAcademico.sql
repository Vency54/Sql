/*
ATIVIDADE 01 - BANCO DE DADOS II – 2º bim
---------------------------------------
MEMBROS DO GRUPO:
1 - João Victor Lima Venceslau
2 - Rayssa Silva de Oliveira
3 - João Victor dos Santos Pereira
4 - Luís Tiago Ferreira Melo dos Santos
---------------------------------------
*/


create database dbAcademico;
go

use  dbAcademico;
go

CREATE TABLE TipoCurso (
	id_tipo int PRIMARY KEY IDENTITY(1,1),
	nome varchar(30)
);
go

create table Curso(
id_curso INT Primary Key Identity(1,1),
nome varchar(50) not null,
sigla varchar(10) not null unique,
id_tipo INT NOT NULL,
constraint fk_curso_tipocurso Foreign Key (id_tipo) references TipoCurso(id_tipo)
);
go

CREATE TABLE Professor (
	prontuario char(8) PRIMARY KEY,
	nome varchar(50) NOT NULL,
	apelido varchar(50),
	email varchar(50) UNIQUE NOT NULL,
	titulacao varchar(20) NOT NULL
);
go

CREATE TABLE Disciplina (
	id_disciplina int PRIMARY KEY identity(1,1),
	nome varchar(50) NOT NULL,
	codigo char(10) UNIQUE NOT NULL,
	id_curso INT not null,
	CONSTRAINT fk_Disciplina_Curso FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);
go

CREATE TABLE Cidade (
    id_cidade INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(30) UNIQUE NOT NULL
);
go

INSERT INTO Cidade (nome) VALUES
('Santos'),
('São Vicente'),
('Guarujá'),
('Praia Grande'),
('Cubatão'),
('Bertioga'),
('Mongaguá'),
('Itanhaém'),
('Peruíbe');

go

create table Aluno(
prontuario char(8) Primary Key,
nome varchar(50) not null,
cpf char(12) not null unique,
id_cidade INT,
dt_nasc date not null,
email varchar(100) not null unique,
constraint ck_idade Check(datediff(year,dt_nasc,getdate()) >= 14),
constraint fk_aluno_cidade Foreign Key (id_cidade) references Cidade(id_cidade)
);
go


create table Turma(
id_turma INT Primary Key identity(1,1),
nome varchar(10) not null,
id_curso INT not null,
constraint fk_turma_curso Foreign Key (id_curso) references Curso(id_curso)
);
go

CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY IDENTITY(1,1),
    prontuario CHAR(8) NOT NULL,
    id_curso INT NOT NULL,

    CONSTRAINT fk_matricula_aluno 
        FOREIGN KEY (prontuario) REFERENCES Aluno(prontuario),

    CONSTRAINT fk_matricula_curso 
        FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Turma_Disciplina (
    id_turma INT,
    id_disciplina INT,

    PRIMARY KEY (id_turma, id_disciplina),

    CONSTRAINT fk_td_turma 
        FOREIGN KEY (id_turma) REFERENCES Turma(id_turma),

    CONSTRAINT fk_td_disciplina 
        FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);
go

CREATE TABLE Aluno_Turma (
    prontuario CHAR(8),
    id_turma INT,

    PRIMARY KEY (prontuario, id_turma),

    CONSTRAINT fk_at_aluno FOREIGN KEY (prontuario) REFERENCES Aluno(prontuario),
    CONSTRAINT fk_at_turma FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);
go

ALTER TABLE Disciplina 
ADD prontuario_professor CHAR(8);
go

ALTER TABLE Disciplina
ADD CONSTRAINT fk_disciplina_professor
FOREIGN KEY (prontuario_professor) 
REFERENCES Professor(prontuario);

go
INSERT INTO Aluno (prontuario, nome, cpf, id_cidade, dt_nasc, email) VALUES
('ALU00001','Ana Silva','111222333441',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2005-01-15','ana.silva@email.com'),
('ALU00002','Bruno Oliveira','222333444552',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2004-03-20','bruno.oliveira@email.com'),
('ALU00003','Carla Souza','333444555663',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2006-07-12','carla.souza@email.com'),
('ALU00004','Diego Santos','444555666774',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2003-11-30','diego.santos@email.com'),
('ALU00005','Elena Martins','555666777885',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2005-05-05','elena.martins@email.com'),
('ALU00006','Fabio Costa','666777888996',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2004-09-18','fabio.costa@email.com'),
('ALU00007','Gisele Rocha','777888999007',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2006-02-28','gisele.rocha@email.com'),
('ALU00008','Hugo Ferreira','888999000118',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2005-12-10','hugo.ferreira@email.com'),
('ALU00009','Iara Lima','999000111229',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2004-06-25','iara.lima@email.com'),
('ALU00010','João Pereira','000111222330',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2003-04-14','joao.pereira@email.com'),

('ALU00011','Karen Alves','121232342451',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2005-08-30','karen.alves@email.com'),
('ALU00012','Lucas Ramos','232343453562',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2004-01-12','lucas.ramos@email.com'),
('ALU00013','Marina Dias','343454564673',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2006-03-22','marina.dias@email.com'),
('ALU00014','Nuno Gomes','454565675784',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2005-10-05','nuno.gomes@email.com'),
('ALU00015','Olivia Castro','565676786895',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2004-12-20','olivia.castro@email.com'),
('ALU00016','Paulo Moraes','676787897906',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2003-06-15','paulo.moraes@email.com'),
('ALU00017','Quiteria Luz','787898908017',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2006-05-11','quiteria.luz@email.com'),
('ALU00018','Ricardo Vaz','898909019128',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2005-02-02','ricardo.vaz@email.com'),
('ALU00019','Sara Nunes','909010120239',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2004-04-09','sara.nunes@email.com'),
('ALU00020','Tiago Belo','010121231340',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2003-08-27','tiago.belo@email.com'),

('ALU00021','Ursula Meire','112233445561',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2005-11-14','ursula.meire@email.com'),
('ALU00022','Victor Hugo','223344556672',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2004-02-19','victor.hugo@email.com'),
('ALU00023','Wendy Luz','334455667783',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2006-09-01','wendy.luz@email.com'),
('ALU00024','Xavier Lima','445566778894',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2005-03-31','xavier.lima@email.com'),
('ALU00025','Yara Flor','556677889905',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2004-05-15','yara.flor@email.com'),
('ALU00026','Zeca Silva','667788990016',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2003-10-10','zeca.silva@email.com'),
('ALU00027','Arthur Pires','778899001127',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2005-01-01','arthur.pires@email.com'),
('ALU00028','Beatriz Rosa','889900112238',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2006-12-25','beatriz.rosa@email.com'),
('ALU00029','Caio Ribeiro','990011223349',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2004-07-07','caio.ribeiro@email.com'),
('ALU00030','Dandara Paz','001122334450',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2005-06-18','dandara.paz@email.com'),

('ALU00031','Eduardo Lins','102938475611',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2003-09-09','eduardo.lins@email.com'),
('ALU00032','Fernanda Mota','203948576122',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2005-04-04','fernanda.mota@email.com'),
('ALU00033','Gabriel Farias','304958677233',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2004-11-11','gabriel.farias@email.com'),
('ALU00034','Heloisa Guerra','405968778344',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2006-01-20','heloisa.guerra@email.com'),
('ALU00035','Igor Marques','506978879455',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2005-08-08','igor.marques@email.com'),
('ALU00036','Julia Borges','607989970566',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2004-10-15','julia.borges@email.com'),
('ALU00037','Kleber Toledo','708990071677',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2003-05-22','kleber.toledo@email.com'),
('ALU00038','Larissa Vale','809001172788',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2005-12-30','larissa.vale@email.com'),
('ALU00039','Murilo Neto','910112273899',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2006-06-06','murilo.neto@email.com'),
('ALU00040','Nicole Assis','011223374900',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2004-02-28','nicole.assis@email.com'),

('ALU00041','Otavio Rego','122334475011',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2005-03-12','otavio.rego@email.com'),
('ALU00042','Priscila Gil','233445576122',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2003-07-19','priscila.gil@email.com'),
('ALU00043','Queiroz Lima','344556677233',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2005-09-25','queiroz.lima@email.com'),
('ALU00044','Renata Jure','455667778344',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2006-11-01','renata.jure@email.com'),
('ALU00045','Samuel Lira','566778879455',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2004-12-12','samuel.lira@email.com'),
('ALU00046','Tatiana Reis','677889980566',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2005-05-18','tatiana.reis@email.com'),
('ALU00047','Uriel Sampaio','788990091677',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2003-01-30','uriel.sampaio@email.com'),
('ALU00048','Vania Cortez','899001102788',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2006-04-14','vania.cortez@email.com'),
('ALU00049','William Piva','900112213899',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2005-10-27','william.piva@email.com'),
('ALU00050','Zuleica Dias','011223324900',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2004-08-05','zuleica.dias@email.com'),

('ALU00051','Andreia Melo','111111111112',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2005-02-15','andreia@email.com'),
('ALU00052','Bernardo Silva','222222222223',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2004-04-20','bernardo@email.com'),
('ALU00053','Cintia Ramos','333333333334',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2006-08-12','cintia@email.com'),
('ALU00054','Daniel Souza','444444444445',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2003-12-30','daniel@email.com'),
('ALU00055','Erica Fontes','555555555556',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2005-06-05','erica@email.com'),
('ALU00056','Felipe Neto','666666666667',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2004-10-18','felipe@email.com'),
('ALU00057','Glaucia Lima','777777777778',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2006-03-28','glaucia@email.com'),
('ALU00058','Helder Rosa','888888888889',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2005-11-10','helder@email.com'),
('ALU00059','Ingrid Fach','999999999990',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2004-07-25','ingrid@email.com'),
('ALU00060','Jonas Brother','000000000001',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2003-05-14','jonas@email.com'),

('ALU00061','Katia Maria','111122223331',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2005-09-30','katia@email.com'),
('ALU00062','Leonardo Di','222233334442',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2004-02-12','leo@email.com'),
('ALU00063','Michele Obam','333344445553',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2006-04-22','michele@email.com'),
('ALU00064','Natan Silva','444455556664',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2005-11-05','natan@email.com'),
('ALU00065','Otilia Cruz','555566667775',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2004-01-20','otilia@email.com'),
('ALU00066','Patrick Estrela','666677778886',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2003-07-15','patrick@email.com'),
('ALU00067','Quenia Rocha','777788889997',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2006-06-11','quenia@email.com'),
('ALU00068','Ronaldo Fen','888899990008',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2005-03-02','ronaldo@email.com'),
('ALU00069','Sabrina Sato','999900001119',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2004-05-09','sabrina@email.com'),
('ALU00070','Tadeu Schmi','000011112220',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2003-09-27','tadeu@email.com'),

('ALU00071','Ugo Santos','123123123121',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2005-12-14','ugo@email.com'),
('ALU00072','Valeria Valen','234234234232',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2004-03-19','valeria@email.com'),
('ALU00073','Walter White','345345345343',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2006-10-01','walter@email.com'),
('ALU00074','Xuxa Meneghel','456456456454',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2005-04-30','xuxa@email.com'),
('ALU00075','Yudi Tamashir','567567567565',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2004-06-15','yudi@email.com'),
('ALU00076','Zico Galinho','678678678676',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2003-11-10','zico@email.com'),
('ALU00077','Alane Dias','789789789787',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2005-02-01','alane@email.com'),
('ALU00078','Bia Reis','890890890898',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2006-11-25','bia@email.com'),
('ALU00079','Cezar Black','901901901909',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2004-08-07','cezar@email.com'),
('ALU00080','Davi Britto','012012012010',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2005-07-18','davi@email.com'),

('ALU00081','Elane Silva','210210210211',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2003-10-09','elane@email.com'),
('ALU00082','Fred Nicacio','321321321322',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2005-05-04','fred@email.com'),
('ALU00083','Gil Nogueira','432432432433',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2004-12-11','gil@email.com'),
('ALU00084','Hana Khalil','543543543544',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2006-02-20','hana@email.com'),
('ALU00085','Iris Stefan','654654654655',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2005-09-08','iris@email.com'),
('ALU00086','Juliette Fre','765765765766',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2004-11-15','juliette@email.com'),
('ALU00087','Kaysar Dad','876876876877',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2003-06-22','kaysar@email.com'),
('ALU00088','Luan Santana','987987987988',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2005-01-30','luan@email.com'),
('ALU00089','Manu Gavassi','098098098099',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2006-07-06','manu@email.com'),
('ALU00090','Naiara Aze','109109109100',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2004-03-28','naiara@email.com'),

('ALU00091','Prior Felipe','210210210210',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2005-04-12','prior@email.com'),
('ALU00092','Rafa Kaliman','321321321321',(SELECT id_cidade FROM Cidade WHERE nome='São Vicente'),'2003-08-19','rafa@email.com'),
('ALU00093','Sarah Andra','432432432432',(SELECT id_cidade FROM Cidade WHERE nome='Guarujá'),'2005-10-25','sarah@email.com'),
('ALU00094','Thelma Assis','543543543543',(SELECT id_cidade FROM Cidade WHERE nome='Praia Grande'),'2006-12-01','thelma@email.com'),
('ALU00095','Vyni Santos','654654654654',(SELECT id_cidade FROM Cidade WHERE nome='Cubatão'),'2004-01-12','vyni@email.com'),
('ALU00096','Wanessa Cam','765765765765',(SELECT id_cidade FROM Cidade WHERE nome='Bertioga'),'2005-06-18','wanessa@email.com'),
('ALU00097','Yasmim Brun','876876876876',(SELECT id_cidade FROM Cidade WHERE nome='Mongaguá'),'2003-02-28','yasmim@email.com'),
('ALU00098','Zenaide Mor','987987987987',(SELECT id_cidade FROM Cidade WHERE nome='Itanhaém'),'2006-05-14','zenaide@email.com'),
('ALU00099','Abel Ferreira','098098098098',(SELECT id_cidade FROM Cidade WHERE nome='Peruíbe'),'2005-11-27','abel@email.com'),
('ALU00100','Zico Junior','123456789012',(SELECT id_cidade FROM Cidade WHERE nome='Santos'),'2004-09-05','zicojr@email.com');
go

ALTER TABLE Aluno
ADD CONSTRAINT df_aluno_cidade
DEFAULT 5 FOR id_cidade;
go

insert into TipoCurso (nome) values ('Técnico'), ('Superior');
go

insert into Curso (nome, sigla, id_tipo) values
('Técnico de Informática','CTII',(select id_tipo from TipoCurso where nome='Técnico')),
('Técnico em Eventos','CTIE',(select id_tipo from TipoCurso where nome='Técnico')),
('Análise e Desenvolvimento de Sistemas','ADS',(select id_tipo from TipoCurso where nome='Superior')),
('Engenharia de Controle e Automação','ECA',(select id_tipo from TipoCurso where nome='Superior')),
('Técnico em Automação Industrial','CTA',(select id_tipo from TipoCurso where nome='Técnico')),
('Tecnologia em Automação Industrial','CSA',(select id_tipo from TipoCurso where nome='Superior')),
('Bacharelado em Turismo','TUR',(select id_tipo from TipoCurso where nome='Superior')),
('Licenciatura em Letras','LET',(select id_tipo from TipoCurso where nome='Superior'))
go

insert into Professor values
('CB000001','Jair Coletto','Coletto','coletto@ifsp.com','Mestre'),
('CB000002','Marco Aurélio','Marco','maurelio@ifsp.com','Doutor'),
('CB000003','Antônio Mendes','Antônio','antonio@ifsp.com','Especialista'),
('CB000004','Wellington Tuler','Tuler','tulermoraes@ifsp.com','Mestre'),
('CB000005','Matilde Quintairos','Matilde','matilde@ifsp.com','Mestre');
go

insert into Disciplina (nome,codigo,id_curso,prontuario_professor) values
('Banco de Dados 2','BDD2',(select id_curso from Curso where sigla='ADS'),'CB000001'),
('Engenharia de Software','ENGS',(select id_curso from Curso where sigla='ADS'),'CB000002'),
('Estrutura de Dados','EDD1',(select id_curso from Curso where sigla='ADS'),'CB000003'),
('Linguagem de Programação 1','LPR1',(select id_curso from Curso where sigla='ADS'),'CB000004'),
('Sistemas Operacionais','SIOP',(select id_curso from Curso where sigla='ADS'),'CB000005');
go

insert into Turma (nome,id_curso) values
('ADS371',(select id_curso from Curso where sigla='ADS')),
('ADS171',(select id_curso from Curso where sigla='ADS')),
('ADS571',(select id_curso from Curso where sigla='ADS'));
go

INSERT INTO Turma_Disciplina
SELECT t.id_turma, d.id_disciplina
FROM Turma t, Disciplina d
WHERE t.id_curso = d.id_curso;
go

INSERT INTO Matricula (prontuario,id_curso)
SELECT prontuario,(SELECT id_curso FROM Curso WHERE sigla='ADS')
FROM Aluno;
go

INSERT INTO Aluno_Turma VALUES
('ALU00001',1),
('ALU00002',2),
('ALU00003',3),
('ALU00004',1),
('ALU00005',2),
('ALU00006',3),
('ALU00007',1),
('ALU00008',2),
('ALU00009',3),
('ALU00010',1),
('ALU00011',2),
('ALU00012',3),
('ALU00013',1),
('ALU00014',2),
('ALU00015',3),
('ALU00016',1),
('ALU00017',2),
('ALU00018',3),
('ALU00019',1),
('ALU00020',2),
('ALU00021',3),
('ALU00022',1),
('ALU00023',2),
('ALU00024',3),
('ALU00025',1),
('ALU00026',2),
('ALU00027',3),
('ALU00028',1),
('ALU00029',2),
('ALU00030',3),
('ALU00031',1),
('ALU00032',2),
('ALU00033',3),
('ALU00034',1),
('ALU00035',2),
('ALU00036',3),
('ALU00037',1),
('ALU00038',2),
('ALU00039',3),
('ALU00040',1),
('ALU00041',2),
('ALU00042',3),
('ALU00043',1),
('ALU00044',2),
('ALU00045',3),
('ALU00046',1),
('ALU00047',2),
('ALU00048',3),
('ALU00049',1),
('ALU00050',2),
('ALU00051',3),
('ALU00052',1),
('ALU00053',2),
('ALU00054',3),
('ALU00055',1),
('ALU00056',2),
('ALU00057',3),
('ALU00058',1),
('ALU00059',2),
('ALU00060',3),
('ALU00061',1),
('ALU00062',2),
('ALU00063',3),
('ALU00064',1),
('ALU00065',2),
('ALU00066',3),
('ALU00067',1),
('ALU00068',2),
('ALU00069',3),
('ALU00070',1),
('ALU00071',2),
('ALU00072',3),
('ALU00073',1),
('ALU00074',2),
('ALU00075',3),
('ALU00076',1),
('ALU00077',2),
('ALU00078',3),
('ALU00079',1),
('ALU00080',2),
('ALU00081',3),
('ALU00082',1),
('ALU00083',2),
('ALU00084',3),
('ALU00085',1),
('ALU00086',2),
('ALU00087',3),
('ALU00088',1),
('ALU00089',2),
('ALU00090',3),
('ALU00091',1),
('ALU00092',2),
('ALU00093',3),
('ALU00094',1),
('ALU00095',2),
('ALU00096',3),
('ALU00097',1),
('ALU00098',2),
('ALU00099',3),
('ALU00100',1);
go

select * from Aluno;

select * from Turma;

select * from Professor;

select * from Curso;

select * from TipoCurso;

select * from Disciplina;




/*USE master
GO

ALTER DATABASE dbAcademico SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

DROP DATABASE dbAcademico;
GO*/
