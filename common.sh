is_admin()
{
    net session > /dev/null 2>&1
    if [ $? -eq 0 ]; then return 0
    else return 1; fi
}

admin_only()
{
    if ! is_admin; then echo 'ERROR - No permissions, must be run as admin' && exit; fi
}

# return 1 if we're running linux, 0 if not
is_linux()
{
    if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        retval=0
    else
        retval=1
    fi
    return "$retval"
}

make_link()
{
    if is_linux; then
        ln -s $1 $2
    else
        echo "it's not linux. need to check how to make symlink"
        admin_only
    fi
}
