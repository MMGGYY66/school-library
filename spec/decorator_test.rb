# require_relative '../data_files/person'
# require_relative '../data_files/nameable'
require_relative '../decorator'
require_relative '../person'

describe Decorator do
  person = Person.new(25, 'maximilianus')
  it 'teats base decorator' do
    expect(person.correct_name).to eql('maximilianus')
  end
  it 'tests the capitalization decorator' do
    capitalized_person = CapitalizeDecorator.new(person)
    expect(capitalized_person.correct_name).to eql('Maximilianus')
  end
  it 'tests the trimmed decorator' do
    trimmed_person = TrimmerDecorator.new(person)
    expect(trimmed_person.correct_name).to eql('maximilian')
  end
end
