function FC1003 -d "test command does not support '=='"
    set --local severity error
    set --local exitcode 0
    set --local testpat 'test|\['
    set --local lineno
    set --local part
    set --local equalsidx
    set --local test_arg1
    set --local position

    # Every FishCheck needs to report on itself
    argparse s/severity -- $argv
    or return 1
    if set -q _flag_severity
        echo $severity && return
    end

    for fishfile in $argv
        set lineno 0
        while read --local line
            set lineno (math $lineno + 1)
            string match -rq -- '(test|\[).+==' $line || continue # Quick skip check.

            # Use Fish's read tokenizer
            echo $line | read --local --list --tokenize tokens
            test (count $tokens) -gt 0 || continue

            for idx in (seq (count $tokens))
                set part $tokens[$idx]
                if test "$part" = "[" || test "$part" = test
                    # look for double equals in tests, such as "test foo == bar", or
                    # even goofy stuff like 'test ! "$bar" == $baz'
                    set equalsidx (math $idx + 2)
                    set test_arg1 $tokens[(math $idx + 1)]
                    if test "$test_arg1" = "!"
                        set equalsidx (math $idx + 3)
                    end

                    if test "$tokens[$equalsidx]" = "=="
                        set exitcode 1
                        set position (string match -rn -- '==' $line | string split ' ')
                        test $status -eq 0 || set position 0 0
                        _fishcheck_report \
                            --file $fishfile \
                            --check-id (status function) \
                            --severity $severity \
                            --lineno $lineno \
                            --line $line \
                            -S $position[1] -L $position[2] \
                            --did-you-mean (string replace --all '==' '=' -- $line)
                    end
                end
            end
        end <$fishfile
    end
    return $exitcode
end
