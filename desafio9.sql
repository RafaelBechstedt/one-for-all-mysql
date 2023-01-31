SELECT
    COUNT(historic.users_id) as quantidade_musicas_no_historico
FROM SpotifyClone.historic
INNER JOIN SpotifyClone.users on historic.users_id = users.id
WHERE users.name = 'Barbara Liskov';