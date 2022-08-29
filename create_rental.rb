class CreateRental
  def initialize(people, books, rentals)
    @people = people
    @books = books
    @rentals = rentals
  end

  def create_rental
    puts 'Select a book using it\'s number: '
    @books.each_with_index { |book, index| puts "#{index}) #{book.title}" }
    book_id = gets.chomp.to_i
    book = @books[book_id]

    puts 'Select a person using it\'s number: '
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, Age: #{person.age}, id: #{person.id}"
    end
    person_id = gets.chomp.to_i
    person = @people[person_id]
    puts 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, person, book)
    puts 'Records created successfully  ✅ 🎉🎉🎉'
  end
end
