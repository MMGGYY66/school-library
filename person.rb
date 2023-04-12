require_relative './nameable'

class Person < Nameable
  attr_accessor :name, :age, :id
  attr_reader :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # a method correct_name implemented to simply return the name attribute.
  def correct_name
    @name
  end

  def can_use_services?
    @parent_permission && of_age?
  end

  private

  def of_age?
    @age >= 18
  end
end
