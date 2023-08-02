require 'json'

class Save
  def save_books(library)
    books_arr = []
    library.books.each do |book|
      book = { title: book.title, author: book.author }
      books_arr.push(book)
    end
    File.write('books.json', JSON.generate(books_arr))
  end

  def read_books(library)
    File.write('books.json', JSON.generate([])) unless File.exist?('books.json')

    if File.exist?('./books.json') && !File.empty?('./books.json')
      json_data = File.read('./books.json')
      books = JSON.parse(json_data)
      books.each do |book|
        new_book = Book.new(book['title'], book['author'])
        library.books << new_book
      end
    else
      books = []
    end
    File.write('./books.json', books.to_json)
  end

  # rubocop:todo Metrics/PerceivedComplexity
  def save_person(library) # rubocop:todo Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    persons = []

    persons = JSON.parse(File.read('people.json')) if File.exist?('people.json') && !File.empty?('people.json')

    library.person.each do |person|
      if person.instance_of?(::Student)
        st = { name: person.name, age: person.age, permission: person.parent_permission, type: person.class }
        persons.push(st) unless persons.any? { |p| p['name'] == person.name && p['type'] == person.class.to_s }
      else
        teacher = { name: person.name, age: person.age, specialization: person.specialization, type: person.class }
        persons.push(teacher) unless persons.any? { |p| p['name'] == person.name && p['type'] == person.class.to_s }
      end
    end
    File.write('people.json', JSON.generate(persons))
  end
  # rubocop:enable Metrics/PerceivedComplexity

  def read_person(library)
    File.write('people.json', JSON.generate([])) unless File.exist?('people.json')

    if File.exist?('./people.json') && !File.empty?('./people.json')
      json_data = File.read('./people.json')
      persons = JSON.parse(json_data)
      persons.each do |person|
        new_person = if person['type'] == 'Student'
                       Student.new(person['age'], person['name'], person['name'])
                     else
                       Teacher.new(person['age'], person['name'], person['name'])
                     end
        library.person << new_person
      end
    else
      persons = []
    end
    File.write('./people.json', JSON.generate(persons))
  end

  def save_rentals(library)
    rentals_arr = []
    library.rentals.each do |rental|
      rental = { date: rental.date, book: rental.book, person: rental.person }
      puts rental
      rentals_arr.push(rental)
    end
    File.write('rentals.json', JSON.generate(rentals_arr))
  end

  def read_rentals(library)
    File.write('./rentals.json', JSON.generate([])) unless File.exist?('./rentals.json')

    if File.exist?('./rentals.json') && !File.empty?('./rentals.json')
      json_data = File.read('./rentals.json')
      rentals = JSON.parse(json_data)
      rentals.each do |rental|
        new_rental = Rental.new(rental['date'], rental['book'], rental['person'])

        library.rentals << new_rental
      end
    else
      rentals = []
    end
    File.write('./rentals.json', JSON.generate(rentals))
  end
end
