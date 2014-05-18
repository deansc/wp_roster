module WpRoster

  class Player
    attr_accessor :name, :number, :position, :active

    def initialize fields
      @name       = fields[0]
      @number     = fields[1]
      @position   = fields[2]
      @active     = fields[3]
    end

    def to_s
      [@name.ljust(40), @number.ljust(4), @position.ljust(14), @active].join(" | ")
    end

  end

  class Roster
    attr_accessor :players

    class << self
      def get team_name
        extractor = WpRoster::Extractor.new(team_name)
        self.new extractor.roster
      end
    end

    def initialize players
      @players  = players
    end


    def order field, sort
      @players.sort! { |a,b| a.send(field) <=> b.send(field) }
      sort == :asc ? @players : @players.reverse!
    end

  end

end