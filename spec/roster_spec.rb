require 'spec_helper'

module WpRoster
  describe Roster do
    context "with the LA Angels", vcr: {cassette_name: "la-angels"} do

      let(:roster) { WpRoster::Roster.get("Los Angeles Angels of Anaheim") }
      subject { roster }

      its(:players) { should have_at_least(40).item }

    end
  end
end