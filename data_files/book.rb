class Book
  attr_accessor :title, :author, :rentals, :available

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
    @available = true
  end

  def rent_book(person, date)
    rental = Rental.new(date, person, self)
    @rentals << rental
    person.rentals << rental
    self.available = false
    rental
  end

  def to_json(*)
    {
      title: @title,
      author: @author,
      rentals: @rentals,
      available: @available
    }.to_json(*)
  end
end
