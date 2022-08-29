class CreateStudent
  def initialize(people)
    @people = people
  end

  def create_student
    puts 'Create a new student'
    print 'Student Name: '
    name = gets.chomp
    print 'Student Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [y/n]: '
    parent_permission = gets.chomp.downcase

    case parent_permission
    when 'n'
      puts 'Student doesn\'t have parent\'s permission, unable to create student.'
    when 'y'
      student = Student.new(nil, age, name, parent_permission: parent_permission)
      @people << student
      puts "Student (#{name}) created successfully! ✅ 🎉🎉🎉"
    end
  end
end
