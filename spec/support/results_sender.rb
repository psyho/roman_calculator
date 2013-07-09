require 'faye'
require 'eventmachine'

class ResultsSender
  attr_reader :server

  def initialize(server)
    @server = server
  end

  def publish(team, score)
    EM.run do
      client = Faye::Client.new("http://#{server}/faye")
      msg = client.publish('/teams', name: team, score: score)
      msg.callback do
        EM.stop
      end
    end
  end
end
