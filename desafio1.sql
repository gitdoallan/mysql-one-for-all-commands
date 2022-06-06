    DROP DATABASE IF EXISTS SpotifyClone;
    CREATE DATABASE SpotifyClone;
    USE SpotifyClone;

    CREATE TABLE tb_planos(
        plano_id INT NOT NULL AUTO_INCREMENT,
        plano VARCHAR(50) NOT NULL,
        valor_plano DECIMAL(4, 2) NOT NULL,
        CONSTRAINT PRIMARY KEY(plano_id)
    );

    INSERT INTO tb_planos
    (plano, valor_plano)
    VALUES
    ('gratuito', 0.00),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);

    CREATE TABLE tb_usuario(
        usuario_id INT NOT NULL AUTO_INCREMENT,
        usuario VARCHAR(50) NOT NULL,
        idade INT NOT NULL,
        plano_id INT NOT NULL,
        data_assinatura DATE NOT NULL,
        CONSTRAINT PRIMARY KEY(usuario_id),
        FOREIGN KEY (plano_id) REFERENCES tb_planos (plano_id)
    );

    INSERT INTO tb_usuario
    (usuario, idade, plano_id, data_assinatura)
    VALUES
    ('Thati', 23, 1, '2019-10-20'),
    ('Cintia', 35, 4, '2017-12-30'),
    ('Bill', 20, 2, '2019-06-05'),
    ('Roger', 45, 3, '2020-05-13'),
    ('Norman', 58, 3, '2017-02-17'),
    ('Patrick', 33, 4, '2017-01-06'),
    ('Vivian', 26, 2, '2018-01-05'),
    ('Carol', 19, 2, '2018-02-14'),
    ('Angelina', 42, 4, '2018-04-29'),
    ('Paul', 46, 4, '2017-01-17');

    CREATE TABLE tb_artista(
        artista_id INT PRIMARY KEY AUTO_INCREMENT,
        artista VARCHAR(50) NOT NULL
    );

    INSERT INTO tb_artista
    (artista)
    VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');

    CREATE TABLE tb_seguindo_artistas(
        usuario_id INT,
        artista_id INT,
        CONSTRAINT PRIMARY KEY (usuario_id, artista_id),
        FOREIGN KEY (usuario_id) REFERENCES tb_usuario (usuario_id),
        FOREIGN KEY (artista_id) REFERENCES tb_artista (artista_id)
    );

    INSERT INTO tb_seguindo_artistas
    (usuario_id, artista_id)
    VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);

    CREATE TABLE tb_albuns(
        album_id INT PRIMARY KEY AUTO_INCREMENT,
        album VARCHAR(50) NOT NULL,
        artista_id INT NOT NULL,
        ano_lancamento INT NOT NULL,
        FOREIGN KEY (artista_id) REFERENCES tb_artista (artista_id)
    );

    INSERT INTO tb_albuns
    (album, artista_id, ano_lancamento)
    VALUES
    ('Envious', 1, 1990),
    ('Exuberant', 1, 1993),
    ('Hallowed Steam', 2, 1995),
    ('Incandescent', 3, 1998),
    ('Temporary Culture', 4, 2001),
    ('Library of liberty', 4, 2003),
    ('Chained Down', 5, 2007),
    ('Cabinet of fools', 5, 2012),
    ('No guarantees', 5, 2015),
    ('Apparatus', 6, 2015);

    CREATE TABLE tb_cancoes(
        cancao_id INT PRIMARY KEY AUTO_INCREMENT,
        cancao VARCHAR(50) NOT NULL,
        artista_id INT NOT NULL,
        album_id INT NOT NULL,
        duracao_segundos INT NOT NULL,
        FOREIGN KEY (artista_id) REFERENCES tb_artista (artista_id),
        FOREIGN KEY (album_id) REFERENCES tb_albuns (album_id)
    );

    INSERT INTO tb_cancoes
    (cancao, artista_id, album_id, duracao_segundos)
    VALUES
    ('Soul For Us', 1, 1, 200),
    ('Reflections Of Magic', 1, 1, 163),
    ('Dance With Her Own', 1, 1, 116),
    ('Troubles Of My Inner Fire', 1, 2, 203),
    ('Time Fireworks', 1, 2, 152),
    ('Magic Circus', 2, 3, 105),
    ('Honey, So Do I', 2, 3, 207),
    ("Sweetie, Let's Go Wild", 2, 3, 139),
    ('She Knows', 2, 3, 244),
    ('Fantasy For Me', 3, 4, 100),
    ('Celebration Of More', 3, 4, 146),
    ('Rock His Everything', 3, 4, 223),
    ('Home Forever', 3, 4, 231),
    ('Diamond Power', 3, 4, 241),
    ("Let's Be Silly", 3, 4, 132),
    ('Thang Of Thunder', 4, 5, 240),
    ('Words Of Her Life', 4, 5, 185),
    ('Without My Streets', 4, 5, 176),
    ('Need Of The Evening', 4, 6, 190),
    ('History Of My Roses', 4, 6, 222),
    ('Without My Love', 4, 6, 111),
    ('1', 4, 6, 123),
    ('Young And Father', 4, 6, 197),
    ('Finding My Traditions', 5, 7, 179),
    ('Walking And Game', 5, 7, 229),
    ('Hard And Time', 5, 7, 135),
    ("Honey, I'm A Lone Wolf", 5, 7, 150),
    ("She Thinks I Won't Stay Tonight", 5, 8, 166),
    ("He Heard You're Bad For Me", 5, 8, 154),
    ("He Hopes We Can't Stay", 5, 8, 210),
    ('I Know I Know', 5, 8, 117),
    ("He's Walking Away", 5, 9, 159),
    ("He's Trouble", 5, 9, 138),
    ('I Heard I Want To Bo Alone', 5, 9, 120),
    ('I Ride Alone', 5, 9, 151),
    ('Honey', 6, 10, 79),
    ('You Cheated On Me', 6, 10, 95),
    ("Wouldn't It Be Nice", 6, 10, 213),
    ('Baby', 6, 10, 136),
    ('You Make Me Feel So..', 6, 10, 83);


    CREATE TABLE tb_historico_de_reproducoes(
        usuario_id INT NOT NULL,
        cancao_id INT NOT NULL,
        data_reproducao DATE NOT NULL,
        CONSTRAINT PRIMARY KEY (usuario_id, cancao_id),
        FOREIGN KEY (usuario_id) REFERENCES tb_usuario (usuario_id),
        FOREIGN KEY (cancao_id) REFERENCES tb_cancoes (cancao_id)
    );

    INSERT INTO tb_historico_de_reproducoes
    (usuario_id, cancao_id, data_reproducao)
    VALUES
    (1, 7, '2020-02-28 10:45:55'),
    (1, 25, '2020-05-02 05:30:35'),
    (1, 23, '2020-03-06 11:22:33'),
    (1, 14, '2020-08-05 08:05:17'),
    (1, 15, '2020-09-14 16:32:22'),
    (2, 34, '2020-01-02 07:40:33'),
    (2, 24, '2020-05-16 06:16:22'),
    (2, 21, '2020-10-09 12:27:48'),
    (2, 39, '2020-09-21 13:14:46'),
    (3, 6, '2020-11-13 16:55:13'),
    (3, 3, '2020-12-05 18:38:30'),
    (3, 26, '2020-07-30 10:00:00'),
    (4, 2, '2021-08-15 17:10:10'),
    (4, 35, '2021-07-10 15:20:30'),
    (4, 27, '2021-01-09 01:44:33'),
    (5, 7, '2020-07-03 19:33:28'),
    (5, 12, '2017-02-24 21:14:22'),
    (5, 14, '2020-08-06 15:23:43'),
    (5, 1, '2020-11-10 13:52:27'),
    (6, 38, '2019-02-07 20:33:48'),
    (6, 29, '2017-01-24 00:31:17'),
    (6, 30, '2017-10-12 12:35:20'),
    (6, 25, '2018-05-29 14:56:41'),
    (7, 5, '2018-05-09 22:30:49'),
    (7, 4, '2020-07-27 12:52:58'),
    (7, 11, '2018-01-16 18:40:43'),
    (8, 39, '2018-03-21 16:56:40'),
    (8, 40, '2020-10-18 13:38:05'),
    (8, 32, '2019-05-25 08:14:03'),
    (8, 33, '2021-08-15 21:37:09'),
    (9, 16, '2021-05-24 17:23:45'),
    (9, 17, '2018-12-07 22:48:52'),
    (9, 8, '2021-03-14 06:14:26'),
    (9, 9, '2020-04-01 03:36:00'),
    (10, 20, '2017-02-06 08:21:34'),
    (10, 21, '2017-12-04 05:33:43'),
    (10, 12, '2017-07-27 05:24:49'),
    (10, 13, '2017-12-25 01:03:5');
