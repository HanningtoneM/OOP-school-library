require './person'

class Student < Person
  attr_reader :classroom

  def initialize(id, name, age, parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
