require_relative 'create_student'
require_relative 'create_teacher'

class CreatePersonMenu
  def initialize(library)
    @library = library
  end

  def call
    loop do
      puts 'Do you want to create a Student?(1) or a Teacher?(2) [input number]'
      choice = gets.chomp.to_i

      case choice
      when 1
        CreateStudent.new(@library).call
        break
      when 2
        CreateTeacher.new(@library).call
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end
end
