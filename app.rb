require './switches/menu'

class App
  def initialize()
    @menu = Menu.new
  end

  def start
    puts 'Welcome to School Library App!'
    @menu.inputs
  end
end
