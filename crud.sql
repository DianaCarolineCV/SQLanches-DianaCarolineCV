INSERT INTO
    clientes (nome, lealdade)
VALUES
    ('Georgia', 0);

INSERT INTO
    pedidos (status, cliente_id)
VALUES
    ('Recebido', 6);

INSERT INTO
    produtos_pedidos (pedido_id, produto_id)
VALUES
    (6, 1),
    (6, 2),
    (6, 6),
    (6, 8),
    (6, 8);

SELECT
    c.id,
    c.nome,
    c.lealdade,
    p1.id,
    p1.status,
    p1.cliente_id,
    p2.id,
    p2.nome,
    p2.tipo,
    ROUND((p2.preco) :: NUMERIC, 2),
    p2.pts_de_lealdade
FROM
    produtos_pedidos pp
    INNER JOIN pedidos p1 ON p1.id = pp.pedido_id
    INNER JOIN produtos p2 ON p2.id = pp.produto_id
    INNER JOIN clientes c ON c.id = pp.pedido_id
WHERE
    c.nome LIKE 'Georgia';

UPDATE
    clientes
SET
    lealdade = (
        SELECT
            SUM(p2.pts_de_lealdade)
        FROM
            produtos_pedidos pp
            INNER JOIN pedidos p1 ON p1.id = pp.pedido_id
            INNER JOIN produtos p2 ON p2.id = pp.produto_id
            INNER JOIN clientes c ON c.id = pp.pedido_id
        WHERE
            c.nome LIKE 'Georgia'
    )
WHERE
    clientes.nome LIKE 'Georgia';

DELETE FROM
    clientes
WHERE
    clientes.nome = 'Marcelo' RETURNING *;