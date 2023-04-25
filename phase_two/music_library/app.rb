require_relative 'lib/database_connection'
require_relative 'lib/artists_repository'
require_relative 'lib/album_repository'


DatabaseConnection.connect('music_library')

# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# result.each do |record|
#   p record
# end

artist_repo = AlbumRepository.new
# artist_repo.all.each do |artist|
#   p artist
# end
# artist_repo = AlbumRepository.new
# artist_repo.create('a',1,3)
# artist_repo1 = AlbumRepository.new
# artist_repo1.all.each do |artist|
#   p artist
end