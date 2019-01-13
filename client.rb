require 'socket'

s = TCPSocket.new 'localhost', 2000

while line = s.gets
  s.puts line
  puts line
end

s.close
