use pedido_venda;

desc pedido;

select * from pedido;

select forma_pagamento as pagamento, sum(valor_total) as total
from pedido
group by forma_pagamento = 'DINHEIRO';


select date(data_criacao) as data, sum(valor_total) as total
from pedido
where forma_pagamento = ''
group by date(data_criacao);