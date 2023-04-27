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
    sql ="SELECT * FROM albums WHERE id = $1;"
    params = [num]
    result_set = DatabaseConnection.exec_params(sql, params)
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

  def create(album)
  sql = "
  INSERT INTO albums
  (title, release_year, artist_id)
  VALUES($1, $2, $3);"
  params=[album.title, album.release_year, album.artist_id]
  result_set = DatabaseConnection.exec_params(sql, params)

  return nil
  end

  def update_release_year(album, year)
  sql = 'UPDATE albums SET release_year = $2  WHERE id = $1;'
  params = [ album, album.year]
  result = DatabaseConnection.exec_params(sql, params)
  end

  def delete(artist_id)
    sql = "DELETE FROM albums WHERE artist_id = $1;"
    params = [artist_id]
    result = DatabaseConnection.exec_params(sql, params)

    return nil 
  end
end