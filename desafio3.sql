SELECT 
    usu.usuario AS usuario,
    COUNT(his.usuario_id) AS qt_de_musicas_ouvidas,
    ROUND(SUM(can.duracao_segundos)/60, 2) AS total_minutos
FROM
    SpotifyClone.usuario AS usu
        INNER JOIN
    SpotifyClone.historico_reproducoes AS his ON usu.usuario_id = his.usuario_id
        INNER JOIN
    SpotifyClone.cancoes AS can ON can.cancoes_id = his.cancoes_id
GROUP BY his.usuario_id , usu.usuario
ORDER BY usu.usuario;