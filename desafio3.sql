SELECT
U.usuario AS usuario,
COUNT(H.usuario_id) AS qtde_musicas_ouvidas,
ROUND(SUM(C.duracao_segundos/60), 2) AS total_minutos
FROM
SpotifyClone.tb_historico_de_reproducoes AS H
INNER JOIN
SpotifyClone.tb_usuario AS U ON H.usuario_id = U.usuario_id
INNER JOIN
SpotifyClone.tb_cancoes AS C ON C.cancao_id = H.cancao_id
GROUP BY H.usuario_id
ORDER BY U.usuario;
