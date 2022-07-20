#!/usr/bin/env ruby
# frozen_string_literal: true

require 'optparse'
require_relative 'lib/combine'

USAGE_MSG = 'Usage: ruby combine.rb --format json journals.csv articles.csv authors.json > full_articles.json'

output_format = :json # default format

OptionParser.new do |opts|
  opts.banner = USAGE_MSG

  # Optional format argument with keyword completion.
  opts.on('--format [FORMAT]', %i[json csv], 'Select output format (json, csv)') do |f|
    output_format = f
  end
end.parse!

if ARGV.length != 3
  warn "Error: We expect 3 arguments, #{USAGE_MSG}"
  exit
end

journals_path = "resources/#{ARGV[0]}"
articles_path = "resources/#{ARGV[1]}"
authors_path = "resources/#{ARGV[2]}"

journals_info = Combine::Parsers::CsvParser.parse(journals_path)
articles_info = Combine::Parsers::CsvParser.parse(articles_path)
authors_info = Combine::Parsers::JsonParser.parse(authors_path)

journals = Combine::Collections::Journals.new(journals_info)
articles = Combine::Collections::Articles.new(articles_info)
authors = Combine::Collections::Authors.new(authors_info)

full_articles = Combine::FullArticles.call(journals, articles, authors)

puts Combine::Presenter.call(full_articles, output_format)
