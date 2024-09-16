function FCE1001 -d "'test' command expects '=', not '=='."
    set -l exitcode 0
    set -l testpat 'test|\['
    for fishfile in $argv
        set -l lineno 0
        while read -l line
            set lineno (math $lineno + 1)
            echo $line | read -lat tokens
            test (count $tokens) -gt 0 || continue

            for idx in (seq (count $tokens))
                set -l part $tokens[$idx]
                if test "$part" = "[" || test "$part" = test
                    # look for double equals in tests, such as "test foo == bar", or
                    # even goofy stuff like 'test ! "$bar" == $baz'
                    set -l equalsidx (math $idx + 2)
                    set -l test_arg1 $tokens[(math $idx + 1)]
                    if test "$test_arg1" = "!"
                        set equalsidx (math $idx + 3)
                    end

                    if test "$tokens[$equalsidx]" = "=="
                        set exitcode 1
                        set -l position (string match -rn -- '==' $line | string split ' ')
                        test $status -eq 0 || set position 0 0
                        _fishcheck_report \
                            --file $fishfile \
                            --check FCE1001 \
                            --lineno $lineno \
                            --line $line \
                            -S $position[1] -L $position[2]
                    end
                end
            end
        end <$fishfile
    end
    return $exitcode
end
