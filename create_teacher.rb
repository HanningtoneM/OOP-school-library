class CreateTeacher
    def initialize(people)
      @people = people
    end
  
    def create_teacher
      puts 'Create a new teacher'
      print 'Teacher Name: '
      name = gets.chomp
      print 'Teacher Age: '
      age = gets.chomp.to_i
      print 'Teacher\'s specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name)
      @people << teacher
      puts "Teacher (#{name}) created successfully!"
    end
  end