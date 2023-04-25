
require_relative 'lib/database_connection'
require_relative 'lib/book_store_repository'
DatabaseConnection.connect('book_store')

# Perform a SQL query on the database and get the result set.

books_repo = BookStoreRepository.new
books_repo.all.each do |book|
  puts  "#{book.id} - #{book.title} - #{book.author_name}"
  end
