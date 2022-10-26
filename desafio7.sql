SELECT 
    art.artista AS artista,
    alb.album AS album,
    COUNT(seg.usuario_id) AS seguidores
FROM
    SpotifyClone.artista AS art
        INNER JOIN
    SpotifyClone.album AS alb ON alb.artista_id = art.artista_id
        INNER JOIN
    SpotifyClone.artistas_seguidos AS seg ON seg.artista_id = art.artista_id
GROUP BY seg.artista_id , alb.album
ORDER BY seguidores DESC , artista , album;