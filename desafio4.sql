SELECT
U.usuario AS usuario,
IF (MAX(YEAR(H.data_reproducao)) = 2021,
'Usuário ativo',
'Usuário inativo') AS condicao_usuario
FROM
SpotifyClone.tb_usuario AS U
INNER JOIN
SpotifyClone.tb_historico_de_reproducoes AS H
ON H.usuario_id = U.usuario_id
GROUP BY usuario
ORDER BY usuario;
