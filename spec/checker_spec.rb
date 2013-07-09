require 'spec_helper'

require_relative 'support/calculator_runner'

describe "Roman Calculator Checker" do
  if TEAM_NAME
    calculator_examples = CalculatorRunner.run(SERVER, TEAM_NAME)

    calculator_examples.each do |x, y, expected, actual|
      it "sums #{x} and #{y} to #{expected}" do
        actual.should == expected
      end
    end
  else
    it "requires a team name" do
      fail("Please fill in your team name in spec_helper.rb")
    end
  end
end
