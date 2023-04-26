# artists Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE
As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep a list of all my recipes with their names.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to keep the average cooking time (in minutes) for each recipe.

As a food lover,
So I can stay organised and decide what to cook,
I'd like to give a rating to each of the recipes (from 1 to 5).

nouns: recipes, names, cooking_time, rating
Table: recipes

Columns:
id | name | cooking_time | rating
```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- EXAMPLE
-- (file: spec/seeds_recipes.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO albums (title, release_year, artist_id) VALUES ('Album 1', 2022, 1);
INSERT INTO albums (title, release_year, artist_id) VALUES ('Album 2', 2023, 2);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 recipes_directory_test < seeds.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/student.rb)
class Recipe
end

# Repository class
# (in lib/student_repository.rb)
class RecipeRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# EXAMPLE
# Table name: students

# Model class
# (in lib/album.rb)

class Album

  
  attr_accessor :id, :title, :release_year, :artist_id
end


```

*You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.*

## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class AlbumRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT * FROM albums;
    
    # Returns an array of Album objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find_by_id(num)
    # Executes the SQL query:
    # SELECT * FROM albums WHERE id = num;

    # Returns a single Album object.
  end

  def find_by_title(str)
    # Executes the SQL query:
    # SELECT * FROM albums WHERE title=str;

    # Returns a single Album object.
  end

  def find_by_release_year(year)
    # Executes the SQL query:
    # SELECT * FROM albums WHERE release_year = year;

    # Returns an array Album object.
  end

  def create(title, release_year, artist_id)
  # INSERT INTO albums
  # (title, release_year, artist_id)
  # VALUES(name, release_year, artist_id)
  # returns nothing
  end

  def update_release_year(album, year)
  # UPDATE albums SET release_year = year  WHERE id = album.id
  # returns nothing
  end

  def delete(album)
  # DELETE FROM albums WHERE id = album.id
  # returns nothing
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all albums

repo = AlbumRepository.new

albums = repo.all

albums.length # =>  2

albums[0].id # =>  1
albums[0].title # =>  'Album 1'
albums[0].release_year # =>  '2022'
albums[0].artist_id # =>  1

albums[1].id # =>  2
albums[1].title # =>  'Album 2'
albums[1].release_year # =>  '2023'
albums[1].artist_id # => 2

# 2
# Get a single album by id

repo = AlbumRepository.new

album = repo.find_by_id(1)

album.id # => 1
album.title # => 'Album 1'
album.release_year # => '2022'
album.artist_id # => 1

# 3
# Get a single album by title

repo = AlbumRepository.new

album = repo.find_by_title('Album 1')

album.id # => 1
album.title # => 'Album 1'
album.release_year # => '2022'
album.artist_id # => 1

# 4
# Deleting a single album
repo = AlbumRepository.new

albums = repo.all
albums.length # =>  2

album = repo.find_by_id(1)
repo.delete(album)

albums = repo.all
albums.length # =>  1

# 5
# Create an album
repo = AlbumRepository.new

albums = repo.all
albums.length # => 2

repo.create('Album 3', 2023, 3)

albums = repo.all
albums.length # => 3

albums[2].id # =>  3
albums[2].title # =>  'Album 3'
albums[2].release_year # =>  '2023'
albums[2].artist_id # => 3

# 6
# Update release year
repo = AlbumRepository.new

album = repo.find_by_id(1)
repo.update_release_year(album, 2020)

albums = repo.all

repo.find_by_id(1).release_year # =>  '2020'
```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/album_repository_spec.rb

def reset_albums_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe AlbumRepository do
  before(:each) do 
    reset_albums_table
  end

end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fdatabases&prefill_File=resources%2Frepository_class_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->