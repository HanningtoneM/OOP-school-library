require_relative 'create_person'
require_relative 'create_book'
require_relative 'create_rental'
require './controllers/book_controller'
require './controllers/person_controller'
require './controllers/rental_controller'

class Menu
  include BooksController
  include PersonsController
  include RentalsController
  def initialize()
    @people = fetch_persons
    @books = fetch_books
    @rentals = fetch_rentals
    @create_book = CreateBook.new(@books)
    @create_person = CreatePerson.new(@people)
    @create_rental = CreateRental.new(@people, @books, @rentals)
  end

  def inputs
    loop do
      puts ' '
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      execute_inputs
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity

  def execute_inputs
    input = Integer(gets.chomp)
    case input
    when 1 then list_books
    when 2 then list_people
    when 3 then @create_person.create_person
    when 4 then @create_book.create_book
    when 5 then @create_rental.create_rental
    when 6 then list_all_rentals
    when 7
      puts 'Thank you for using this app. Goodbye'
      save_books
      save_persons
      save_rentals
      exit
    else
      puts 'Kindly enter a number between 1-7'
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity

  def list_books
    puts 'Books 📚'
    puts 'Catalog is empty! Choose (4) to add a book.' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    puts 'People 👥'
    puts 'No records found! Choose (3) to add a person.' if @people.empty?
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
  end

  def list_all_rentals
    list_people
    puts 'Enter ID of person: '
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id == id
        puts 'Rented Book: '
        puts "Person: #{rental.person.name} Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
      else
        puts 'User has no records for rented books.'
      end
    end
  end
end
