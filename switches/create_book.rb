class CreateBook
  def initialize(books)
    @books = books
  end

  def create_book
    puts 'Create a new book.'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "#{title} created successfully  ✅ 🎉🎉🎉"
  end
end
