SELECT
C.cancao AS cancao,
COUNT(H.cancao_id) AS reproducoes
FROM
SpotifyClone.tb_cancoes AS C
INNER JOIN
SpotifyClone.tb_historico_de_reproducoes AS H
ON H.cancao_id = C.cancao_id
GROUP BY
H.cancao_id
ORDER BY
reproducoes DESC, cancao ASC
LIMIT 2
