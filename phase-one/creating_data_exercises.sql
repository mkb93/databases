-- INSERT a new record in albums with title 'Mezzanine', and release year 1998.
INSERT INTO albums
  (title, release_year)
  VALUES('Mezzanine', 1998);

-- We forgot to link this new record with the correct artist. 
-- Use an UPDATE query to update the artist_id of that new album with Massive Attack (it should have the id value 5).
UPDATE albums SET artist_id = (SELECT id FROM artists WHERE name = 'Massive Attack')
  WHERE title = 'Mezzanine';

-- Insert a new artist of your choice, and a new album related to that artist (here's an idea, if you can't pick one).
INSERT INTO artists
  (name, genre)
  VALUES('King Gizzard and the Lizard Wizard', 'Rock / Alternative');

INSERT INTO albums
  (title, release_year, artist_id)
  VALUES('Nonagon Infinity', 2016, (SELECT id FROM artists WHERE name = 'King Gizzard and the Lizard Wizard'));

-- Then run a SELECT query to check the new artist is now in the table.
SELECT * FROM artists;
SELECT * FROM albums;

