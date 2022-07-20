# frozen_string_literal: true

module Combine
  # Helpers
  module Helpers
    # ISSNs should always be formatted as two groups of four digits
    # separated by a hyphen, e.g. 1234-5678, but might be missing the hyphen in the
    # source data.

    # Custom error
    class WrongIssnFormatError < StandardError
      def message
        'Wrong issn format, we expect something like 11111111 or 1111-1111'
      end
    end

    def format_issn(issn)
      issn = issn.to_s

      return issn if /\d{4}-\d{4}/.match?(issn.to_s)
      return issn.insert(4, '-') if /\d{8}/.match?(issn)

      raise WrongIssnFormatError
    end
  end
end
