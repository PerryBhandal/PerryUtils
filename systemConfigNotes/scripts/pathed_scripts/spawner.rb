spawn_string = "mate-terminal" 
ARGV.each do |arg|
  spawn_string += " --tab -e \"#{arg}\""
end

system(spawn_string)
