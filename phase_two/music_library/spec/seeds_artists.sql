DROP TABLE IF EXISTS artists;
CREATE TABLE artists(
    "id" serial, 
    "name" text, 
    "genre" text,
    PRIMARY KEY ("id"));


TRUNCATE TABLE artists RESTART IDENTITY; 

INSERT INTO artists (name, genre) VALUES ('Pixies', 'Rock');
INSERT INTO artists (name, genre) VALUES ('ABBA', 'Pop');
