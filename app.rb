require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  def initialize
    @people = []
    @books = []
    @id = 0
  end


  def run
    puts 'Welcome to School Library App!'
    display_options

    task_list = {
      '1' => method(:list_all_books),
      '2' => method(:list_all_people),
      '3' => method(:create_person),
      '4' => method(:create_book),
      '5' => method(:create_rental),
      '6' => method(:list_rentals)
    }

    task = gets.chomp
    if task.to_i.positive? && task.to_i < 7
      task_list[task].call
    elsif task == '7'
      puts 'Thank you for using this app!'
    else
      puts 'Please select a valid number'
      run
    end
  end


