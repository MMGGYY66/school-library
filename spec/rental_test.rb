require 'rspec'
require_relative '../data_files/rental'

describe Rental do
  let(:rental) { Rental.new('2023-04-20', 'Book', 'Person') }

  describe '#new' do
    it 'returns a Rental object' do
      expect(rental).to be_an_instance_of(Rental)
    end
  end
end
