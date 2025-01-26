# the following code defines function x
myls()
{
    ls -ltrh
}

# the following code calls the previously defined function myls
myls

# You can use it as any other command.
# Here, piping its output to the word count command
myls | wc -l

# definition of function y
y()
{
    echo $# # the number of arguments
    echo $1 # the first argument
    echo $2 # the second argument
    echo $* # the list of all arguments
    echo $@ # idem
    echo "$*" # idem
    echo "$@" # idem
}

# calling it with some arguments
y a bb ccc dddd eeeee
y a "b b" ccc ’dd dd’ eeeee # note the effect of the quote characters