function FCE1010 -d "Found bash-ism ';then'."
    set -l exitcode 0
    set -l re_then '(;\s*then)\s*(\#.*)?$'
    for fishfile in $argv
        set -l lineno 0
        while read -l line
            set lineno (math $lineno + 1)
            echo $line | read -lat tokens
            # test sucks. Since we tokenize, we might have lines that begin with "-n" or some other nonsense that
            # test thinks is an argument, so we prefix with "x_".
            if test \( "x_$tokens[1]" = x_if -o "x_$tokens[1]" = x_else \) -a "x_$tokens[-2]" = "x_;" -a "x_$tokens[-1]" = x_then
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
