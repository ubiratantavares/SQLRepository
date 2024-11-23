-- Alterando a tabela curso
alter table curso
add column professor_id bigint,
add constraint fk_professor_id foreign key(professor_id) references professor(id);

