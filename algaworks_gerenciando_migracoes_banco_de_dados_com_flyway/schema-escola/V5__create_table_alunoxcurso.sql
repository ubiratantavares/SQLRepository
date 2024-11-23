-- criando a tabela aluno_curso
create table alunoxcurso (
   aluno_id bigint,
   curso_id bigint,
   ano int,
   primary key (aluno_id, curso_id),
   foreign key (aluno_id) references aluno(id),
   foreign key (curso_id) references curso(id)
) engine=InnoDB;
