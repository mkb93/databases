require_relative "./book_store"
class BookStoreRepository
    def all
      sql = 'SELECT id, title, author_name FROM books;'
      result = DatabaseConnection.exec_params(sql, [])
      book_store = []
# Print out each record from the result set .
      result.each do |book1|
        book = BookStore.new
        book.id = book1['id']
        book.title = book1['title']
        book.author_name = book1['author_name']

        book_store << book
      end
       return book_store
    end
end