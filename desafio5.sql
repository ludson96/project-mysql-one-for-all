SELECT 
can.cancoes AS cancao,
COUNT(his.cancoes_id) AS reproducoes
FROM SpotifyClone.cancoes as can
INNER JOIN SpotifyClone.historico_reproducoes as his
ON his.cancoes_id = can.cancoes_id
GROUP BY cancoes
ORDER BY reproducoes DESC, cancao
LIMIT 2;