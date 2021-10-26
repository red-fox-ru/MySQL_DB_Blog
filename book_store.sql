DROP DATABASE IF EXISTS bookstore;
CREATE DATABASE bookstore;
USE bookstore;

DROP TABLE IF EXISTS author;
CREATE TABLE author
(
    id   SERIAL,
    name VARCHAR(120),
    PRIMARY KEY (id)
);


DROP TABLE IF EXISTS books;
CREATE TABLE books
(
    id        BIGINT,
    id_author BIGINT UNSIGNED NOT NULL,
    name      VARCHAR(120),

    INDEX (name),
    FOREIGN KEY (id_author) REFERENCES author (id)
);

-- generator fulldb
INSERT INTO author (`id`, `name`)
VALUES ('1', 'Jana');
INSERT INTO author (`id`, `name`)
VALUES ('2', 'Jacklyn');
INSERT INTO author (`id`, `name`)
VALUES ('3', 'Karl');
INSERT INTO author (`id`, `name`)
VALUES ('4', 'Gretchen');
INSERT INTO author (`id`, `name`)
VALUES ('5', 'Buford');
INSERT INTO author (`id`, `name`)
VALUES ('6', 'Felicita');
INSERT INTO author (`id`, `name`)
VALUES ('7', 'Johnson');
INSERT INTO author (`id`, `name`)
VALUES ('8', 'Kristy');
INSERT INTO author (`id`, `name`)
VALUES ('9', 'Sage');
INSERT INTO author (`id`, `name`)
VALUES ('10', 'Lula');
INSERT INTO author (`id`, `name`)
VALUES ('11', 'Cody');
INSERT INTO author (`id`, `name`)
VALUES ('12', 'Velva');
INSERT INTO author (`id`, `name`)
VALUES ('13', 'Maurice');
INSERT INTO author (`id`, `name`)
VALUES ('14', 'Vivian');
INSERT INTO author (`id`, `name`)
VALUES ('15', 'Alejandrin');

INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('1', 1, 'ad');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('18', 2, 'alias');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('6', 3, 'aliquid');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('1', 4, 'ad');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('1', 5, 'ad');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('4', 6, 'atque');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('5', 7, 'blanditiis');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('47', 8, 'commodi');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('30', 9, 'cumque');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('11', 1, 'debitis');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('37', 11, 'dolor');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('13', 12, 'doloremque');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('43', 1, 'dolores');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('31', 2, 'doloribus');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('44', 3, 'ea');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('39', 4, 'earum');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('34', 5, 'enim');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('17', 6, 'est');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('38', 7, 'est');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('12', 3, 'et');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('20', 4, 'et');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('25', 1, 'et');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('26', 1, 'et');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('41', 8, 'eum');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('46', 9, 'eum');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('21', 10, 'exercitationem');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('8', 1, 'in');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('10', 2, 'ipsam');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('49', 3, 'ipsum');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('48', 4, 'iure');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('29', 5, 'laboriosam');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('24', 6, 'laborum');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('3', 7, 'magnam');
INSERT INTO `books` (`id`, id_author, `name`)
VALUES ('33', 8, 'minima');



SELECT author.name as 'Автор', COUNT(b.id) as 'Количество'
FROM author
         JOIN books b on author.id = b.id_author
group by author.name;

CREATE OR REPLACE VIEW count_book as
SELECT author.id, author.name, COUNT(b.id)
FROM author
         JOIN books b on author.id = b.id_author
group by author.id;

SELECT author.name as 'Автор', b.name as 'Книга'
FROM author
         JOIN (SELECT * FROM books LIMIT 3) b
ORDER BY author.id;

SELECT author.name as 'Автор', COUNT(b.id) as 'Количество'
FROM author
         JOIN books b on author.id = b.id_author
         LEFT JOIN count_book cb on author.id = cb.id
WHERE cb.`COUNT(b.id)` > 5
GROUP BY author.name;