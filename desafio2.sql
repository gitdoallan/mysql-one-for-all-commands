SELECT
COUNT(cancao) AS cancoes,
COUNT(DISTINCT artista_id) AS artistas,
COUNT(DISTINCT album_id) AS albuns
FROM SpotifyClone.tb_cancoes;
