# wp_roster

This gem provides the current roster of any MLB team by scraping the content of English Wikipedia template pages.

## Installation

Type in your terminal:

`gem install wp_roster`

Or add this line to your application's Gemfile:

`gem "wp_roster", "~> 0.1.0"`

## Usage

``` ruby
require 'wp_roster'

# Just need the name of the team
roster = WpRoster::Roster.get('new york mets')

# Get more details
roster.players.size            # => 51

roster.players.first           
# => #<WpRoster::Player:0x007fe7d42fe2c0 @name="Bartolo Colón", @number="40", @position="Pitchers", @active="Active">

roster.players.first.name      # => "Bartolo Colón"
roster.players.first.number    # => "40"
roster.players.first.position  # => "Catchers"
roster.players.first.active    # => "Active roster"

puts roster.players[2]
# =>  Rafael Montero                           | 50   | Pitchers       | Active

puts roster.players
# =>  Bartolo Colón                            | 40   | Pitchers       | Active
#     Jacob deGrom                             | 48   | Pitchers       | Active
#     Rafael Montero                           | 50   | Pitchers       | Active
#     ...

roster.order(:name, :desc)
puts roster.players
# =>  Zack Wheeler                             | 45   | Pitchers       | Active
#     Zach Lutz                                | 19   | Infielders     | Inactive
#     Wilfredo Tovar                           | 70   | Infielders     | Inactive
#     Vic Black                                | 38   | Pitchers       | Inactive
#     ...

```

## Contributing

1. Fork it ( http://github.com/deansc/wp_roster/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request