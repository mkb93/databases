require_relative './album'
class AlbumRepository

    def all
      sql = 'SELECT * FROM albums;'
      result_set = DatabaseConnection.exec_params(sql,[])
  
      albums = []
  
  
      result_set.each do |record|
        album = Album.new
        album.id =record['id']
        album.title =record['title']
        album.release_year = record['release_year']
        album.artist_id = record['artist_id']
  
        albums << album
      end
  
      return albums
    end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find_by_id(num)  
    sql ="SELECT * FROM albums WHERE id = #{num};"
    result_set = DatabaseConnection.exec_params(sql, [])
    item = result_set.first
    album = Album.new
    album.id =item['id']
    album.title =item['title']
    album.release_year = item['release_year']
    album.artist_id = item['artist_id']
    return album
    
  end
  
  def find_by_title(str)
    sql = "SELECT * FROM albums WHERE title = '#{str}';"
    result_set = DatabaseConnection.exec_params(sql, [])
    item = result_set.first
    album = Album.new
    album.id =item['id']
    album.title =item['title']
    album.release_year = item['release_year']
    album.artist_id = item['artist_id']
    return album
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
  sql = "
  INSERT INTO albums
  (title, release_year, artist_id)
  VALUES('#{title}', '#{release_year}', '#{artist_id}');"
  result_set = DatabaseConnection.exec_params(sql, [])
  
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