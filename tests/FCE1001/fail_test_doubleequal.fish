test "$foo" == bar && echo foo || echo bar
test ! "$bar" == baz && echo bar || echo baz
if test "$foo" = foo && test "$bar" == bar
    echo test fails!
end
