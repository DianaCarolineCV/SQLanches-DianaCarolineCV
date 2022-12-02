SELECT
    p1.id,
    p1.status,
    p1.cliente_id,
    p2.id,
    p2.nome,
    p2.tipo,
    p2.preco,
    p2.pts_de_lealdade
FROM
    produtos_pedidos pp
    INNER JOIN pedidos p1 ON pp.pedido_id = p1.id
    INNER JOIN produtos p2 ON pp.produto_id = p2.id;

SELECT
    pp.pedido_id
FROM
    produtos_pedidos pp
    INNER JOIN produtos p2 ON pp.produto_id = p2.id
WHERE
    p2.nome LIKE 'Fritas';

SELECT
    c.nome
FROM
    produtos_pedidos pp
    INNER JOIN clientes c ON c.id = pp.pedido_id
    INNER JOIN produtos p2 ON pp.produto_id = p2.id
WHERE
    p2.nome LIKE 'Fritas';

SELECT
    ROUND(SUM(p1.preco) :: NUMERIC, 2) custo_total_pedidos
FROM
    produtos_pedidos pp
    INNER JOIN produtos p1 ON p1.id = pp.produto_id
    INNER JOIN clientes c ON c.id = pp.pedido_id
WHERE
    c.nome LIKE 'Laura';

SELECT
    nome,
    COUNT(*) count
FROM
    produtos_pedidos pp
    INNER JOIN produtos ON produtos.id = pp.produto_id
GROUP BY
    produtos.nome
ORDER BY
    nome ASC;