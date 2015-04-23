require 'date'

if ARGV.length != 1
  puts "Incorrect number of args, expected 1, got %d" % ARGV.length
  exit
end

todayDate = Date.today
title = "#{todayDate.month}.#{todayDate.day}.#{todayDate.year.to_s[2..-1]}-#{ARGV[0]}.odt"

if File.exist?(title)
  puts "File already exists with name #{title}"
  exit
end

system("cp ~/.scripts/doc_base/writer_base.odt #{title}")
system("touch #{title}")
system("gnome-open #{title}")
