require 'socket'

server = TCPServer.new 2000

loop do
  client = server.accept
  str = client.gets
  client.puts str
  client.close
end
