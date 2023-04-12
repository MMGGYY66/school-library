require_relative './person'

class Student < Person
  attr_accessor :classroom
  attr_reader :json_class

  def initialize(classroom, age, name = 'Unknown', parent_permission: true, json_class: 'Student')
    super(age, name, parent_permission: parent_permission)
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
