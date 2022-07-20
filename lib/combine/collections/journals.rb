# frozen_string_literal: true

module Combine
  module Collections
    # Manage journals collection
    class Journals
      require_relative 'helpers'
      include Combine::Helpers

      def initialize(journals_info)
        @journals_info = journals_info
      end

      def journal_title_by_issn(issn)
        # Amortized constant time for access O(1)
        journal_titles_hashed_by_issn[issn]
      end

      private

      attr_reader :journals_info

      def journal_titles_hashed_by_issn
        # { formatted_issn => journal_title }
        @journal_titles_hashed_by_issn ||=
          journals_info.each_with_object({}) do |journal_info, hash|
            formatted_issn = format_issn(journal_info[1])

            hash[formatted_issn] = journal_info[0]
          end
      end
    end
  end
end
