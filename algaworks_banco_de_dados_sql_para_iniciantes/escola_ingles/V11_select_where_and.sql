-- Consulta os nomes dos alunos que fizeram matrícula no ano de 2014.

select  a.nome
from aluno a, curso c, aluno_curso ac
where a.id = ac.aluno_id
and c.id = ac.curso_id
and ac.ano = '2014';

-- Consulta os nomes dos cursos de um determinado professor.

select c.descricao
from curso c, professor p
where c.professor_id = p.id
and p.nome = 'Joao da Silva';

-- Consulta os nomes dos alunos de um determinado curso.

select a.nome
from aluno a, curso c, aluno_curso ac
where a.id = ac.aluno_id
and c.id = ac.curso_id
and c.descricao = 'Curso de Java Básico';

select * from aluno;
select * from curso;
select * from aluno_curso;

-- Consulta os nomes dos cursos de um determinado aluno
select  c.descricao, c.carga_horaria
from aluno a, curso c, aluno_curso ac
where a.id = ac.aluno_id
and c.id = ac.curso_id
and a.nome = 'Paulo Tavares';
