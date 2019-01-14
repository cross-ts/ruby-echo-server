require 'socket'

class Server
  class << self
    def run
      new.run
    end
  end

  def initialize
    Signal.trap('INT') { @killed = true }
    @socket = create_server_socket
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

  private

  def create_server_socket
    socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
    sock_addr = Socket.sockaddr_in(2000, '0.0.0.0')
    socket.bind(sock_addr)
    socket.listen(1)
    socket
  end
end
