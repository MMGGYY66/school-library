require_relative '../person'
require_relative '../app'

class CreateStudent
  def initialize(library)
    @library = library
  end

  def call
    puts 'Enter student name:'
    name = gets.chomp
    puts 'Enter student age:'
    age = gets.chomp.to_i
    puts 'Has student permission? [Y/N]'
    permission = gets.chomp.downcase == 'y'
    student = Student.new(age, permission, name)
    @library.add_person(student)
    puts 'Student added!'
  end
end
