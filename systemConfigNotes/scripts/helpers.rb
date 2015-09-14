def do_sed()
  extension = ARGV[1]
  replacement = ARGV[2]

  if not (extension and replacement)
    puts "Invalid number of params. Need to pass 2 params: extension, replacement string (e.g. s/^.*?Marshmallow.*?$/"
  end

  command = "find . -type f -name \"#{extension}\" -exec sed -r -i #{replacement} {} \;"

end

target = ARGV[0]

if target == "sed"
  do_sed()
end
