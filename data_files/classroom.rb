require_relative '../data_files/student'

class Classroom
  attr_accessor :name, :students, :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
