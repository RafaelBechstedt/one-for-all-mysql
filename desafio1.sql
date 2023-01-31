DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`memberships`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.memberships (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  type VARCHAR(45) NOT NULL,
  price DECIMAL(5, 2) NOT NULL
 )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`users`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.users (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  age INT NOT NULL,
  sign_date DATE NOT NULL,
  memberships_id INT NOT NULL,
    FOREIGN KEY (memberships_id)
    REFERENCES SpotifyClone.memberships (id)
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`artists`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.artists (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.albuns (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  album_name VARCHAR(100) NOT NULL,
  `release` YEAR NOT NULL,
  artists_id INT NOT NULL,
    FOREIGN KEY (artists_id)
    REFERENCES SpotifyClone.artists (id)
 )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`songs`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.songs (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  duration_sec INT NOT NULL,
  albuns_id INT NOT NULL,
    FOREIGN KEY (albuns_id)
    REFERENCES SpotifyClone.albuns (id)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`historic`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.historic (
  id INT NOT NULL AUTO_INCREMENT,
  users_id INT NOT NULL,
  songs_id INT NOT NULL,
  playback_date DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (id, users_id, songs_id),
    FOREIGN KEY (users_id)
    REFERENCES SpotifyClone.users (id),
	FOREIGN KEY (songs_id)
    REFERENCES SpotifyClone.songs (id)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`following_artists`
-- -----------------------------------------------------
CREATE TABLE SpotifyClone.following_artists (
  id INT NOT NULL AUTO_INCREMENT,
  users_id INT NOT NULL,
  artists_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (id, users_id, artists_id),
    FOREIGN KEY (users_id)
    REFERENCES SpotifyClone.users (id),
    FOREIGN KEY (artists_id)
    REFERENCES SpotifyClone.artists (id)
)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Inserts dos dados
-- -----------------------------------------------------
INSERT INTO SpotifyClone.memberships (id, type, price)
VALUES (1, 'gratuito', 0.00), (2, 'familiar', 7.99), (3, 'universitário', 5.99), (4, 'pessoal', 6.99);

INSERT INTO SpotifyClone.users (id, name, age, sign_date, memberships_id)
VALUES (1, 'Barbara Liskov', 82, '2019-10-20', 1), (2, 'Robert Cecil Martin', 58, '2017-01-06', 1),
 (3, 'Ada Lovelace', 37, '2017-12-30', 2), (4, 'Martin Fowler', 46, '2017-01-17', 2), (5, 'Sandi Metz', 58, '2018-04-29', 2), (6, 'Paulo Freire', 19, '2018-02-14', 3),
 (7, 'Bell Hooks', 26, '2018-01-05', 3), (8, 'Christopher Alexander', 85, '2019-06-05', 4), (9, 'Judith Butler', 45, '2020-05-13', 4), (10, 'Jorge Amado', 5, '2017-02-17', 4);

INSERT INTO SpotifyClone.artists (id, name)  
VALUES (1, 'Beyoncé'), (2, 'Queen'), (3, 'Elis Regina'), (4, 'Baco Exu do Blues'), (5, 'Blind Guardian'), (6, 'Nina Simone');

INSERT INTO SpotifyClone.albuns (id, album_name, `release`, artists_id)
VALUES (1, 'Renaissance', 2022, 1), (2, 'Jazz', 1978, 2), (3, 'Hot Space', 1982, 2), (4, 'Falso Brilhante', 1998, 3), (5, 'Vento de Maio', 2001,  3),
 (6, 'QVVJFA?', 2003, 4), (7, 'Somewhere Far Beyond', 2007, 5), (8, 'I Put A Spell On You', 2012, 6);
 
INSERT INTO SpotifyClone.songs (id, name, duration_sec, albuns_id)
VALUES (1, 'BREAK MY SOUL', 279, 1), (2, 'VIRGO’S GROOVE', 369, 1), (3, 'ALIEN SUPERSTAR', 116, 1), (4, 'Don’t Stop Me Now', 203, 2), (5, 'Under Pressure', 152, 2),
 (6, 'Como Nossos Pais', 105, 3), (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 3), (8, 'Samba em Paris', 267, 4), (9, 'The Bard’s Song', 244, 5), (10, 'Feeling Good', 100, 6); 

INSERT INTO SpotifyClone.historic (users_id, songs_id, playback_date)     
VALUES (1, 8, '2022-02-28 10:45:55'), (1, 2, '2020-05-02 05:30:35'), (1, 10, '2020-03-06 11:22:33'), (2, 10, '2022-08-05 08:05:17'), (2, 7, '2020-01-02 07:40:33'),
 (3, 10, '2020-11-13 16:55:13'), (3, 2, '2020-12-05 18:38:30'), (4, 8, '2021-08-15 17:10:10'), (5, 8, '2022-01-09 01:44:33'), (5, 5, '2020-08-06 15:23:43'),
 (6, 7, '2017-01-24 00:31:17'), (6, 1, '2017-10-12 12:35:20'), (7, 4, '2011-12-15 22:30:49'), (8, 4, '2012-03-17 14:56:41'),
 (9, 9, '2022-02-24 21:14:22'), (10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.following_artists (users_id, artists_id)
VALUES (1, 1), (1, 2), (1, 3), (2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6), (6, 6), (6, 1), (7, 6), (9, 3), (10, 2);