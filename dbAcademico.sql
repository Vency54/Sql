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
	id_disciplina int PRIMARY KEY,
	nome varchar(50) NOT NULL,
	código char(10) UNIQUE NOT NULL,
	id_curso INT not null,
	CONSTRAINT fk_Disciplina_Curso FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);
go

create table Aluno(
prontuario char(8) Primary Key,
nome varchar(50) not null,
cpf char(12) not null unique,
cidade varchar(30),
dt_nasc date not null,
email varchar(100) not null unique,
constraint ck_idade Check(datediff(year,dt_nasc,getdate()) >= 14)
);
go

create table Turma(
id_turma INT Primary Key,
nome varchar(10) not null,
id_curso INT not null,
constraint fk_turma_curso Foreign Key (id_curso) references Curso(id_curso)
);
go

INSERT INTO Aluno (prontuario, nome, cpf, cidade, dt_nasc, email) VALUES
('ALU00001', 'Ana Silva', '111222333441', 'Santos', '2005-01-15', 'ana.silva@email.com'),
('ALU00002', 'Bruno Oliveira', '222333444552', 'São Vicente', '2004-03-20', 'bruno.oliveira@email.com'),
('ALU00003', 'Carla Souza', '333444555663', 'Guarujá', '2006-07-12', 'carla.souza@email.com'),
('ALU00004', 'Diego Santos', '444555666774', 'Praia Grande', '2003-11-30', 'diego.santos@email.com'),
('ALU00005', 'Elena Martins', '555666777885', 'Cubatão', '2005-05-05', 'elena.martins@email.com'),
('ALU00006', 'Fabio Costa', '666777888996', 'Bertioga', '2004-09-18', 'fabio.costa@email.com'),
('ALU00007', 'Gisele Rocha', '777888999007', 'Mongaguá', '2006-02-28', 'gisele.rocha@email.com'),
('ALU00008', 'Hugo Ferreira', '888999000118', 'Itanhaém', '2005-12-10', 'hugo.ferreira@email.com'),
('ALU00009', 'Iara Lima', '999000111229', 'Peruíbe', '2004-06-25', 'iara.lima@email.com'),
('ALU00010', 'João Pereira', '000111222330', 'Santos', '2003-04-14', 'joao.pereira@email.com'),
('ALU00011', 'Karen Alves', '121232342451', 'São Vicente', '2005-08-30', 'karen.alves@email.com'),
('ALU00012', 'Lucas Ramos', '232343453562', 'Guarujá', '2004-01-12', 'lucas.ramos@email.com'),
('ALU00013', 'Marina Dias', '343454564673', 'Praia Grande', '2006-03-22', 'marina.dias@email.com'),
('ALU00014', 'Nuno Gomes', '454565675784', 'Cubatão', '2005-10-05', 'nuno.gomes@email.com'),
('ALU00015', 'Olivia Castro', '565676786895', 'Bertioga', '2004-12-20', 'olivia.castro@email.com'),
('ALU00016', 'Paulo Moraes', '676787897906', 'Mongaguá', '2003-06-15', 'paulo.moraes@email.com'),
('ALU00017', 'Quiteria Luz', '787898908017', 'Itanhaém', '2006-05-11', 'quiteria.luz@email.com'),
('ALU00018', 'Ricardo Vaz', '898909019128', 'Peruíbe', '2005-02-02', 'ricardo.vaz@email.com'),
('ALU00019', 'Sara Nunes', '909010120239', 'Santos', '2004-04-09', 'sara.nunes@email.com'),
('ALU00020', 'Tiago Belo', '010121231340', 'São Vicente', '2003-08-27', 'tiago.belo@email.com'),
('ALU00021', 'Ursula Meire', '112233445561', 'Guarujá', '2005-11-14', 'ursula.meire@email.com'),
('ALU00022', 'Victor Hugo', '223344556672', 'Praia Grande', '2004-02-19', 'victor.hugo@email.com'),
('ALU00023', 'Wendy Luz', '334455667783', 'Cubatão', '2006-09-01', 'wendy.luz@email.com'),
('ALU00024', 'Xavier Lima', '445566778894', 'Bertioga', '2005-03-31', 'xavier.lima@email.com'),
('ALU00025', 'Yara Flor', '556677889905', 'Mongaguá', '2004-05-15', 'yara.flor@email.com'),
('ALU00026', 'Zeca Silva', '667788990016', 'Itanhaém', '2003-10-10', 'zeca.silva@email.com'),
('ALU00027', 'Arthur Pires', '778899001127', 'Peruíbe', '2005-01-01', 'arthur.pires@email.com'),
('ALU00028', 'Beatriz Rosa', '889900112238', 'Santos', '2006-12-25', 'beatriz.rosa@email.com'),
('ALU00029', 'Caio Ribeiro', '990011223349', 'São Vicente', '2004-07-07', 'caio.ribeiro@email.com'),
('ALU00030', 'Dandara Paz', '001122334450', 'Guarujá', '2005-06-18', 'dandara.paz@email.com'),
('ALU00031', 'Eduardo Lins', '102938475611', 'Praia Grande', '2003-09-09', 'eduardo.lins@email.com'),
('ALU00032', 'Fernanda Mota', '203948576122', 'Cubatão', '2005-04-04', 'fernanda.mota@email.com'),
('ALU00033', 'Gabriel Farias', '304958677233', 'Bertioga', '2004-11-11', 'gabriel.farias@email.com'),
('ALU00034', 'Heloisa Guerra', '405968778344', 'Mongaguá', '2006-01-20', 'heloisa.guerra@email.com'),
('ALU00035', 'Igor Marques', '506978879455', 'Itanhaém', '2005-08-08', 'igor.marques@email.com'),
('ALU00036', 'Julia Borges', '607989970566', 'Peruíbe', '2004-10-15', 'julia.borges@email.com'),
('ALU00037', 'Kleber Toledo', '708990071677', 'Santos', '2003-05-22', 'kleber.toledo@email.com'),
('ALU00038', 'Larissa Vale', '809001172788', 'São Vicente', '2005-12-30', 'larissa.vale@email.com'),
('ALU00039', 'Murilo Neto', '910112273899', 'Guarujá', '2006-06-06', 'murilo.neto@email.com'),
('ALU00040', 'Nicole Assis', '011223374900', 'Praia Grande', '2004-02-28', 'nicole.assis@email.com'),
('ALU00041', 'Otavio Rego', '122334475011', 'Cubatão', '2005-03-12', 'otavio.rego@email.com'),
('ALU00042', 'Priscila Gil', '233445576122', 'Bertioga', '2003-07-19', 'priscila.gil@email.com'),
('ALU00043', 'Queiroz Lima', '344556677233', 'Mongaguá', '2005-09-25', 'queiroz.lima@email.com'),
('ALU00044', 'Renata Jure', '455667778344', 'Itanhaém', '2006-11-01', 'renata.jure@email.com'),
('ALU00045', 'Samuel Lira', '566778879455', 'Peruíbe', '2004-12-12', 'samuel.lira@email.com'),
('ALU00046', 'Tatiana Reis', '677889980566', 'Santos', '2005-05-18', 'tatiana.reis@email.com'),
('ALU00047', 'Uriel Sampaio', '788990091677', 'São Vicente', '2003-01-30', 'uriel.sampaio@email.com'),
('ALU00048', 'Vania Cortez', '899001102788', 'Guarujá', '2006-04-14', 'vania.cortez@email.com'),
('ALU00049', 'William Piva', '900112213899', 'Praia Grande', '2005-10-27', 'william.piva@email.com'),
('ALU00050', 'Zuleica Dias', '011223324900', 'Cubatão', '2004-08-05', 'zuleica.dias@email.com'),
('ALU00051', 'Andreia Melo', '111111111112', 'Bertioga', '2005-02-15', 'andreia@email.com'),
('ALU00052', 'Bernardo Silva', '222222222223', 'Mongaguá', '2004-04-20', 'bernardo@email.com'),
('ALU00053', 'Cintia Ramos', '333333333334', 'Itanhaém', '2006-08-12', 'cintia@email.com'),
('ALU00054', 'Daniel Souza', '444444444445', 'Peruíbe', '2003-12-30', 'daniel@email.com'),
('ALU00055', 'Erica Fontes', '555555555556', 'Santos', '2005-06-05', 'erica@email.com'),
('ALU00056', 'Felipe Neto', '666666666667', 'São Vicente', '2004-10-18', 'felipe@email.com'),
('ALU00057', 'Glaucia Lima', '777777777778', 'Guarujá', '2006-03-28', 'glaucia@email.com'),
('ALU00058', 'Helder Rosa', '888888888889', 'Praia Grande', '2005-11-10', 'helder@email.com'),
('ALU00059', 'Ingrid Fach', '999999999990', 'Cubatão', '2004-07-25', 'ingrid@email.com'),
('ALU00060', 'Jonas Brother', '000000000001', 'Bertioga', '2003-05-14', 'jonas@email.com'),
('ALU00061', 'Katia Maria', '111122223331', 'Mongaguá', '2005-09-30', 'katia@email.com'),
('ALU00062', 'Leonardo Di', '222233334442', 'Itanhaém', '2004-02-12', 'leo@email.com'),
('ALU00063', 'Michele Obam', '333344445553', 'Peruíbe', '2006-04-22', 'michele@email.com'),
('ALU00064', 'Natan Silva', '444455556664', 'Santos', '2005-11-05', 'natan@email.com'),
('ALU00065', 'Otilia Cruz', '555566667775', 'São Vicente', '2004-01-20', 'otilia@email.com'),
('ALU00066', 'Patrick Estrela', '666677778886', 'Guarujá', '2003-07-15', 'patrick@email.com'),
('ALU00067', 'Quenia Rocha', '777788889997', 'Praia Grande', '2006-06-11', 'quenia@email.com'),
('ALU00068', 'Ronaldo Fen', '888899990008', 'Cubatão', '2005-03-02', 'ronaldo@email.com'),
('ALU00069', 'Sabrina Sato', '999900001119', 'Bertioga', '2004-05-09', 'sabrina@email.com'),
('ALU00070', 'Tadeu Schmi', '000011112220', 'Mongaguá', '2003-09-27', 'tadeu@email.com'),
('ALU00071', 'Ugo Santos', '123123123121', 'Itanhaém', '2005-12-14', 'ugo@email.com'),
('ALU00072', 'Valeria Valen', '234234234232', 'Peruíbe', '2004-03-19', 'valeria@email.com'),
('ALU00073', 'Walter White', '345345345343', 'Santos', '2006-10-01', 'walter@email.com'),
('ALU00074', 'Xuxa Meneghel', '456456456454', 'São Vicente', '2005-04-30', 'xuxa@email.com'),
('ALU00075', 'Yudi Tamashir', '567567567565', 'Guarujá', '2004-06-15', 'yudi@email.com'),
('ALU00076', 'Zico Galinho', '678678678676', 'Praia Grande', '2003-11-10', 'zico@email.com'),
('ALU00077', 'Alane Dias', '789789789787', 'Cubatão', '2005-02-01', 'alane@email.com'),
('ALU00078', 'Bia Reis', '890890890898', 'Bertioga', '2006-11-25', 'bia@email.com'),
('ALU00079', 'Cezar Black', '901901901909', 'Mongaguá', '2004-08-07', 'cezar@email.com'),
('ALU00080', 'Davi Britto', '012012012010', 'Itanhaém', '2005-07-18', 'davi@email.com'),
('ALU00081', 'Elane Silva', '210210210211', 'Peruíbe', '2003-10-09', 'elane@email.com'),
('ALU00082', 'Fred Nicacio', '321321321322', 'Santos', '2005-05-04', 'fred@email.com'),
('ALU00083', 'Gil Nogueira', '432432432433', 'São Vicente', '2004-12-11', 'gil@email.com'),
('ALU00084', 'Hana Khalil', '543543543544', 'Guarujá', '2006-02-20', 'hana@email.com'),
('ALU00085', 'Iris Stefan', '654654654655', 'Praia Grande', '2005-09-08', 'iris@email.com'),
('ALU00086', 'Juliette Fre', '765765765766', 'Cubatão', '2004-11-15', 'juliette@email.com'),
('ALU00087', 'Kaysar Dad', '876876876877', 'Bertioga', '2003-06-22', 'kaysar@email.com'),
('ALU00088', 'Luan Santana', '987987987988', 'Mongaguá', '2005-01-30', 'luan@email.com'),
('ALU00089', 'Manu Gavassi', '098098098099', 'Itanhaém', '2006-07-06', 'manu@email.com'),
('ALU00090', 'Naiara Aze', '109109109100', 'Peruíbe', '2004-03-28', 'naiara@email.com'),
('ALU00091', 'Prior Felipe', '210210210210', 'Santos', '2005-04-12', 'prior@email.com'),
('ALU00092', 'Rafa Kaliman', '321321321321', 'São Vicente', '2003-08-19', 'rafa@email.com'),
('ALU00093', 'Sarah Andra', '432432432432', 'Guarujá', '2005-10-25', 'sarah@email.com'),
('ALU00094', 'Thelma Assis', '543543543543', 'Praia Grande', '2006-12-01', 'thelma@email.com'),
('ALU00095', 'Vyni Santos', '654654654654', 'Cubatão', '2004-01-12', 'vyni@email.com'),
('ALU00096', 'Wanessa Cam', '765765765765', 'Bertioga', '2005-06-18', 'wanessa@email.com'),
('ALU00097', 'Yasmim Brun', '876876876876', 'Mongaguá', '2003-02-28', 'yasmim@email.com'),
('ALU00098', 'Zenaide Mor', '987987987987', 'Itanhaém', '2006-05-14', 'zenaide@email.com'),
('ALU00099', 'Abel Ferreira', '098098098098', 'Peruíbe', '2005-11-27', 'abel@email.com'),
('ALU00100', 'Zico Junior', '123456789012', 'Santos', '2004-09-05', 'zicojr@email.com');
go

