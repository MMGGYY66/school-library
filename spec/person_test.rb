require_relative '../person'

describe Person do
  random_age = rand(18..60)
  let(:person) { Person.new(random_age, 'Nacho') }

  describe 'Test creating new person' do
    it 'test retriving person name' do
      expect(person.name).to eq('Nacho')
    end
    it 'test retriving person permission' do
      expect(person.parent_permission).to eq(true)
    end
    it 'test retriving person age' do
      expect(person.age).to eq(random_age)
    end
  end

  describe 'Test person methods' do
    it 'tests can_use_services? method' do
      expect(person.can_use_services?).to eq(true)
    end
    it 'tests correct_name method' do
      expect(person.correct_name).to eq('Nacho')
    end
  end
end
