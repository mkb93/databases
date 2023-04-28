require 'user_repository'
require 'user'

RSpec.describe UserRepository do
  def reset_albums_table
    seed_sql = File.read('spec/users_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test'})
    connection.exec(seed_sql)
  end
  
  describe UserRepository do
    before(:each) do 
      reset_albums_table
    end
  it 'tests that user.all is returning a full user' do
    user_repo = UserRepository.new
    users = user_repo.all
    expect(users.length).to eq 2
    expect(users.first.name).to eq 'bill'
    expect(users.last.name).to eq 'jill'
  end
  it 'tests that user.find is returning a full user' do
    user_repo = UserRepository.new
    user = User.new
    user.id = '1'
    user.name = 'bill'
    found = user_repo.find(user)
    expect(found.name).to eq 'bill'
    expect(found.id).to eq '1'
  end
  it 'tests that user.create is adding a full user' do
    user_repo = UserRepository.new
    users = user_repo.all
    user = User.new
    user.id = '3'
    user.name = 'hill'
    expect(users.length).to eq 2
    user_repo.create(user)
    users = user_repo.all
    expect(users.length).to eq 3
    expect(users.last.id).to eq '3'
  end
  it 'tests that user.delete is deleting a full user' do
    user_repo = UserRepository.new
    user = User.new
    user.id = '3'
    user.name = 'hill'
    user_repo.create(user)
    users = user_repo.all
    expect(users.length).to eq 3
    user_repo.delete(user)
    users = user_repo.all
    expect(users.length).to eq 2
  end
  end
end
