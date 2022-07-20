# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable Metrics/BlockLength
RSpec.describe Combine::Collections::Journals do
  let(:journals) do
    journals_info = [[journal_title, issn]]

    described_class.new(journals_info)
  end

  let(:journal_title) { 'journal title' }
  let(:issn) { '1111-1111' }

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(journals).to be_kind_of(described_class)
    end
  end

  describe '#journal_title_by_issn' do
    it 'respond to method' do
      expect(journals).to respond_to(:journal_title_by_issn)
    end

    context 'The journal exists in the collection' do
      it 'Returns the title of the journal' do
        expect(journals.journal_title_by_issn(issn)).to eq journal_title
      end
    end

    context 'The journal does NOT exist in the collection' do
      it 'Returns nil' do
        expect(journals.journal_title_by_issn('not registered issn')).to eq nil
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
# rubocop:enable Style/FrozenStringLiteralComment
