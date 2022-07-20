# frozen_string_literal: true

require 'json'

# rubocop:disable Metrics/BlockLength
RSpec.describe Combine::Presenter do
  let(:presenter) do
    journals_path = 'spec/fixtures/journals.csv'
    articles_path = 'spec/fixtures/articles.csv'
    authors_path = 'spec/fixtures/authors.json'

    journals_info = Combine::Parsers::CsvParser.parse(journals_path)
    articles_info = Combine::Parsers::CsvParser.parse(articles_path)
    authors_info = Combine::Parsers::JsonParser.parse(authors_path)

    journals = Combine::Collections::Journals.new(journals_info)
    articles = Combine::Collections::Articles.new(articles_info)
    authors = Combine::Collections::Authors.new(authors_info)

    full_articles = Combine::FullArticles.call(journals, articles, authors)

    described_class.new(full_articles, output_format)
  end

  let(:output_format) { :json }

  describe '#initialize' do
    it 'creates an object of the described class' do
      expect(presenter).to be_kind_of(described_class)
    end
  end

  describe '#output' do
    it 'respond to method' do
      expect(presenter).to respond_to(:output)
    end

    context 'format is :json' do
      it 'Returns an array of full_articles in json format' do
        full_articles_json = JSON.parse(File.read('spec/fixtures/full_articles.json'))

        expect(JSON.parse(presenter.output)).to eq full_articles_json
      end
    end

    context 'format is :csv' do
      let(:output_format) { :csv }

      it 'Returns an array of full_articles in csv format' do
        expect(presenter.output).to eq full_articles_csv
      end
    end
  end

  def full_articles_csv
    # rubocop:disable Style/StringLiterals
    # rubocop:disable Layout/LineLength
    [
      "\"10.1234/altmetric0\",\"Small Wooden Chair\",\"Amari Lubowitz\",\"Shanahan, Green and Ziemann\",\"1337-8688\"",
      "\"10.1234/altmetric100\",\"Ergonomic Rubber Shirt\",\"Lenny Kshlerin\",\"Wilkinson, Gaylord and Gerlach\",\"2542-5856\"",
      "\"10.1234/altmetric103\",\"Fantastic Granite Computer\",\"Howard Spinka Jr.\",\"Hahn and Sons\",\"3775-0307\"",
      "\"10.1234/altmetric118\",\"Gorgeous Cotton Chair\",\"Ms. Emilio Grady\",\"Corkery-Jast\",\"6817-8437\"",
      "\"10.1234/altmetric119\",\"Awesome Wooden Shoes\",\"Aracely Schneider\",\"Smith, Boehm and Haley\",\"8447-5341\""
    ]
    # rubocop:enable Layout/LineLength
    # rubocop:enable Style/StringLiterals
  end
end
# rubocop:enable Metrics/BlockLength
