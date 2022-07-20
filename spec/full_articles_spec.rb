# frozen_string_literal: true

require 'json'

# rubocop:disable Metrics/BlockLength
RSpec.describe Combine::FullArticles do
  let(:full_articles) do
    journals_path = 'spec/fixtures/journals.csv'
    articles_path = 'spec/fixtures/articles.csv'
    authors_path = 'spec/fixtures/authors.json'

    journals_info = Combine::Parsers::CsvParser.parse(journals_path)
    articles_info = Combine::Parsers::CsvParser.parse(articles_path)
    authors_info = Combine::Parsers::JsonParser.parse(authors_path)

    journals = Combine::Collections::Journals.new(journals_info)
    articles = Combine::Collections::Articles.new(articles_info)
    authors = Combine::Collections::Authors.new(authors_info)

    described_class.new(journals, articles, authors)
  end

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(full_articles).to be_kind_of(described_class)
    end
  end

  describe '#to_a' do
    it 'respond to method' do
      expect(full_articles).to respond_to(:to_a)
    end

    it 'Returns an array of full_articles (articles enriched with author and journal data)' do
      expect(full_articles.to_a).to eq expected_full_articles
    end
  end

  # rubocop:disable Metrics/MethodLength
  def expected_full_articles
    [
      {
        author: 'Amari Lubowitz',
        doi: '10.1234/altmetric0',
        issn: '1337-8688',
        journal: 'Shanahan, Green and Ziemann',
        title: 'Small Wooden Chair'
      },
      {
        author: 'Lenny Kshlerin',
        doi: '10.1234/altmetric100',
        issn: '2542-5856',
        journal: 'Wilkinson, Gaylord and Gerlach',
        title: 'Ergonomic Rubber Shirt'
      },
      {
        author: 'Howard Spinka Jr.',
        doi: '10.1234/altmetric103',
        issn: '3775-0307',
        journal: 'Hahn and Sons',
        title: 'Fantastic Granite Computer'
      },
      {
        author: 'Ms. Emilio Grady',
        doi: '10.1234/altmetric118',
        issn: '6817-8437',
        journal: 'Corkery-Jast',
        title: 'Gorgeous Cotton Chair'
      },
      {
        author: 'Aracely Schneider',
        doi: '10.1234/altmetric119',
        issn: '8447-5341',
        journal: 'Smith, Boehm and Haley',
        title: 'Awesome Wooden Shoes'
      }
    ]
  end
  # rubocop:enable Metrics/MethodLength
end
# rubocop:enable Metrics/BlockLength
