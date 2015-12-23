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

  def friendly_filename(filename)
    filename.gsub(/[^\w\s_-]+/, '')
      .gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
      .gsub(/\s+/, '_')
  end

  OUT_DIR = "/home/perry/work/git/attractive_sites/"
  OUT_NAME = "#{Time.now.to_i}"

  WRITE_NAME = friendly_filename("#{ARGV[0]}_#{OUT_NAME}")

  def takeShot(folderName, xRes, yRes)
    system("cutycapt --url=#{ARGV[0]} --out=#{WRITE_NAME}/#{xRes}_#{yRes}.jpg --min-width=#{xRes} --min-height=#{yRes}")
  end

  Dir.chdir(OUT_DIR) do
    system("mkdir #{WRITE_NAME}")
    logFile = File.new("#{WRITE_NAME}/log.txt", "w+")
    logFile.puts("#{Time.now} - Took picture of #{ARGV[0]}")

    RESOLUTIONS.each do |res|
      takeShot(WRITE_NAME, res[0], res[1])
    end

    if ARGV[1] != nil
      logFile.puts("Reason for pic: #{ARGV[1..-1].join(" ")}")
    else
      logFile.puts("No reason given.")
    end
    logFile.close()

    system("git pull; git add #{WRITE_NAME}; ~/.scripts/gitNoComment.sh push")
  end
