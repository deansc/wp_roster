module WpRoster
  class Extractor

    include WpRoster::Browser

    BASE_URL  = "https://en.wikipedia.org/wiki/Template:#_roster"
    CSS_PATH  = "div#content div#bodyContent div#mw-content-text table.toccolours tr"


    def initialize name
      self.url  = parse_url(name)
    end

    def roster      
      @roster ||= active_roster
        .concat(inactive_roster)
        .concat(coaches_others).collect do |p|
          Player.new(p) if p.size == 4
      end
    end

    def active_roster
      extract_players_from(document.css(CSS_PATH).last.children[0].children)
        .concat(extract_players_from(document.css(CSS_PATH).last.children[4].children))
        .map {|row| row << "Active"}
    end

    def inactive_roster
      extract_players_from(document.css(CSS_PATH).last.children[8].children)
        .map {|row| row << "Inactive"}
    end

    def coaches_others
      extract_players_from(document.css(CSS_PATH).last.children[12].children)
        .map {|row| row << "Other"}
    end

    private
      
      def extract_players_from node
        position, players = ["", []]
        node.text.split("\n").each do |string|
          string.strip!
          position = string if (string =~ /^(ca|pi|in|ou|ma|co|60-)/i)
          players.push([$2, $1, position])  if /^([0-9]+) +([A-Z]+.*)/.match(string)            
        end
        players
      end

      def parse_url name
        BASE_URL.sub('#', name.split(' ').map { |word| (word == "of") ? word = word.downcase : word = word.capitalize }.join('_'))
      end

  end
end