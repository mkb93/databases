require 'album'
class AlbumRepository

  def all
    # SELECT * FROM album
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