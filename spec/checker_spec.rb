require 'spec_helper'

require_relative 'support/checker'

describe "Roman Calculator Checker" do
  if TEAM_NAME
    calculator_examples = Checker.run(SERVER, TEAM_NAME)

    calculator_examples.each do |value, expected|
      it "converts #{value} to #{expected}" do
        value.to_roman.to_i.should == expected
      end
    end
  else
    it "requires a team name" do
      fail("Please fill in your team name in spec_helper.rb")
    end
  end
end
