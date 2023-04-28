require_relative './post'
class PostRepository
  def all
    sql = 'SELECT * FROM posts;'
    result =DatabaseConnection.exec_params(sql,[])
    posts = []
    result.each do |client|
      post = Post.new
      post.id = client['id']
      post.title = client['title']
      post.content = client['content']
      post.number_of_views = client['number_of_views']
      post.user_id = client['user_id']
      posts << post
    end
    return posts
  end
  def find(post)
    sql = 'Select * FROM posts WHERE $1'
    params = [post.id]
    result = DatabaseConnection.exec_params(sql,params)
    item = result.first
    post = Post.new
    post.id = item['id']
    post.title = item['title']
    post.content = item['content']
    post.number_of_views = item['number_of_views']
    post.user_id = item['user_id']

    return post
  end
  def create(post)
    sql = 'INSERT INTO posts
    (title, content, number_of_views, user_id) VALUES ($1, $2,$3, $4)'
    params = [post.title, post.content, post.number_of_views, post.user_id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end
  def delete(post)
    sql = 'DELETE FROM  posts WHERE id = $1;'
    params = [post.id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end
end