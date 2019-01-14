require 'socket'

class Server
  class << self
    def run
      new.run
    end
  end

  def initialize
    @socket = TCPServer.new 2000
  end

  def run
    loop do
      client = @socket.accept
      client.puts "Hello!"
      client.puts "Time is #{Time.now}"
      client.close
    end
  end
end
