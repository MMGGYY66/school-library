require_relative '../book'
require 'json'

class CreateBookMenu
  def initialize(library)
    @library = library
  end

  def call
    puts 'Enter book title:'
    title = gets.chomp
    puts 'Enter book author:'
    author = gets.chomp
    book = Book.new(title, author)
    @library.add_book(book)
    puts 'Book added!'
  end
end
