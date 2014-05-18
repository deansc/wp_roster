require 'spec_helper'

module WpRoster

  describe Extractor do
    context "with the New York Mets", vcr: {cassette_name: "lets-go-mets"} do
      let(:extractor) { Extractor.new("new york mets") }

      subject { extractor }

      its(:url)     { should == "https://en.wikipedia.org/wiki/Template:New_York_Mets_roster" }
      its(:document) { should be_a Nokogiri::HTML::Document }

      describe "#roster" do

        its(:active_roster) { should have_at_least(10).item }
        its(:active_roster) { should have(25).item }
        its(:inactive_roster) { should have_at_least(1).item }
        its(:inactive_roster) { should have(14).item }
        its(:coaches_others) { should have_at_least(1).item }

        its(:roster) { should have(51).item }

        #it { should be_a WpRoster::Player }

      end

      

    end

  end
end