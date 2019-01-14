require_relative 'my_tcp_socket'

class SocketFactory
  class << self
    def generate(key)
      case key
      when :tcp
        MyTCPSocket.new
      else
        raise
      end
    end
  end
end
