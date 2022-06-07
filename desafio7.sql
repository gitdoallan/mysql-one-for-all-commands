SELECT
A.artista AS artista,
CD.album AS album,
COUNT(S.artista_id) AS seguidores
FROM
SpotifyClone.tb_artista AS A
INNER JOIN
SpotifyClone.tb_albuns AS CD
ON A.artista_id = CD.artista_id
INNER JOIN
SpotifyClone.tb_seguindo_artistas AS S
ON S.artista_id = CD.artista_id
GROUP BY
artista, album, S.artista_id
ORDER BY
seguidores DESC, artista ASC, album ASC;
