require_relative 'person'

class Student < Person
  attr_accessor :name, :parent_permission

  def initialize(age, classroom, name = 'Unknown22', parent_permission: true)
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
