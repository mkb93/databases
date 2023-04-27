require 'album_repository'
require 'album'

RSpec.describe AlbumRepository do

  def reset_album_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
  end
    
  describe AlbumRepository do
  before(:each) do 
  reset_album_table
  end

  it 'tests that album.all methods returns full objects' do
    repo =AlbumRepository.new
    album = repo.all
    expect(album.length).to eq(2)
    expect(album.first.id).to eq('1')
    expect(album.first.release_year).to eq('2022')
  end

  describe '#find' do
    it 'returns a specific album object' do
      repo =AlbumRepository.new
      album = repo.find_by_id(1)
      expect(album.id).to eq('1')
      expect(album.release_year).to eq('2022')
    end
  end

  describe "#find_by_title" do
    it "returns a album record by title" do
      repo =AlbumRepository.new
      album = repo.find_by_title("Album 1")
      expect(album.id).to eq('1')
      expect(album.release_year).to eq('2022')
      expect(album.artist_id).to eq('1')
    end
  end
  describe "#create" do
  it "" do
    repository = AlbumRepository.new

    album = Album.new
    album.title = 'Trompe le Monde'
    album.release_year = 1991
    album.artist_id = 20
    aww_albums = repository.all.length
    repository.create(album)

    all_albums = repository.all.length
    expect(all_albums-aww_albums).to eq 1
  end
  it "" do
    repository = AlbumRepository.new
    length1 = repository.all.length
    repository.delete(1)
    length2 = repository.all.length
    expect(length1 - length2).to eq 1
  end
  it "" do
    repository = AlbumRepository.new
    album = repository.find_by_title("Album 1")
    album.release_year = '10'
    repository.update(album)
    album_test = repository.find_by_title("Album 1")
    expect(album_test.release_year).to eq '10'
  end

  end
end
end