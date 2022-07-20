# frozen_string_literal: true

module Combine
  # Helpers
  module Helpers
    # ISSNs should always be formatted as two groups of four digits
    # separated by a hyphen, e.g. 1234-5678, but might be missing the hyphen in the
    # source data.
    def format_issn(issn)
      return issn if /\d{4}-\d{4}/.match?(issn)

      issn.insert(4, '-')
    end
  end
end
