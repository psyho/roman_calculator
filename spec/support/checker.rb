require_relative 'checker_examples'
require_relative 'results_sender'

class Checker
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

  def examples
    CHECKER_EXAMPLES
  end

  def results
    @results ||= examples.map do |value, expected|
      actual = value.to_roman.to_i rescue "ERROR!"
      [value, expected, actual]
    end
  end

  def solved
    results.select do |_, expected, actual|
      expected == actual
    end
  end

  def failed
    results - solved
  end

  def send_results
    sender.publish(team_name, solved.count)
    puts "Team #{team_name} has solved #{solved.count}/#{examples.count} examples"
  end
end

