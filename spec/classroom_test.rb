require 'rspec'
require_relative '../classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  describe '#new' do
    it 'returns a Classroom object' do
      expect(classroom).to be_an_instance_of(Classroom)
    end
  end
end
