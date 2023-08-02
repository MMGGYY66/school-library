require_relative '../app'

class ListRentalsForPerson
  def initialize(library)
    @library = library
  end

  def call
    puts 'Enter the ID of the person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    @library.list_rentals_for_person(id)
  end
end
