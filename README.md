# wp_roster

This gem provides the current roster of any MLB team by scraping the content of English Wikipedia template pages.

## Installation

Add this line to your application's Gemfile:

`gem "wp_roster", "~> 0.0.1"`

## Usage

``` ruby
require 'wp_roster'

# Just need the name of the team
roster = WpRoster::Roster.get('new york mets')

# Get more details
roster.players.size            # => 44

roster.players.first.name      # => "Bartolo Colón"
roster.players.first.number    # => "40"
roster.players.first.position  # => "Catchers"
roster.players.first.active    # => "Active roster"

```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/wp_roster/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

