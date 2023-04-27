require_relative '../app'


def reset_album_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
  end
    
RSpec.describe Application do

  describe AlbumRepository do
    before(:each) do 
      reset_album_table
    end
  
  it 'prints a menu' do
    
      io = double :io
    
      expect(io).to receive(:puts).with("Welcome to the music library manager!\nWhat would you like to do?\n1 - List all albums\n2 - List all artists\nEnter your choice:")
      expect(io).to receive(:gets).and_return("1").ordered
      expect(io).to receive(:puts).with("Album 1").ordered
      expect(io).to receive(:puts).with("Album 2").ordered
      
      app = Application.new(
      'music_library_test',
      io,
      AlbumRepository.new,
      ArtistRepository.new)
      app.run
     
  end
  it 'prints a menu and prints the artists' do
    
    io = double :io
  
    expect(io).to receive(:puts).with("Welcome to the music library manager!\nWhat would you like to do?\n1 - List all albums\n2 - List all artists\nEnter your choice:")
    expect(io).to receive(:gets).and_return("2").ordered
    expect(io).to receive(:puts).with("Pixies").ordered
    expect(io).to receive(:puts).with("ABBA").ordered
    
    app = Application.new(
    'music_library_test',
    io,
    AlbumRepository.new,
    ArtistRepository.new)
    app.run
   
end
end
end