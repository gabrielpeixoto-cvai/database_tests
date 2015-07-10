/*folha de frequencia*/
SELECT DISTINCT a.nome AS aluno, m.ano AS ano, m.tpm_id_turma AS turma, p.nome AS professor, mat.nome AS materia
FROM Aluno a, Matricula m, Professor p, Materia mat, Turma_professor_materia tpm
WHERE a.idaluno=m.aluno_idaluno AND mat.idmateria=tpm.materia_idmateria AND m.tpm_id_turma=tpm.id_turma 
AND p.idprofessor=tpm.professor_idprofessor
GROUP BY a.nome;

/*Boletim de notas*/
SELECT DISTINCT a.nome AS aluno, n.b1 AS B1, n.b2 AS B2
FROM Aluno a, Nota n, turma_professor_materia_has_matricula tpmm
WHERE tpmm.nota_idnota=n.idnota AND a.idaluno=tpmm.matricula_aluno_idaluno;

/*historico cumulativo*/
SELECT a.nome AS aluno, n.b1 AS B1, n.b2 AS B2, tpmm.matricula_ano
FROM Aluno a, Nota n, turma_professor_materia_hAS_matricula tpmm
WHERE tpmm.nota_idnota=n.idnota AND a.idaluno=tpmm.matricula_aluno_idaluno;

/* RE4 total de alunos em recuperação por turma*/
SELECT m.tpm_id_turma as turma, count(a.nome) AS reprovados, b1, b2, b3, b4, ((b1+b2+b3+b4)/4) AS media 
FROM Aluno a, Nota n, Matricula m  
WHERE idaluno=aluno_idaluno AND idaluno=idnota AND ((b1+b2+b3+b4)/4)<7
GROUP BY m.tpm_id_turma;


/* RE5 Emitir boletos, com endereço dos responsáveis*/
SELECT m.mensalidade AS mensalidade, r.nome AS titular, r.endereco AS endereco, a.nome AS aluno
FROM Mensalidade m, Aluno a, Responsavel r, Matricula mat
WHERE a.responsavel_idresponsavel=r.idresponsavel AND mat.aluno_idaluno=a.idaluno AND m.matricula_aluno_idaluno=a.idaluno AND r.nome='eddard';

/* RE6 Emitir extrato do ano*/
SELECT m.m1 AS janeiro, m.m2 AS fevereiro, m.m3 AS marco, m.m4 AS abril, m.m5 AS maio, m.m6 AS junho, m.m7 AS julho, 
m.m8 AS agosto, m.m9 AS setembro, m.m10 AS outubro, m.m11 AS novembro, m.m12 AS dezembro, r.nome AS titular, m.ano
FROM Mensalidade m, Responsavel r, Aluno a, Matricula mat
WHERE a.responsavel_idresponsavel=r.idresponsavel AND mat.aluno_idaluno=a.idaluno AND m.matricula_aluno_idaluno=a.idaluno AND r.nome='jon';