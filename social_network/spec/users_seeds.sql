DROP TABLE IF EXISTS users, posts;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text
);

-- Then the table with the foreign key.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  number_of_views int,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

 -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name) VALUES ('bill'),('jill');
INSERT INTO posts (title,content,number_of_views,user_id) VALUES ('bill','billiams struggle in namehood','123', '1'),('jill','jilliams struggle in namehood','124', '2');
