require_relative '../data_files/nameable'
require_relative '../data_files/rental'
require_relative '../data_files/book'
require_relative '../data_files/classroom'

# require_relative 'nameable'
# require_relative 'rental'
# require_relative 'book'
# require_relative 'classroom'

class Person < Nameable
  def initialize(age, _parent_permission, name = 'Unknown')
    super()
    @id = Random.rand(1..25)
    @name = name
    @age = age
    @parent_permission = true
    @rentals = []
  end
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def rent_book(book, date)
    rental = Rental.new(date, self, book)
    @rentals << rental
    book.rentals << rental
    book.available = false
    rental
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end

  class BaseDecorator < Nameable
    def initialize(nameable)
      super()
      @nameable = nameable
    end

    def correct_name
      @nameable.correct_name
    end
  end

  class CapitalizeDecorator < BaseDecorator
    def correct_name
      @nameable.correct_name.capitalize
    end
  end

  class TrimmerDecorator < BaseDecorator
    def correct_name
      @nameable.correct_name.slice(0, 10)
    end
  end
end
