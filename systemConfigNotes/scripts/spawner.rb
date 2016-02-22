#!/usr/bin/ruby

spawn_string = "mate-terminal " 
ARGV.each do |arg|
  spawn_string += "--tab -e \"#{arg}\""
end

puts "Spawn string is %s" % spawn_string
