-- CREATE DATABASE IF NOT EXISTS elections;
-- USE elections;
CREATE TABLE IF NOT EXISTS locality (
    id_locality INT PRIMARY KEY AUTO_INCREMENT,
    locality_name VARCHAR(100) NOT NULL UNIQUE,
    state VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS electoral_zone (
    id_zone INT PRIMARY KEY AUTO_INCREMENT,
    zone_name VARCHAR(100) NOT NULL UNIQUE,
    id_locality INT NOT NULL
);
CREATE TABLE IF NOT EXISTS electoral_section (
    id_section INT PRIMARY KEY AUTO_INCREMENT,
    section_name VARCHAR(100) NOT NULL UNIQUE,
    id_zone INT NOT NULL
);
ALTER TABLE electoral_zone
ADD FOREIGN KEY (id_locality) REFERENCES locality(id_locality);
ALTER TABLE electoral_section
ADD FOREIGN KEY (id_zone) REFERENCES electoral_zone(id_zone);
-- INSERT
INSERT INTO locality (locality_name, state)
VALUES ('São Paulo', 'São Paulo'),
    ('Rio de Janeiro', 'Rio de Janeiro'),
    ('Belo Horizonte', 'Minas Gerais'),
    ('Curitiba', 'Paraná'),
    ('Porto Alegre', 'Rio Grande do Sul');
INSERT INTO electoral_zone (zone_name, id_locality)
VALUES ('Zona 001', 1),
    ('Zona 002', 2),
    ('Zona 003', 3),
    ('Zona 004', 4),
    ('Zona 005', 5);
INSERT INTO electoral_section (section_name, id_zone)
VALUES ('Seção 101', 1),
    ('Seção 102', 2),
    ('Seção 103', 3),
    ('Seção 104', 4),
    ('Seção 105', 5);
-- UPDATE
UPDATE locality
SET locality_name = 'São Paulo - Centro'
WHERE id_locality = 1;
UPDATE electoral_zone
SET zone_name = 'Zona Central SP'
WHERE id_zone = 1;
-- DELETE
DELETE FROM electoral_section
WHERE id_zone = 5;
DELETE FROM electoral_zone
WHERE id_locality = 5;
DELETE FROM locality
WHERE id_locality = 5;
-- Query 1: localities of 'São Paulo', sorted by name
SELECT *
FROM locality
WHERE state = 'São Paulo'
ORDER BY locality_name ASC;
-- Query 2: sections with id > 2, sorted desc
SELECT *
FROM electoral_section
WHERE id_section > 2
ORDER BY section_name DESC;