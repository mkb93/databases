require 'post_repository'
require 'post'

RSpec.describe PostRepository do
  def reset_albums_table
    seed_sql = File.read('spec/users_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test'})
    connection.exec(seed_sql)
  end
  
  describe PostRepository do
    before(:each) do 
      reset_albums_table
    end
  it 'shows us a list of all the posts using post.all' do
    post_repo = PostRepository.new
    posts = post_repo.all
    expect(posts.length).to eq 2
    expect(posts.first.number_of_views).to eq '123'
  end
  it 'shows us a specifc  post using post.find' do
    post_repo = PostRepository.new
    post = Post.new
    post.id = '1'
    found = post_repo.find(post)
    expect(found.id).to eq '1'
    expect(found.title).to eq 'bill'
    expect(found.user_id).to eq '1'
  end
  it 'creates a new post using create method' do
    post_repo = PostRepository.new
    post = Post.new
    expect(post_repo.all.length).to eq 2
    post.id = '3'
    post.title = 'hill'
    post.content = 'the hill that took life away'
    post.number_of_views = '10'
    post.user_id = '1'
    post_repo.create(post)
    expect(post_repo.all.length).to eq 3
  end
  it 'deletes a  post using delete method' do
    post_repo = PostRepository.new
    post = Post.new
    expect(post_repo.all.length).to eq 2
    post.id = '3'
    post.title = 'hill'
    post.content = 'the hill that took life away'
    post.number_of_views = '10'
    post.user_id = '1'
    post_repo.create(post)
    expect(post_repo.all.length).to eq 3
    post_repo.delete(post)
    expect(post_repo.all.length).to eq 2
  end
  end
end
