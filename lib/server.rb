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
    client.puts 'Echo Server'
    loop do
      str = client.gets.chomp
      client.puts str
      @killed = true if str.match(/^exit$/)
      break if @killed
    end
  ensure
    @socket.close
    client.close
  end
end
