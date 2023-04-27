require_relative 'lib/database_connection'
require_relative 'lib/artists_repository'
require_relative 'lib/album_repository'
require_relative 'lib/album'


DatabaseConnection.connect('music_library')

class Application
  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artists_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artists_repository
  end
  def run
    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.
    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
    @io.puts "Welcome to the music library manager!\nWhat would you like to do?\n1 - List all albums\n2 - List all artists\nEnter your choice:"

    get1 = @io.gets.chomp

    if get1 == '1'
      @album_repository.all.each do |al|
        @io.puts al.title
      end
      else
        @artist_repository.all.each do |al|
         @io.puts al.name
      end
    end
  end
end
# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end

# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# result.each do |record|
#   p record
# end

# album_repo = AlbumRepository.new
# album = Album.new
# album.title = 'Trompe le Monde'
# album.release_year = 1991
# album.artist_id = 20
#  album_repo.create(album)
# album2 = album_repo.find_by_title('Trompe le Monde')
# album2.title = ' Marcos Monde'
# album_repo.update(album2)
# album_repo.all.each do |artist|
#   p artist
# end
# artist_repo = AlbumRepository.new
# artist_repo.create('a',1,3)
# artist_repo1 = AlbumRepository.new
# artist_repo1.all.each do |artist|
#   p artist
