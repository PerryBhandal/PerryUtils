require 'date'

class FileGenerator

  def generate()
    parse_args()
    create_file()
  end

  private

  def parse_args()
    if ARGV.length <= 0 or ARGV.length > 2
      puts "Invalid parameter count. Received %d in total, expected 0-2 (inclusive). Args are %s" % [ARGV.length, ARGV.inspect]
      exit
    end


    if ARGV.length == 1
      @title = ARGV[0]
      @prefix = get_date_prefix()
    elsif ARGV.length == 2
      switch = ARGV[0]

      if switch == "-i"
        @title = ARGV[1]
        @prefix = get_increment_prefix()
      elsif switch == "-e"
        @title = ARGV[1]
        @prefix = get_date_prefix()
      else
        fail
      end
    else
      fail
    end

  end

def create_file()
  # TODO [0]: Add check for file existence.

  file_name = "%s-%s.docx" % [@prefix, @title]
  if File.exist?(file_name)
    puts "File already exists with name #{file_name}"
    fail

  end

  system("cp ~/.scripts/doc_base/writer_base.odt #{file_name}")
  system("touch #{file_name}")
  system("gnome-open #{file_name}")
end

def get_increment_prefix()
  highest_prefix = 0
  Dir.foreach(".") do |name|
    if name.match(/^\d*?t-/)
      name_split = name.split("t")
      file_num = name_split[0].to_i


      if file_num > highest_prefix
        highest_prefix = file_num
      end
    end
  end

  highest_prefix += 1
  return "%dt" % [highest_prefix]
end

def get_date_prefix()
  todayDate = Date.today
  return "#{todayDate.month}.#{todayDate.day}.#{todayDate.year.to_s[2..-1]}"
end



end




FileGenerator.new().generate()
