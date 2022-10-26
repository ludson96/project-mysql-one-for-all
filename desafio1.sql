DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;
  
      CREATE TABLE SpotifyClone.plano(
		plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		plano VARCHAR(20),
		valor_plano DECIMAL(5,2) NOT NULL
  ) engine = InnoDB;
  
        INSERT INTO SpotifyClone.plano (plano, valor_plano)
  VALUES
	('gratuito', 0.00),
	('universitário', 5.99),
	('familiar', 7.99),
	('pessoal', 6.99);

  CREATE TABLE SpotifyClone.usuario(
      usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      usuario VARCHAR(50) NOT NULL,
      idade INT NOT NULL,
      plano_id INT NOT NULL DEFAULT 1,
      data_assinatura VARCHAR(20),
       FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
  ) engine = InnoDB;
  
   INSERT INTO SpotifyClone.usuario (usuario, idade)
  VALUES
    ('Barbara Liskov', 82),
    ('Robert Cecil Martin',	58),
	('Ada Lovelace', 37),
	('Martin Fowler', 46),
	('Sandi Metz', 58),
	('Paulo Freire', 19),
	('Bell Hooks', 26),
	('Christopher Alexander', 85),
	('Judith Butler', 45),
	('Jorge Amado', 58);
  
      CREATE TABLE SpotifyClone.artista(
      artista_id INT AUTO_INCREMENT PRIMARY KEY,
      artista VARCHAR(20)
  ) engine = InnoDB;
  
    
      INSERT INTO SpotifyClone.artista (artista)
  VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

  CREATE TABLE SpotifyClone.album(
      album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      album VARCHAR(45) NOT NULL,
      artista_id INT,
      ano_lancamento INT,
      FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
  ) engine = InnoDB;
  
    INSERT INTO SpotifyClone.album (album, artista_id, ano_lancamento)
  VALUES
	('Renaissance', 1, 2022),
	('Jazz', 2, 1978),
	('Hot Space', 2, 1982),
	('Falso Brilhante', 3, 1998),
	('Vento de Maio', 3, 2001),
	('QVVJFA?', 4, 2003),
	('Somewhere Far Beyond', 5, 2007),
	('I Put A Spell On You', 6, 2012);
  
  CREATE TABLE SpotifyClone.artistas_seguidos(
      artistas_seguidos_id INT,
      usuario_id INT,
      artista_id INT,
      PRIMARY KEY (usuario_id, artista_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
      FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
  ) engine = InnoDB;
  
  INSERT INTO SpotifyClone.artistas_seguidos (artistas_seguidos_id, usuario_id, artista_id)
  VALUES
    (1, 1, 1),
	(2, 1, 2),
	(3, 1 , 3),
	(4, 2, 1),
	(5, 2, 3),
	(6, 3, 2),
	(7, 4, 4),
	(8, 5, 5),
	(9, 5, 6),
	(10 ,6, 6),
	(11, 6, 1),
	(12, 7, 6),
	(14, 9, 3),
	(15, 10, 2);
  
      CREATE TABLE SpotifyClone.cancoes(
      cancoes_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      cancoes VARCHAR(50),
      duracao_segundos INT,
		album_id INT NULL,
        FOREIGN KEY (album_id) REFERENCES album (album_id)
  ) engine = InnoDB;
  
       INSERT INTO SpotifyClone.cancoes (cancoes,duracao_segundos, album_id)
  VALUES
	("BREAK MY SOUL", 279, 1),
	("Don’t Stop Me Now", 203, 2),
	("Under Pressure", 152, 3),
	("Como Nossos Pais", 105, 4),
	("O Medo de Amar é o Medo de Ser Livre", 207, 5),
	("Samba em Paris", 267, 6),
	("The Bard’s Song", 244, 7),
	("Feeling Good", 100, 8),
	("VIRGO’S GROOVE", 369, 1),
	("ALIEN SUPERSTAR", 116, 1);
    
  CREATE TABLE SpotifyClone.historico_reproducoes(
      usuario_id INT,
      cancoes_id INT,
      data_reproducao DATETIME NOT NULL,
      PRIMARY KEY (usuario_id, cancoes_id),
      FOREIGN KEY (usuario_id) REFERENCES usuario (usuario_id),
      FOREIGN KEY (cancoes_id) REFERENCES cancoes (cancoes_id)
  ) engine = InnoDB;
  
   INSERT INTO SpotifyClone.historico_reproducoes (usuario_id, cancoes_id, data_reproducao)
  VALUES
    (1,	6, "2022-02-28 10:45:55"),
	(1, 9, "2020-05-02 05:30:35"),
	(1,	8, "2020-03-06 11:22:33"),
	(2,	8, "2022-08-05 08:05:17"), 
	(2,	5, "2020-01-02 07:40:33"),
	(3,	8, "2020-11-13 16:55:13"), 
	(3,	9, "2020-12-05 18:38:30"),
	(4,	6, "2021-08-15 17:10:10"), 
	(5,	6, "2022-01-09 01:44:33"),
	(5,	3, "2020-08-06 15:23:43"),
	(6,	5, "2017-01-24 00:31:17"), 
	(6,	1, "2017-10-12 12:35:20"),
	(7,	2, "2011-12-15 22:30:49"),
	(8,	2, "2012-03-17 14:56:41"),
	(9,	7, "2022-02-24 21:14:22"),
	(10, 10, "2015-12-13 08:30:22");