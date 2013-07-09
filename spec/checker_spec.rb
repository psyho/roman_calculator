require 'spec_helper'

require_relative 'checker_examples'

SERVER = 'localhost'

class CalculatorRunner
  def self.run(server, team_name)
    new(server, team_name).run
  end

  attr_reader :server, :team_name

  def initialize(server, team_name)
    @team_name = team_name
    @server = server
  end

  def run
    send_results
    printable_results
  end

  private

  def printable_results
    solved + [failed.first]
  end

  def results
    examples.map do |x, y, expected|
      actual = x.to_roman + y.to_roman
      [x, y, expected, actual]
    end
  end

  def examples
    CHECKER_EXAMPLES
  end

  def solved
    results.select { |_, _, expected, actual| expected == actual }
  end

  def failed
    results.reject { |_, _, expected, actual| expected == actual }
  end

  def send_results
    puts "Team #{team_name} has solved #{solved.count}/#{examples.count} examples"
  end
end

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
