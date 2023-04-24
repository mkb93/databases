-- Update the release_year of the album with ID 3 to the value 1972.
-- Use a SELECT query to get that specific record and verify it has been updated.
UPDATE albums SET release_year = 1972
  WHERE id = 3;

SELECT release_year FROM albums WHERE id = 3;

-- Update the title and release_year of the album with ID 1 (in a single query). 
-- Then use a SELECT query to get the list of albums and verify that one has been updated.
UPDATE albums SET title = 'updated', release_year = 2023
  WHERE id = 1;

SELECT * FROM albums;

-- Delete the album with ID 12. 
-- Then use a SELECT query to get the list of albums and verify that one has been deleted.
DELETE FROM albums WHERE id = 12;

SELECT * FROM albums;