SELECT 
	artists.name as artista,
    albuns.album_name as album
FROM SpotifyClone.artists
INNER JOIN SpotifyClone.albuns on artists.id = albuns.artists_id
WHERE artists.name = 'Elis Regina'
ORDER BY album;