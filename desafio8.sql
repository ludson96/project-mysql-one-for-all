SELECT 
    art.artista AS artista, alb.album AS album
FROM
    SpotifyClone.artista AS art
        INNER JOIN
    SpotifyClone.album AS alb ON art.artista_id = alb.artista_id
HAVING artista = 'Elis Regina'
ORDER BY album;