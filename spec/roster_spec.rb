require 'spec_helper'

module WpRoster
  describe Roster do

    context "with the LA Angels", vcr: {cassette_name: "la-angels"} do

      before do 
        @roster = WpRoster::Roster.get("Los Angeles Angels of Anaheim")
        
      end

      subject { @roster }

      it { should be_kind_of(Enumerable) }
      it { should have_at_least(40).item }
      
      describe "its first element" do
        before { @first = @roster.first }

        subject { @first }

        it { should be_a WpRoster::Player }

        its(:name)      { should eq "Garrett Richards" }
        its(:number)    { should eq "43" }
        its(:position)  { should eq "Pitchers" }
        its(:active)    { should eq "Active" }
      end

      describe "#order" do
        before do
          @ordered = @roster.order(:name, :asc)
        end

        describe "its first element" do
          before { @first_player = @ordered.first }

          subject { @first_player }

          it { should be_a WpRoster::Player }

          its(:name)      { should eq "Albert Pujols" }
          its(:position)  { should eq "Infielders" }
        end

      end
      

    end
  end
end