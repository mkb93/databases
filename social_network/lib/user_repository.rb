require_relative './user'
class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result =DatabaseConnection.exec_params(sql,[])
    users = []
    result.each do |client|
      user = User.new
      user.id = client['id']
      user.name = client['name']

      users << user
    end
    return users
  end
  def find(user)
    sql = 'Select * FROM users WHERE $1'
    params = [user.id]
    result = DatabaseConnection.exec_params(sql,params)
    item = result.first
    user = User.new
    user.id = item['id']
    user.name = item['name']
    return user 
  end
  def create(user)
    sql = 'INSERT INTO users
    (name) VALUES ($1)'
    params = [user.name]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end
  def delete(user)
    sql = 'DELETE FROM  users WHERE id = $1;'
    params = [user.id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end
end