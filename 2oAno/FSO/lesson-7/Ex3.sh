mkdir dir1
cd dir1
touch a a1 a2 a3 a11 b b1 b11 b12 b21 # to create some files
ls
ls a*
ls *1
ls a?
ls b??
ls b?*
ls *

touch a a1 a2 a3 a11 b b1 b11 c c11 # to create some files
ls
ls [ac]
ls [a-c]
ls [a-c]?
ls [ab]*

touch a1 a2 a3 a4 a22 # to create some files
echo a*
echo a\*
echo a?
echo a\?
echo a\[
echo a\\

touch a1 a2 a3 a4 a22 # to create some files
echo a*
echo "a*"
echo ’a*’