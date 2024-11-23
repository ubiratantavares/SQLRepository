-- Trabalhando com indices

-- Observe a coluna type com o valor ALL (todos)
explain 
select * from cliente 
where nome = 'João Silva';
  
-- Altera a tabela cliente para adicionar uma indexacao pelo nome
alter table cliente
add index ix_nome (nome);

-- Observe a coluna type agora com o valor ref
-- A busca agora pelo nome será mais rapida melhorando a performance na consulta
explain 
select * from cliente 
where nome = 'João Silva';