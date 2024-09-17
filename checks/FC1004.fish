function FC1004 -d "Found bash-ism ';then'"
    set --local severity error
    set --local exitcode 0
    set --local lineno
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
            string match -rq -- '\bthen\b' $line || continue # Quick skip check.

            # Use Fish's read tokenizer (strips comments, etc)
            echo $line | read --local --list --tokenize tokens
            test (count $tokens) -gt 0 || continue

            # test sucks. Since we tokenize, we might have lines that begin with "-n" or some other nonsense that
            # test thinks is an argument, so we prefix with "x_".
            if test \( "x_$tokens[1]" = x_if -o "x_$tokens[1]" = x_else \) -a "x_$tokens[-2]" = "x_;" -a "x_$tokens[-1]" = x_then
                set exitcode 1
                set position (string match -rng -- '\b(;?\s*then)\b' $line | string split ' ') || set position 0 0
                _fishcheck_report \
                    --file $fishfile \
                    --check-id (status function) \
                    --severity $severity \
                    --lineno $lineno \
                    --line $line \
                    -S $position[1] -L $position[2]
            end
        end <$fishfile
    end
    return $exitcode
end
