[![Code Climate](https://codeclimate.com/github/bguest/tblr.png)](https://codeclimate.com/github/bguest/tblr) [![Build Status](https://travis-ci.org/bguest/tblr.png?branch=master)](https://travis-ci.org/bguest/tblr) [![Coverage Status](https://coveralls.io/repos/bguest/tblr/badge.png)](https://coveralls.io/r/bguest/tblr) [![Gem Version](https://badge.fury.io/rb/tblr.png)](http://badge.fury.io/rb/tblr) [![Dependency Status](https://gemnasium.com/bguest/tblr.png)](https://gemnasium.com/bguest/tblr)

# Tblr

Tblr (pronounced tabler) is a really little gem that gives you a table data type

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tblr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tblr

## Usage

Create a table

```ruby
headers = ['firstName', 'last_name']
rows = [
  %w(Barny Rubble),
  %w(Fred Flinstone),
  %w(Wilma Flinstone),
]
@table = Table.new(headers, rows)
```

Do things with your table

```ruby
@table.collect(&:firstName) #=> ['Rubble', 'Fred', 'Wilma']
@table.size #=> 3
@table[0] #=> #<Tblr::Row: @headers=["firstName", "last_name"], @row=["First", "Last"]>

@table.group_by(&:last_name) #=>
  # {
  #   "Rubble" => #<Tblr::Table: @headers=["firstName", "last_name"],
  #                @rows=[["Barny", "Rubble"]]>,
  #   "Flinstone" => #<Tblr::Table: @headers=["firstName", "last_name"],
  #                    @rows=[["Fred", "Flinstone"], ["Wilma", "Flinstone"]]>
  # }
```

*Note*: Table includes Enumerable, so you can do all those things too.

##Contributing

1. Fork it ( https://github.com/[my-github-username]/tblr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
2. Writes Specs, pull requrests will not be accepted without tests.
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
