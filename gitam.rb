###
# Merges your current branch into the master, pushes it and then deletes the merged branch.
# If you would like to checkout a new branch after the merge/delete is complete, pass its name as argument.
# E.g. ruby gitam.rb fix_typo
###

CWD = `pwd -P`.strip()

if ARGV.length > 2 || ARGV.length == 0
	$stderr.puts("Unexpected number of arguments. Expected one (in which case it would simply merge into that branch) or two if a new branch should be created.")
	exit
end

Dir.chdir(CWD) do
	#Get current branch name
	branchName = `git rev-parse --abbrev-ref HEAD`.strip()

	#Make sure no files are pending commit
	status = `git status`.strip()
	if !status.include?("nothing to commit")
		$stderr.puts "ERROR: Files are still pending commit."
		exit
	end

	#Check out our target branch name.
	system("git checkout #{ARGV[0]}")

	#Merge in our branch
	system("git merge #{branchName}")

	#Push our branch
	system("git push")

	#Delete our branch
	system("git branch -d #{branchName}")

	if ARGV.length == 1
		#Create our new branch
		system("git checkout -b #{ARGV[0]}")
	end
end

