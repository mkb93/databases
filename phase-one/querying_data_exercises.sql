-- Run a SELECT query to list values for the column release_year from the albums table.
SELECT release_year FROM albums;

-- Run a filtered SELECT query to list only the release_year of the album with title 'Bossanova'.
SELECT release_year FROM albums WHERE title = 'Bossanova';

-- Find the titles of the albums released by 'Pixies' and released between 1980 and 1990 (inclusive).
SELECT title FROM albums WHERE artist_id = 1 AND release_year >= 1980 AND release_year <= 1990;
-- Alternative solution
SELECT title FROM albums 
  WHERE release_year >= 1980 AND release_year <= 1990 
  AND artist_id IN 
    (SELECT id FROM artists WHERE name = 'Pixies');