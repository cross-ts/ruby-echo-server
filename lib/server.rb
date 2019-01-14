require 'socket'

require_relative 'socket_factory'

class Server
  class << self
    def run
      new.run
    end
  end

  def initialize
    Signal.trap('INT') { @killed = true }
    @socket = SocketFactory.generate(:tcp)
  end

  def run
    client, addr_info = @socket.accept
    client.puts "Hello!"
    client.puts "Time is #{Time.now}"
    loop do
      sleep(1)
      @x ||= 0
      client.puts @x += 1
      break if @killed
    end
  ensure
    @socket.close
    client.close
  end
end
