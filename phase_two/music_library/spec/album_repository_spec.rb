require 'album_repository'


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