SELECT 
	(songs.name) as cancao,
	COUNT(historic.songs_id) as reproducoes
FROM
	SpotifyClone.songs
INNER JOIN SpotifyClone.historic on songs_id = songs.id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;