require 'spec_helper'

module WpRoster

  describe Player do

    let(:player) { Player.new(["David Wright", "5", "Infielder", "Active"]) }
    subject { player }

    its(:name)      { should eq "David Wright" }
    its(:number)    { should eq "5" }
    its(:position)  { should eq "Infielder" }
    its(:active)    { should eq "Active" }

    its(:to_s)      { should eq "David Wright                             | 5    | Infielder      | Active" }

  end

end