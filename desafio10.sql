SELECT 
    can.cancoes AS nome, COUNT(his.cancoes_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS can
        INNER JOIN
    SpotifyClone.historico_reproducoes AS his ON can.cancoes_id = his.cancoes_id
        INNER JOIN
    SpotifyClone.usuario AS usu ON usu.usuario_id = his.usuario_id
        INNER JOIN
    SpotifyClone.plano AS pla ON pla.plano_id = usu.plano_id
WHERE
    pla.plano = 'gratuito'
        OR pla.plano = 'pessoal'
GROUP BY his.cancoes_id , nome
ORDER BY nome;
