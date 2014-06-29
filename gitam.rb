###
# Merges your current branch into the master, pushes it and then deletes the merged branch.
# If you would like to checkout a new branch after the merge/delete is complete, pass its name as argument.
# E.g. ruby gitam.rb fix_typo
###

CWD = `pwd -P`.strip()

if ARGV.length > 1
	$stderr.puts("Unexpected number of arguments. Expected zero, or one containing the name of the new branch.")
	exit
end

Dir.chdir(CWD) do
	#Get current branch name
	branchName = `git rev-parse --abbrev-ref HEAD`.strip()

	if branchName == "master"
		$stderr.puts("In master currently. Can't merge or delete this.")
		exit
	end

	#Make sure no files are pending commit
	status = `git status`.strip()
	if !status.include?("nothing to commit")
		$stderr.puts "ERROR: Files are still pending commit."
		exit
	end

	#Check out our master
	system("git checkout master")

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

