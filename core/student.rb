require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
