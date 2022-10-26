SELECT 
    COUNT(his.usuario_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.historico_reproducoes AS his
        INNER JOIN
    SpotifyClone.usuario AS usu ON his.usuario_id = usu.usuario_id
WHERE usu.usuario = 'Barbara Liskov'
GROUP BY his.usuario_id;