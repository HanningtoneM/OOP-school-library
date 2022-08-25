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

