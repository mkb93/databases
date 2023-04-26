DROP TABLE IF EXISTS recipes;
CREATE TABLE recipes (
  id serial PRIMARY KEY, 
    name text, 
    cooking_time int,
    rating int
    );


TRUNCATE TABLE recipes RESTART IDENTITY; 

INSERT INTO recipes (name, cooking_time, rating) VALUES ('food1', '20', '5');
INSERT INTO recipes (name, cooking_time, rating) VALUES ('food2', '40', '3');