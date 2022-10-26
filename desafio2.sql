SELECT 
    COUNT(DISTINCT cancoes) AS cancoes,
    COUNT(DISTINCT artista) AS artistas,
    COUNT(DISTINCT album) AS albuns
FROM
    SpotifyClone.cancoes,
    SpotifyClone.artista,
    SpotifyClone.album;