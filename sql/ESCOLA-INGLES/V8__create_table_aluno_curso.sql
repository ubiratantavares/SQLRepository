-- criando a tabela aluno_curso
use escola_ingles;

create table aluno_curso (
   aluno_id bigint,
   curso_id bigint,
   ano integer,
   primary key (aluno_id, curso_id),
   foreign key (aluno_id) references aluno(id),
   foreign key (curso_id) references curso(id)
) engine=InnoDB;