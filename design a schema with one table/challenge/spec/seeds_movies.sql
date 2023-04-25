DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  name text,
  genre text,
  release_year int
);

TRUNCATE TABLE movies RESTART IDENTITY; 

INSERT INTO movies (name, genre, release_year) VALUES ('Pixies', 'Rock', 1), ('ABBA', 'Pop', 2);

