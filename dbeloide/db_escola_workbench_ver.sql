CREATE TABLE Aluno (
  idaluno INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  responsavel_idresponsavel INTEGER UNSIGNED NOT NULL,
  nome VARCHAR(45) NULL,
  fone INTEGER UNSIGNED NULL,
  PRIMARY KEY(idaluno),
  INDEX aluno_FKIndex1(responsavel_idresponsavel)
);

CREATE TABLE Materia (
  idmateria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  PRIMARY KEY(idmateria)
);

CREATE TABLE Matricula (
  ano INTEGER UNSIGNED NOT NULL,
  aluno_idaluno INTEGER UNSIGNED NOT NULL,
  tpm_id_turma INTEGER UNSIGNED,
  PRIMARY KEY(ano, aluno_idaluno),
  INDEX matricula_FKIndex1(aluno_idaluno)
);

CREATE TABLE Mensalidade (
  idmensalidade INTEGER NOT NULL AUTO_INCREMENT,
  matricula_aluno_idaluno INTEGER UNSIGNED NOT NULL,
  matricula_ano INTEGER UNSIGNED NOT NULL,
  mensalidade INTEGER UNSIGNED NOT NULL,
  m1 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m2 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m3 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m4 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m5 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m6 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m7 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m8 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m9 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m10 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m11 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  m12 INTEGER UNSIGNED NOT NULL DEFAULT 0,
  data_pgto INTEGER UNSIGNED NULL,
  ano INTEGER UNSIGNED NULL,
  PRIMARY KEY(idmensalidade),
  INDEX mensalidade_FKIndex1(matricula_ano, matricula_aluno_idaluno)
);

CREATE TABLE Nota (
  idnota INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  b1 INTEGER UNSIGNED NULL,
  b2 INTEGER UNSIGNED NULL,
  b3 INTEGER UNSIGNED NULL,
  b4 INTEGER UNSIGNED NULL,
  r1 INTEGER UNSIGNED NULL,
  r2 INTEGER UNSIGNED NULL,
  PRIMARY KEY(idnota)
);

CREATE TABLE Professor (
  idprofessor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  PRIMARY KEY(idprofessor)
);

CREATE TABLE Responsavel (
  idresponsavel INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NULL,
  fone INTEGER UNSIGNED NULL,
  endereco VARCHAR(20) NULL,
  PRIMARY KEY(idresponsavel)
);

CREATE TABLE Turma_professor_materia (
  id_turma INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  materia_idmateria INTEGER UNSIGNED NOT NULL,
  professor_idprofessor INTEGER UNSIGNED NOT NULL,
  ano_turma INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_turma, materia_idmateria, professor_idprofessor),
  INDEX turma_professor_materia_FKIndex1(professor_idprofessor),
  INDEX turma_professor_materia_FKIndex2(materia_idmateria)
);

CREATE TABLE turma_professor_materia_has_matricula (
  turma_professor_materia_professor_idprofessor INTEGER UNSIGNED NOT NULL,
  turma_professor_materia_materia_idmateria INTEGER UNSIGNED NOT NULL,
  turma_professor_materia_id_turma INTEGER UNSIGNED NOT NULL,
  matricula_aluno_idaluno INTEGER UNSIGNED NOT NULL,
  matricula_ano INTEGER UNSIGNED NOT NULL,
  nota_idnota INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(turma_professor_materia_professor_idprofessor, turma_professor_materia_materia_idmateria, turma_professor_materia_id_turma, matricula_aluno_idaluno, matricula_ano),
  INDEX turma_professor_materia_has_matricula_FKIndex1(turma_professor_materia_id_turma, turma_professor_materia_materia_idmateria, turma_professor_materia_professor_idprofessor),
  INDEX turma_professor_materia_has_matricula_FKIndex2(matricula_ano, matricula_aluno_idaluno),
  INDEX turma_professor_materia_has_matricula_FKIndex3(nota_idnota)
);

ALTER TABLE Aluno 
ADD CONSTRAINT parentesco FOREIGN KEY (responsavel_idresponsavel) 
REFERENCES Responsavel (idresponsavel);

ALTER TABLE Matricula 
ADD CONSTRAINT matriculado FOREIGN KEY (aluno_idaluno) 
REFERENCES Aluno (idaluno);

ALTER TABLE Matricula 
ADD CONSTRAINT matriculadoturma FOREIGN KEY (tpm_id_turma) 
REFERENCES Turma_professor_materia (id_turma);

ALTER TABLE Mensalidade
ADD CONSTRAINT anual FOREIGN KEY (matricula_ano) 
REFERENCES Matricula (ano);

ALTER TABLE Mensalidade
ADD CONSTRAINT MensalidadeAluno FOREIGN KEY (matricula_aluno_idaluno) 
REFERENCES Matricula (aluno_idaluno);

ALTER TABLE Turma_professor_materia
ADD CONSTRAINT turmas FOREIGN KEY (materia_idmateria) 
REFERENCES Materia (idmateria);

ALTER TABLE Turma_professor_materia
ADD CONSTRAINT leciona FOREIGN KEY (professor_idprofessor) 
REFERENCES Professor (idprofessor);

ALTER TABLE turma_professor_materia_has_matricula
ADD CONSTRAINT ensina FOREIGN KEY (turma_professor_materia_professor_idprofessor) 
REFERENCES Turma_professor_materia (professor_idprofessor);

ALTER TABLE turma_professor_materia_has_matricula
ADD CONSTRAINT ensinada FOREIGN KEY (turma_professor_materia_materia_idmateria) 
REFERENCES Turma_professor_materia (materia_idmateria);

ALTER TABLE turma_professor_materia_has_matricula
ADD CONSTRAINT titular FOREIGN KEY (turma_professor_materia_id_turma) 
REFERENCES Turma_professor_materia (id_turma);

ALTER TABLE turma_professor_materia_has_matricula
ADD CONSTRAINT emdia FOREIGN KEY (matricula_ano) 
REFERENCES Matricula (ano);

ALTER TABLE turma_professor_materia_has_matricula
ADD CONSTRAINT estuda FOREIGN KEY (matricula_aluno_idaluno) 
REFERENCES Matricula (aluno_idaluno);

ALTER TABLE turma_professor_materia_has_matricula
ADD CONSTRAINT notas FOREIGN KEY (nota_idnota) 
REFERENCES Nota (idnota);
