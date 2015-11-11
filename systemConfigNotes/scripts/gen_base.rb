require 'date'

if ARGV.length > 1
  switch = ARGV[0]

  if switch == "e"
    PREFIX = Time.now.to_i
    TITLE = ARGV[1]
  else
    puts "Invalid args."
  end
else
  todayDate = Date.today
  PREFIX = "#{todayDate.month}.#{todayDate.day}.#{todayDate.year.to_s[2..-1]}"
  TITLE = ARGV[0]
end

title = "#{PREFIX}-#{TITLE}.docx"

if File.exist?(title)
  puts "File already exists with name #{title}"
  exit
end

system("cp ~/.scripts/doc_base/writer_base.odt #{title}")
system("touch #{title}")
system("gnome-open #{title}")
