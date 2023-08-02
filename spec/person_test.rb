require 'rspec'
require_relative '../data_files/classroom'
require_relative '../data_files/person'

describe Person do
  let(:person) { Person.new(18, 'Hanna') }
  let(:book) { Book.new('The Hobbit', 'J.R.R.') }
  let(:date) { '2023-04-20' }
  let(:base_decorator) { BaseDecorator.new(person) }

  describe '#new' do
    it 'returns a person object' do
      expect(person).to be_an_instance_of(Person)
    end
  end

  describe '#rent_book' do
    it 'creates a new rental' do
      rental_person = person.rent_book(book, date)
      expect(rental_person.book).to eq(book)
      expect(person.rentals.length).to eq 1
      expect(rental_person.date).to eq(date)
      expect(rental_person.person).to eq(person)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      expect(person.can_use_services?).to be true
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is 18 or older' do
      expect(person.of_age?).to be true
    end
  end
end
