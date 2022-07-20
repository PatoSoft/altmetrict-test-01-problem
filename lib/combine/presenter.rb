# frozen_string_literal: true

module Combine
  # Outputs the result in json or csv
  class Presenter
    require 'json'

    def self.call(info, output_format)
      new(info, output_format).output
    end

    def initialize(info, output_format)
      @info = info
      @output_format = output_format
    end

    def output
      case output_format
      when :json
        info.to_json
      when :csv
        to_csv
      end
    end

    private

    attr_reader :info, :output_format

    def to_csv
      info.map do |full_article|
        [
          "\"#{full_article[:doi]}\"",
          "\"#{full_article[:title]}\"",
          "\"#{full_article[:author]}\"",
          "\"#{full_article[:journal]}\"",
          "\"#{full_article[:issn]}\""
        ].join(',')
      end
    end
  end
end
