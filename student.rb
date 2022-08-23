require './person'

class Student < Person
  def initialize(id, name, age, classroom = 'Unknown', parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
