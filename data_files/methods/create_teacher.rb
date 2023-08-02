require_relative '../person'
require_relative '../app'

class CreateTeacher
  def initialize(library)
    @library = library
  end

  def call
    puts 'Enter teacher name:'
    name = gets.chomp
    puts 'Enter teacher age:'
    age = gets.chomp.to_i
    puts 'Has teacher permission? [Y/N]'
    permission = gets.chomp.downcase == 'y'
    teacher = Teacher.new(age, permission, name)
    @library.add_person(teacher)
    puts 'Teacher added!'
  end
end
