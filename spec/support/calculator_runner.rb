require_relative 'checker_examples'
require_relative 'results_sender'

class CalculatorRunner
  def self.run(server, team_name)
    sender = ResultsSender.new(server)
    new(sender, team_name).run
  end

  attr_reader :sender, :team_name

  def initialize(sender, team_name)
    @team_name = team_name
    @sender = sender
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
      [x, y, expected.to_roman, actual]
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
    sender.publish(team_name, solved.count)
    puts "Team #{team_name} has solved #{solved.count}/#{examples.count} examples"
  end
end

