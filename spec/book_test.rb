require_relative '../book'
require_relative '../helper_methods'

describe Book do
  let(:book) { Book.new('The Book', 'Mohamed') }

  describe '#title' do
    it 'returns the title' do
      expect(book.title).to eq('The Book')
    end
  end

  describe '#author' do
    it 'returns the author' do
      expect(book.author).to eq('Mohamed')
    end
  end
end
