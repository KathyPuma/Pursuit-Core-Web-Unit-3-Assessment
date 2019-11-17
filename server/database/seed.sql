DROP DATABASE IF EXISTS biology_research_db;
CREATE DATABASE biology_research_db;

\c biology_research_db;






CREATE TABLE researchers(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    job_title VARCHAR
);
CREATE TABLE species(
    id SERIAL PRIMARY KEY,
    name VARCHAR, 
    is_mamamal BOOLEAN
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(id),
    nickname VARCHAR
);
CREATE TABLE habitats(
    id SERIAL PRIMARY KEY,
    catergory VARCHAR
);
CREATE TABLE sightings(
    id SERIAL PRIMARY KEY,
    researcher_ID INT REFERENCES researchers(id) ON DELETE SET NULL,
    species_id INT REFERENCES species(id) ON DELETE CASCADE,
    habitat_id INT REFERENCES habitats(id)
);

INSERT INTO researchers
(name,job_title)
VALUES('Mariana Aleta', 'Project Lead'),
('Javed Patrick','Senior Field Researcher' ),
('Carolina Itai','Field Researcher'),
('Jazmyn Gottfried', 'Field Researcher'),
('Ezra Flip', 'Research Intern');


INSERT INTO species( name,is_mamamal)
VALUES('Dolphin', 'true'),
('Moray Eel', 'false'),
('Tiger Shark', 'false'),
('Orca Whale', 'true'),
('Moon Jelly', 'false');


INSERT INTO animals(species_id, nickname)
VALUES(1, 'Flip'),
(1, 'Skip'),
(2,  'Jenkins'),
(3,'Sally'),
(5, 'Flapjack'),
(5, 'Gibbous'),
(5, 'Nox');

INSERT INTO habitats(catergory)
VALUES('Shallows'),
('Coral Reef'),
('Tide Pools'),
('Deeps');




INSERT INTO sightings (researcher_ID, species_id, habitat_id )
VALUES(4, 4, 4 ),
(1,3,4),
(3,5,3),
(5,2,2),
(2,1,1),
(5,2,1);
SELECT * FROM researchers;
SELECT * FROM species;
SELECT * FROM animals;
SELECT * FROM habitats;
SELECT * FROM sightings;

