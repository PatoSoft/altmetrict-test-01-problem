# Altmetric Programming Exercise

In the resources directory, you'll find three data files:

* journals.csv: a list of journal titles and ISSNs;
* articles.csv: a list of article DOIs [0], titles and ISSNs;
* authors.json: a list of author names and their article DOIs.

We want to combine these data and output a single text file in one of two
different formats:

* CSV with columns of DOI, Article title, Author name, Journal title and
  Journal ISSN, e.g.

      10.1234/altmetric0,Small Wooden Chair,Amari Lubowitz,"Shanahan, Green and Ziemann",1337-8688

* JSON as an array of objects with fields for DOI, title, author, journal and
  ISSN, e.g.

    {
        "doi": "10.1234/altmetric0",
        "title": "Small Wooden Chair",
        "author": "Amari Lubowitz",
        "journal": "Shanahan, Green and Ziemann",
        "issn": "1337-8688"
    }

Note that ISSNs should always be formatted as two groups of four digits
separated by a hyphen, e.g. 1234-5678, but might be missing the hyphen in the
source data.

We'd like you to create a Ruby program that can take these three files and
produce the new formats by running it like so (assuming the program is called
combine.rb):

    $ ruby combine.rb --format json journals.csv articles.csv authors.json > full_articles.json
    $ ruby combine.rb --format csv journals.csv articles.csv authors.json > full_articles.csv

    [0]: http://en.wikipedia.org/wiki/Digital_object_identifier

# Usage
```
$ ruby combine.rb journals.csv articles.csv authors.json > full_articles.json
$ ruby combine.rb --format json journals.csv articles.csv authors.json > full_articles.json
$ ruby combine.rb --format csv journals.csv articles.csv authors.json > full_articles.csv
```

# Assumptions
- I assumed we want to enrich the articles provided by ```articles.csv``` with the author name and the journal title and we don't want to ouput journal or author data that is not related to any article.
- Only one author per doi. It is easy to change if we need to support multiple authors (using an array and joining them in the representation).

# Future improvements (out of scope)
- Create classes for each entity, ex: Article class that has the responsibility of updating an Article.
- Create a factory pattern desing for the parsers and for the representers.

# Running the tests
- ```spec/presenter_spec.rb``` serves as integration test for the complete project, all other files have their own unit tests.

Installing dependencies (only the first time):
```
bundle
```

For running the entire test suite:
```
bundle exec rspec spec
```

# Missing tests
- There are missing tests for the parsers (out of time).
- Would be good to create tests for the CLI (```ruby combine.rb``` command)

## Installing Ruby

### Windows

There's an installer, it's easy.
http://rubyinstaller.org/

### Mac

Newer macs ship with a usable version of Ruby.

Try `ruby -v` in a terminal window, and if it's 2.x you're fine.

http://www.railstutorial.org/book/beginning#sec-install_ruby
http://tutorials.jumpstartlab.com/topics/environment/environment.html
http://docs.railsbridge.org/installfest/macintosh

### Linux

Ubuntu: http://docs.railsbridge.org/installfest/linux
https://www.ruby-lang.org/en/installation/
