require_relative 'lib/database_connection'

DatabaseConnection.connect('recipes_directory_test')

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, title FROM albums;'
result = DatabaseConnection.exec_params(sql, [])

result.each |object|
  p object
end