require_relative '../data_files/person'
require_relative '../data_files/nameable'

describe Person::CapitalizeDecorator do
  let(:person) { Person.new(25, true, 'john smith') }
  let(:decorated_person) { Person::CapitalizeDecorator.new(person) }

  it 'returns the correct name' do
    expect(decorated_person.correct_name).to eq('John smith')
  end
end
describe Person::TrimmerDecorator do
  let(:person) { Person.new(25, true, 'john smith ss') }
  let(:decorated_person_sliced) { Person::TrimmerDecorator.new(person) }

  it 'returns the correct name' do
    expect(decorated_person_sliced.correct_name).to eq('john smith')
  end
end
describe Person::CapitalizeDecorator do
  let(:person) { Person.new(25, true, 'john smith') }
  let(:decorated_person) { Person::CapitalizeDecorator.new(person) }

  it 'returns the correct name' do
    expect(decorated_person.correct_name).to eq('John smith')
  end
end
describe Person::TrimmerDecorator do
  let(:person) { Person.new(25, true, 'john smith ss') }
  let(:decorated_person_sliced) { Person::TrimmerDecorator.new(person) }

  it 'returns the correct name' do
    expect(decorated_person_sliced.correct_name).to eq('john smith')
  end
end
