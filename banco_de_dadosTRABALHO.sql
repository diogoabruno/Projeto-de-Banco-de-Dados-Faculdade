/* CRIANDO E USANDO O BANCO DE DADOS */
CREATE DATABASE trab_bd;
USE trab_bd;

/* CRIANDO AS TABELAS */
CREATE TABLE tbl_alunos
(ra_aluno INT PRIMARY KEY NOT NULL,
nome_aluno VARCHAR (100) NOT NULL,
tel_aluno BIGINT,
email_aluno VARCHAR (100),
endereco_aluno VARCHAR (200),
fk_turma_aluno INT
);

CREATE TABLE tbl_turmas
(id_turma INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
curso_turma VARCHAR (50) NOT NULL,
nome_turma VARCHAR (50) NOT NULL,
modalidade_turma VARCHAR (50) NOT NULL,
periodo_turma VARCHAR (50) NOT NULL,
qtd_alunos_turma INT,
fk_professor_turma INT
);

CREATE TABLE tbl_professores
(id_professor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_professor VARCHAR (100),
tel_professor BIGINT,
email_professor VARCHAR (100),
disciplina_professor VARCHAR (50)
);

/*  ADICIONANDO CONSTRAINT NAS TABELAS  */
ALTER TABLE tbl_turmas ADD CONSTRAINT FOREIGN KEY (fk_professor_turma) REFERENCES tbl_professores (id_professor);
ALTER TABLE tbl_alunos ADD CONSTRAINT FOREIGN KEY (fk_turma_aluno) REFERENCES tbl_turmas (id_turma);


/* INSERINDO DADOS NAS TABELAS */
INSERT INTO tbl_professores
(nome_professor, tel_professor, email_professor, disciplina_professor)
VALUES
('Matheus Melo', '974245223','matheusmelo123@gmail.com', 'Bando de Dados'),
('Osvaldo Silva', '938902844','osvaldosilva272@gmail.com', 'Python'),
('Marcos Motta', '974932255','mtmarcos544@hotmail.com', 'Estruturas de materiais'),
('Antonio Curry', '906673935','antonioc244@gmail.com', 'Atletismo'),
('Carol Mattoso', '962859249','carolm677@gmail.com', 'Anatomia'),
('Mariana Gomes', '952957792','mari.gomes@yahoo.com.br', 'Nutrição Aplicada'),
('Liliane Dias', '922670800','diasliliane@gmail.com', 'Português Jurídico'),
('Bruna Sampaio', '988722243','bruna.sp22@hotmail.com', 'Ética')
;

INSERT INTO tbl_turmas
(curso_turma, nome_turma, modalidade_turma, periodo_turma, qtd_alunos_turma, fk_professor_turma)
VALUES
('Análise e Desenvolvimento de Sistemas', 'ADS1', 'presencial', 'noite', '75', '2'),
('Análise e Desenvolvimento de Sistemas','ADS2', 'presencial', 'noite', '58', ' 1'),
('Engenharia Civil', 'EC1', 'EAD', 'manhã', '40', '3'),
('Educação Física', 'EF1', 'presencial', 'manhã', '60', ' 6'),
('Educação Física', 'EF2', 'presencial', 'noite', '75', '4'),
('Nutrição', 'NT1', 'EAD', 'manhã', '63', ' 5'),
('Advocacia', 'ADV1', 'EAD', 'manhã', '80', ' 8'),
('Advocacia', 'ADV2', 'presencial', 'noite', '61', '7')
;

INSERT INTO tbl_alunos
(ra_aluno, nome_aluno, tel_aluno, email_aluno, endereco_aluno, fk_turma_aluno)
VALUES
('91726', 'Diogo Alves', '961468287', 'diogobruno272@gmail.com','R Dr. Renato 233', '2'),
('93779', 'Gustavo Ferreira', '961496993', 'ferreiragu@gmail.com','Av Alameda 2445', '1'),
('54126', 'Glenda Gadelho', '958771499', 'gadelho577@hotmail.com','R Crítios 251', '7'),
('79648', 'Vinícius Santos', '958852468', 'viniciuss@gmail.com','R Jose da Silva Ribeiro 451', '4'),
('14897', 'Luan pereira', '940028922', 'luanp244@gmail.com','Av Guilherme Drumond 1135', '3'),
('56671', 'Flavio Augusto', '969954122', 'flavinho588@gmail.com','Av Dr Luiz Migliano 927', '5'),
('47822', 'Maria Carla', '9668885722', 'mcarla25@gmail.com','R Diogo Pereira 200', '6'),
('78914', 'Cássio Ramos', '959633147', 'rcassio12@gmail.com','R David Ben Gurion 955', '8'),
('66324', 'José Carlos', '998774355', 'josecar222@yahoo.com.br','R João Simões 740', '8')
;


/* MOSTRANDO AS TABELAS CONECTADAS */
SELECT tbl_alunos.ra_aluno,
tbl_alunos.nome_aluno,
tbl_turmas.curso_turma,
tbl_turmas.nome_turma,
tbl_turmas.modalidade_turma,
tbl_professores.nome_professor,
tbl_professores.disciplina_professor 
FROM tbl_alunos 
INNER JOIN tbl_turmas
ON tbl_alunos.fk_turma_aluno = tbl_turmas.id_turma
INNER JOIN tbl_professores 
ON tbl_turmas.fk_professor_turma = tbl_professores.id_professor;



