require './person'

class Teacher < Person
  def initialize(id, name, age, specialization = 'Unknown', parent_permission: true)
    super(id, name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def can_use_services?
    true
  end
end
