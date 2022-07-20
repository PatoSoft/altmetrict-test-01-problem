# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Metrics/BlockLength
RSpec.describe Combine::Collections::Authors do
  let(:authors) do
    authors_info = [{ 'name' => author_name, 'articles' => %w[doi1 doi2] }]

    described_class.new(authors_info)
  end

  let(:author_name) { 'Author name' }

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(authors).to be_kind_of(described_class)
    end
  end

  describe '#author_name_by_doi' do
    it 'respond to method' do
      expect(authors).to respond_to(:author_name_by_doi)
    end

    context 'The author exists in the collection' do
      it 'Returns the name of the author' do
        expect(authors.author_name_by_doi('doi1')).to eq author_name
        expect(authors.author_name_by_doi('doi2')).to eq author_name
      end
    end

    context 'The author does NOT exist in the collection' do
      it 'Returns nil' do
        expect(authors.author_name_by_doi('not registered doi')).to eq nil
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
# rubocop:enable Style/FrozenStringLiteralComment
