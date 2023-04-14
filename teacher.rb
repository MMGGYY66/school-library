require_relative './person'

class Teacher < Person
  attr_reader :specialization
  attr_reader :json_class

  def initialize(age, specialization, name, parent_permission, json_class: 'Teacher')
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @json_class = json_class
  end

  def can_use_services?
    true
  end
end
