require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'classroom'
require_relative 'menu'
require_relative 'create_rental'

class App
  def initialize()
    @people = []
    @books = []
    @rentals = []
    @main_classroom = Classroom.new('Main Class')
    @menu = Menu.new.inputs
  end

  def start
    puts 'Welcome to School Library App!'
    inputs
  end
end
