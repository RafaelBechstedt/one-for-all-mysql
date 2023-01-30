SELECT 
	(users.name) as usuario,
	COUNT(historic.id) as qt_de_musicas_ouvidas,
	ROUND(SUM(songs.duration_sec/60), 2) as total_minutos
FROM
	SpotifyClone.users
INNER JOIN SpotifyClone.historic on users.id = historic.users_id
INNER JOIN SpotifyClone.songs on songs.id = historic.songs_id
GROUP BY users.name
ORDER BY users.name ASC;