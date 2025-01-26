# message "ola" is sent to the terminal display window
echo ola

# message "ola" is sent to file "z",
# any previous content of it being deleted
echo ola > z

# message "ola" is appended to the end of file "z";
# file "z" is created if it does not exit yet
echo ola >> z

rm -f zzz # to guarantee file "zzz" does not exist

# an error message is sent to the terminal display window
cat zzz

# the error message is sent to file "z",
# any previous content of it being deleted
cat zzz 2> z
cat z # to check the error message is there

# the error message is appended to the end of file "z"
cat zzz 2>> z # the error message is appended to the end of file "z"
cat z # Why are there 2 error messages in file "z"?
cat zzz > z # the error message is sent to the terminal window. Why?

# the following command sends to the terminal display window
# the constents of file "/etc/passwd"
cat /etc/passwd

# the following piping of commands prints in the terminal display window
# the number of lines of file "/etc/passwd"
cat /etc/passwd | wc -l

rm -f zzz # to guarantee zzz does not exist

# in the following command, the standard error is not redirected,
# so the error message appears in the terminal
cat zzz > err

# in the following command, the standard error is redirected
# to the same file as the standard output,
# so the error message is sent to file ’err’
cat zzz > err 2>&1
cat err # to check the error message is there

# in the following command, the standard output is not redirected
cat /etc/passwd 2> z

# in the following command, the standard output is redirected
# to the same file as the standard error
cat /etc/passwd 2> z >&2
cat z # to check the it