require 'socket'

class MyTCPSocket < Socket
  def initialize
    super(AF_INET, SOCK_STREAM, 0)
    bind(addr)
    listen(1)
    self
  end

  private

  def addr
    self.class.sockaddr_in(2000, '0.0.0.0')
  end
end
