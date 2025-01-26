# assign ’abc’ to variable x and ’0123456789’ to variable xx
x=abc
xx=0123456789

# display the values of variables x and xx
echo ${x}
echo $x
echo ${xx}
echo $xx

# display a string composed of the value of x concatenated with string ’x’
echo ${x}x

# display a string composed of the string ’x’ concatenated with the value of variable x
echo x${x}
echo x$x

# Can you antecipate the result of executing the following 3 commands?
touch a1 a2 a3 a4 a22 # to create some files
z=a* # which value is assigned to z?
ls $z
echo $z

touch a1 a2 a3 a4 a22 # to create some files
z=a*
echo $z
echo "$z" # reference to variables are expanded within weak quotes
echo ’$z’ # reference to variables are not expanded within strong quotes

x=0123456789 # to create a variable

# The following construction allows to extract a substring from the value of a variable
echo ${x:2:4}

# The following construction allows to replace a substring with a new value
echo ${x/123/ccc}

