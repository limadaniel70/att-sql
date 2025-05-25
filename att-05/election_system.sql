-- Para facilitar o processamento da apuração eleitoral da eleição municipal 
-- a ser realizada nesse ano, o TRE (Tribunal Regional Eleitoral) resolveu 
-- informatizar esse processo. Sabe-se que cada localidade é dividida em várias 
-- zonas eleitorais que, por sua vez, são divididas em várias seções nas quais os 
-- eleitores estão vinculados. O candidato a um cargo público deve estar vinculado 
-- a um único partido político. Vale ressaltar que, segundo a legislação vigente, o voto é secreto.

CREATE DATABASE IF NOT EXISTS election_system;
USE election_system;

CREATE TABLE locality (
    locality_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE electoral_zone (
    zone_id INT AUTO_INCREMENT PRIMARY KEY,
    zone_number INT NOT NULL,
    locality_id INT NOT NULL,
    FOREIGN KEY (locality_id) REFERENCES locality(locality_id)
);

CREATE TABLE electoral_section (
    section_id INT AUTO_INCREMENT PRIMARY KEY,
    section_number INT NOT NULL,
    zone_id INT NOT NULL,
    FOREIGN KEY (zone_id) REFERENCES electoral_zone(zone_id)
);

CREATE TABLE voter (
    voter_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    voter_title VARCHAR(20) UNIQUE NOT NULL,
    birth_date DATE NOT NULL,
    section_id INT NOT NULL,
    FOREIGN KEY (section_id) REFERENCES electoral_section(section_id)
);

CREATE TABLE party (
    party_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    acronym VARCHAR(10) NOT NULL,
    party_number INT UNIQUE NOT NULL
);

CREATE TABLE candidate (
    candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    candidate_number INT UNIQUE NOT NULL,
    position VARCHAR(50) NOT NULL,
    party_id INT NOT NULL,
    FOREIGN KEY (party_id) REFERENCES party(party_id)
);

CREATE TABLE vote (
    vote_id INT AUTO_INCREMENT PRIMARY KEY,
    section_id INT NOT NULL,
    candidate_id INT NULL, -- NULL for blank/null votes
    vote_timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (section_id) REFERENCES electoral_section(section_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(candidate_id)
);
