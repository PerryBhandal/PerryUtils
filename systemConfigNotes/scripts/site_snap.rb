if ARGV[0] == nil
  puts "No domain supplied."
  exit
end
OUT_DIR = "/home/perry/work/git/attractive_sites"
OUT_NAME = "#{Time.now.to_i}"

Dir.chdir(OUT_DIR) do
  system("cutycapt --url=#{ARGV[0]} --out=#{Time.now.to_i}.jpg --min-width=1920 --min-height=1080")
  logFile = File.new("#{OUT_NAME}.txt", "w+")
  logFile.puts("#{Time.now} - Took picture of #{ARGV[0]} and saved it to #{OUT_NAME}.jpg")

  if ARGV[1] != nil
    logFile.puts("Reason for pic: #{ARGV[1..-1].join(" ")}")
  else
    logFile.puts("No reason given.")
  end
  logFile.close()

  system("git pull; git add #{OUT_NAME}.*; git commit -a -m \"Image commit.\"; git push")
end
