# In the following example, the output of a group of commands is redirected to a file.
{
    ls
    echo ========================
    ls
} > z
cat z

# In the following example, the output of a group of commands is redirected to a file.
(
    ls
    echo ========================
    ls
) > z
cat z

# variable zzz within the {..} group is the same as out of it,
# because every thing happens in the same shell scope
zzz=abc
echo "$zzz (out of group)"
{
    echo "$zzz (within group)"
    zzz=xpto
    echo "$zzz (within group)"
}
echo "$zzz (out of group)"

# variable zzz within the (..) group is not the same as out of it,
# so the assignment done within the subshell does not affect variable zzz out of it
zzz=abc
echo "$zzz (out of group)"
(
    echo "$zzz (within group)"
    zzz=xpto
    echo "$zzz (within group)"
)
echo "$zzz (out of group)"