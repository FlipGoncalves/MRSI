ls
echo $? # should display 0, because the previous command succeed

rm zzz # to guarantee file zzz does not exist
echo $? # should display 1, if file zzz does not exist

test -f zzz
echo $? # should display 1, because file zzz does not exist

touch zzz # to guarantee file zzz exists
test -f zzz
echo $? # should display 0, because file zzz exists

touch zzz # to guarantee file zzz exists
if test -f zzz
then
    echo "File zzz exists"
else
    echo "File zzz does not exist"
fi

check()
{
    if test -f $1
    then
        echo -e "\e[33mFile zzz exists\e[0m"
    else
        echo -e "\e[31mFile zzz does not exist\e[0m"
    fi
}

touch zzz # to guarantee file zzz exists
check zzz
rm -f zzz # to guarantee file zzz does not exist
check zzz

check()
{
    if [ -f $1 ] # the brackets should appear isolated
    then
        echo -e "\e[33mFile zzz exists\e[0m"
    else
        echo -e "\e[31mFile zzz does not exist\e[0m"
    fi
}

touch zzz # to guarantee file zzz exists
check zzz
rm -f zzz # to guarantee file zzz does not exist
check zzz

rm -f zzz # to guarantee file zzz does not exist
if ! test -f zzz
then
    echo "File zzz does not exist"
fi

# or, equivalently
if ! [ -f zzz ]
then
    echo "File zzz does not exist"
fi

# the command following \verb!&&! only executes if the previous succeed
touch zzz # to guarantee file zzz exists
test -f zzz && echo "File zzz exists"

# the command following \verb!||! only executes if the previous fails
rm -f zzz # to guarantee file zzz does not exist
test -f zzz || echo "File zzz does not exist"