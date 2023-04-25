DROP TABLE IF EXISTS albums;
CREATE TABLE albums(
    "id" serial, 
    "name" text, 
    "genre" text,
    PRIMARY KEY ("id"));


TRUNCATE TABLE artists RESTART IDENTITY; 

INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');
INSERT INTO artists (name, genre) VALUES ('ABBA', 'Pop');
