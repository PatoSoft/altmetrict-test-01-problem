# frozen_string_literal: true

module Combine
  module Parsers
    # Parses the json file to an array of hashes
    class JsonParser
      require 'json'

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

      def to_a
        JSON.parse(File.read(path))
      end

      def validate_file
        raise "ERROR: File '#{path}' does not exist!" unless File.exist? path
      end
    end
  end
end
