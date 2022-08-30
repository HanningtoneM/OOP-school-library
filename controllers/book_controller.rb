require 'json'
require './core/book'

module BooksController
  def fetch_books
    store = []
    file = open('./storage/books.json')
    if File.exist?(file) && File.read(file) != ''
      book_data = file.read
      JSON.parse(book_data).each do |book|
        store << Book.new(book['id'], book['title'], book['author'])
      end
    else
      File.write(file, '[]')
    end
    store
  end

  def save_books
    store = []
    @books.each do |book|
      store << { id: book.id, title: book.title, author: book.author }
    end
    File.write('./storage/books.json', store.to_json)
  end
end
