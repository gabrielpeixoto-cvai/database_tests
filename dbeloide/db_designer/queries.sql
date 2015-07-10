SELECT turma, nome AS reprovados, b1, b2, b3, b4, ((b1+b2+b3+b4)/4) AS media 
FROM aluno, nota, matricula  
WHERE idaluno=aluno_idaluno AND idaluno=idnota AND ((b1+b2+b3+b4)/4)<7;