alter table Aluno add constraint df_Aluno_Cidade default 'Cubatão' for Cidade;
go

insert into TipoCurso (nome) values ('Técnico'), ('Superior');
go

insert into Curso (nome, sigla, id_tipo) values ('Técnico de Informática','CTII',(select id_tipo from TipoCurso where nome = 'Técnico'));
go

insert into Curso (nome, sigla, id_tipo) values ('Técnico em Eventos','CTIE',(select id_tipo from TipoCurso where nome = 'Técnico'));

go

insert into Curso (nome, sigla, id_tipo) values ('Análise em Densevolvimento de Sistemas','ADS',(select id_tipo from TipoCurso where nome = 'Superior'));

go

insert into Curso (nome, sigla, id_tipo) values ('Engenharia de Controle e Automação','ECA',(select id_tipo from TipoCurso where nome = 'Superior'));

go

insert into Curso (nome, sigla, id_tipo) values ('Técnico em Automação Industrial','CTA',(select id_tipo from TipoCurso where nome = 'Técnico'));

go

insert into Curso (nome, sigla, id_tipo) values ('Tecnologia em Automação Industrial','CSA',(select id_tipo from TipoCurso where nome = 'Superior'));

go

insert into Curso (nome, sigla, id_tipo) values ('Bacharelado em Turismo','TUR',(select id_tipo from TipoCurso where nome = 'Superior'));


go

insert into Curso (nome, sigla, id_tipo) values ('Licenciatura em Letras','LET',(select id_tipo from TipoCurso where nome = 'Superior'));

go

insert into Curso (nome, sigla, id_tipo) values ('Licenciatura em Matemática','LMA',(select id_tipo from TipoCurso where nome = 'Superior'));

go

select * from Aluno;

--Drop database dbAcademico;

