require 'recipes_repository'

RSpec.describe RecipeRepository do

  def reset_recipe_table
  seed_sql = File.read('spec/seeds_recipes.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
  connection.exec(seed_sql)
  end
    
  describe RecipeRepository do
  before(:each) do 
  reset_recipe_table
  end

  it 'tests that album.all methods returns full objects' do
    repo =RecipeRepository.new
    album = repo.all
    expect(album.length).to eq(2)
    expect(album.first.id).to eq('1')
    expect(album.first.name).to eq('food1')
  end

  describe '#find' do
    it 'returns a specific recipe object' do
      repo =RecipeRepository.new
      album = repo.find_by_id(1)
      expect(album.id).to eq('1')
      expect(album.rating).to eq('5')
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