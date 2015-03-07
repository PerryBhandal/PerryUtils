if ARGV[0] == nil
  puts "No domain supplied."
  exit
end
RESOLUTIONS = 
  [
    [1920,1080],
    [1366, 768],
    [720,1280],
    [320,480]
]

  #OUT_DIR = "/home/perry/work/git/attractive_sites"
  OUT_DIR = "."
  OUT_NAME = "#{Time.now.to_i}"

  def takeShot(folderName, xRes, yRes)
    system("cutycapt --url=#{ARGV[0]} --out=#{folderName}/#{xRes}_#{yRes}.jpg --min-width=#{xRes} --min-height=#{yRes}")
  end

  system("mkdir #{OUT_NAME}")
  logFile = File.new("#{OUT_NAME}/log.txt", "w+")
  logFile.puts("#{Time.now} - Took picture of #{ARGV[0]}")

  RESOLUTIONS.each do |res|
    takeShot(OUT_NAME, res[0], res[1])
  end

  if ARGV[1] != nil
    logFile.puts("Reason for pic: #{ARGV[1..-1].join(" ")}")
  else
    logFile.puts("No reason given.")
  end
  logFile.close()

  system("git pull; git add #{OUT_NAME}; ~/.scripts/gitNoComment.sh push")
