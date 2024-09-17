if test "$foo" == bar
    echo "test does not support =="
else if test "$foo" = foo && test "$bar" == bar
    echo test fails!
else if [ "$foo" == foo ] && [ "$bar" == bar ]
    echo "[ fails ]"
end

test "$foo" == bar && echo foo || echo bar
test ! "$bar" == baz && echo bar || echo baz
