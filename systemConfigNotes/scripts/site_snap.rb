if ARGV[0] == nil
  puts "No domain supplied."
  exit
end
OUT_DIR = "/home/perry/work/git/attractive_sites"
OUT_NAME = "#{Time.now.to_i}.jpg"

Dir.chdir(OUT_DIR) do
  system("cutycapt --url=http://www.desk.com --out=#{Time.now.to_i}.jpg --min-width=1920 --min-height=1080")
  logFile = File.new("picture_log.txt", "w+")
  logFile.puts("-- New Entry--")
  logFile.puts("#{Time.now} - Took picture of #{ARGV[0]} and saved it to #{OUT_NAME}")

  if ARGV[1] != nil
    logFile.puts("Reason for pic: #{ARGV[1..-1].join(" ")}")
  else
    logFile.puts("No reason given.")
  end
  logFile.close()

  system("git add .; git commit -a -m \"Image commit.\"; git push")
end
