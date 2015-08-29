OUT_NAME = "trace.txt"
FILTER_OUT = ["/usr/", "read\(", "close\("]
FILTER_IN = ["open"]

COMMAND_PREFIX = "python"
COMMAND_TARGET_ARG = "test.py"

COMMAND = "%s %s" % [COMMAND_PREFIX, COMMAND_TARGET_ARG]

##################
# End Config
# ################

def runstrace(command)
  system("rm -rf %s" % OUT_NAME)
  system("strace -o %s -e trace=open,close,read,write,connect,accept %s" % [OUT_NAME, COMMAND])
end

def parseOutput()
  openWrite = File.readlines(OUT_NAME)

  found_program_start = false 

  openWrite.each do |cur_line|
    include_line = true 

    if cur_line.include?(COMMAND_TARGET_ARG) and !found_program_start
      found_program_start = true
    end

    if found_program_start
      FILTER_OUT.each do |a_filter|
        if cur_line.include?(a_filter)
          include_line = false 
        end
      end

      FILTER_IN.each do |a_filter|
        if !cur_line.include?(a_filter)
          include_line =false 
        end
      end

      if include_line
        puts cur_line
      end

    end

  end
end


runstrace(COMMAND)
parseOutput()
