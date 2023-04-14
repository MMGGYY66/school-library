require_relative './person'

class Student < Person
  attr_reader :classroom, :json_class

  def initialize(classroom, age, name, parent_permission, json_class: 'Student')
    super(age, name, parent_permission:)
    @classroom = classroom
    @json_class = json_class
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    ' ¯\\(ツ)/¯ '
  end
end
