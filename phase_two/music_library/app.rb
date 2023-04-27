require_relative 'lib/database_connection'
require_relative 'lib/artists_repository'
require_relative 'lib/album_repository'
require_relative 'lib/album'


DatabaseConnection.connect('music_library')

# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# result.each do |record|
#   p record
# end

album_repo = AlbumRepository.new
album = Album.new
album.title = 'Trompe le Monde'
album.release_year = 1991
album.artist_id = 20
 album_repo.create(album)

# album_repo.all.each do |artist|
#   p artist
# end
# artist_repo = AlbumRepository.new
# artist_repo.create('a',1,3)
# artist_repo1 = AlbumRepository.new
# artist_repo1.all.each do |artist|
#   p artist
