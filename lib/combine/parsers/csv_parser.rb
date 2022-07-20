# frozen_string_literal: true

module Combine
  module Parsers
    # Parses the csv file to an array of arrays
    class CsvParser
      require 'csv'

      SEPARATOR = ','
      OPTIONS = {
        encoding: 'iso-8859-1:utf-8',
        quote_char: '"',
        force_quotes: true,
        headers: :first_row,
        return_headers: false
      }.freeze

      def self.parse(path)
        new(path).parse_file
      end

      def initialize(path)
        @path = path
      end

      def parse_file
        validate_file
        to_a
      end

      private

      attr_reader :path

      private_constant :SEPARATOR, :OPTIONS

      def to_a
        CSV.foreach(path, OPTIONS)
      end

      def validate_file
        raise "ERROR: File '#{path}' does not exist!" unless File.exist? path
      end
    end
  end
end
