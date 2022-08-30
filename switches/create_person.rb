require_relative 'create_teacher'
require_relative 'create_student'

class CreatePerson
  def initialize(people)
    @people = people
    @create_teacher = CreateTeacher.new(people)
    @create_student = CreateStudent.new(people)
  end

  def create_person
    puts 'To create a student press (1), to create a teacher press (2): '
    n = gets.chomp
    case n
    when '1'
      @create_student.create_student
    when '2'
      @create_teacher.create_teacher
    else
      puts 'Invalid selection'
    end
  end
end
