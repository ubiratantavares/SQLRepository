use pedido_venda;

desc pedido;

select * from pedido;

select forma_pagamento as pagamento, avg(valor_total) as media
from pedido
group by forma_pagamento;

select date(data_criacao) as data, avg(valor_total) as media
from pedido
where forma_pagamento = 'DINHEIRO'
group by date(data_criacao)
