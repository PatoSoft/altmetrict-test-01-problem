# frozen_string_literal: true

module Combine
  module Collections
    # Manage authors collection
    class Authors
      def initialize(authors_info)
        @authors_info = authors_info
      end

      def author_name_by_doi(doi)
        # Amortized constant time for access O(1)
        author_names_hashed_by_doi[doi]
      end

      private

      attr_reader :authors_info

      def author_names_hashed_by_doi
        # { doi => author_name }
        @author_names_hashed_by_doi ||=
          authors_info.each_with_object({}) do |author, hash|
            author['articles'].each { |article_doi| hash[article_doi] = author['name'] }
          end
      end
    end
  end
end
