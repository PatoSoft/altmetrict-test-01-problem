# frozen_string_literal: true

module Combine
  # Returns an array of hashes (each one represents a full article)
  class FullArticles
    def self.call(journals, articles, authors)
      new(journals, articles, authors).to_a
    end

    def initialize(journals, articles, authors)
      @journals = journals
      @articles = articles
      @authors = authors
    end

    def to_a
      combine
    end

    private

    attr_reader :journals, :articles, :authors

    def combine
      # Linear time complexity O(n) (n = article amount)
      articles.to_a.map do |article|
        article[:journal] = journals.journal_title_by_issn(article[:issn])
        article[:author] = authors.author_name_by_doi(article[:doi])
        article
      end
    end
  end
end
