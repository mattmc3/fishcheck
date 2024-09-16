function FCE1010 -d "Found bash-ism ';then'"
    set -l exitcode 0
    set -l re_then '(;?\s*then)\s*(\#.*)?$'
    for fishfile in $argv
        set -l lineno 0
        while read -l line
            set lineno (math $lineno + 1)
            echo $line | read -lat tokens
            if test $tokens[1] = "if" -o $tokens[1] = "else" && test $tokens[-1] = "then"
                set -l position (string match -rng -- $re_then $line | string split ' ')
                test $status -eq 0 || set position 0 0
                set exitcode 1
                _fishcheck_report \
                    --file $fishfile \
                    --check FCE1010 \
                    --lineno $lineno \
                    --line $line \
                    -S $position[1] -L $position[2]
            end
        end <$fishfile
    end
    return $exitcode
end
