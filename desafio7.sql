SELECT
    artists.name as artista,
    albuns.album_name as album,
    COUNT(following_artists.artists_id) as seguidores

FROM SpotifyClone.artists
INNER JOIN SpotifyClone.albuns on artists.id = albuns.artists_id
INNER JOIN SpotifyClone.following_artists on artists.id = following_artists.artists_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;