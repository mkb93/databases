require 'album_repository'

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
end
end