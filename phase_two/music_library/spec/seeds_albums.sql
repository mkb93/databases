DROP TABLE IF EXISTS albums;
CREATE TABLE albums(
    "id" serial, 
    "title" text, 
    "release_year" int4,
    "artist_id" int4,
    PRIMARY KEY ("id"));


TRUNCATE TABLE albums RESTART IDENTITY; 

INSERT INTO albums (title, release_year, artist_id) VALUES ('Album 1', 2022, 1);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Album 2', 2023, 2);
