SELECT
A.artista AS artista,
CD.album AS album
FROM SpotifyClone.tb_artista AS A 
INNER JOIN
SpotifyClone.tb_albuns AS CD
ON A.artista_id = CD.artista_id
WHERE A.artista = 'Walter Phoenix'
ORDER BY album;
