SELECT
    MIN(memberships.price) as faturamento_minimo,
    MAX(memberships.price) as faturamento_maximo,
    ROUND(AVG(memberships.price), 2) as faturamento_medio,
    ROUND(SUM(memberships.price), 2) as faturamento_total
FROM SpotifyClone.memberships
    INNER JOIN SpotifyClone.users on memberships.id = users.memberships_id