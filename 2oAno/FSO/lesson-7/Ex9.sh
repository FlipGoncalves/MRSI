touch a1 a2 a77 abc b1 c12 ddd # to create some files
ls

prefix="_a_"
for f in a1 a2 a77 abc b1 c12 ddd
do
    echo "changing the name of \"$f\""
    mv $f $prefix$f
done
ls

f1()
{
    for file in $*
    do
        echo "==== $file ====" > $file
    done
}

f1 abc xpto zzz
cat xpto
cat abc
cat zzz