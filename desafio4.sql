SELECT 
	(users.name) as usuario,
	IF(MAX(historic.playback_date) >= '2021-01-01', 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM
	SpotifyClone.users
INNER JOIN SpotifyClone.historic on users.id = historic.users_id
GROUP BY users.name
ORDER BY users.name ASC;