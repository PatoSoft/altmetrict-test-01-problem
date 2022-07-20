# rubocop:disable Style/FrozenStringLiteralComment
RSpec.describe Combine::Collections::Articles do
  let(:articles) do
    articles_info = [%w[doi title 11111111]]

    described_class.new(articles_info)
  end

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(articles).to be_kind_of(described_class)
    end
  end

  describe '#to_a' do
    it 'respond to method' do
      expect(articles).to respond_to(:to_a)
    end

    it 'Returns an array of articles' do
      expect(articles.to_a).to eq [{ doi: 'doi', title: 'title', issn: '1111-1111' }]
    end
  end
end
# rubocop:enable Style/FrozenStringLiteralComment
