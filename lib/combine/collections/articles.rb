# frozen_string_literal: true

module Combine
  module Collections
    # Returns an array of hashes (each one represents an article)
    class Articles
      require_relative '../helpers'
      include Combine::Helpers

      def initialize(articles_info)
        @articles_info = articles_info
      end

      def to_a
        articles_info.map do |article_info|
          {
            doi: article_info[0].to_s,
            title: article_info[1].to_s,
            issn: format_issn(article_info[2])
          }
        end
      end

      private

      attr_reader :articles_info
    end
  end
end
