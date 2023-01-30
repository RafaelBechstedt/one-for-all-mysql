SELECT 
	COUNT(DISTINCT songs.id) as cancoes,
	COUNT(DISTINCT artists.id) as artistas,
	COUNT(DISTINCT albuns.id) as albuns
FROM
	SpotifyClone.songs, SpotifyClone.artists, SpotifyClone.albuns;