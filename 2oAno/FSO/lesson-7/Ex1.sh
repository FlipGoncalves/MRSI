# executed without options,
# ls prints the list of not hidden files in the current directory
touch .dummy # to create a file named ".dummy"
ls # file ".dummy" does not show up

# option -a includes all hidden files in the list
ls -a # now, file ".dummy" appears in the list, but also . and ..

# option -A includes all hidden files except . and ..
ls -A

# option -l prints file properties along with the name
ls -l # not including the hidden files
ls -la # including also the hidden files

# option -t prints files sorted by modification time, newest first
ls -lt

# the following command shows a list of all bash commands
help

# the following comand shows a description of the internal command cd
help cd