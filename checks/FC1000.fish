function FC1000 -d "Fish syntax error. Unable to parse script."
    set --local severity error
    set --local exitcode 0
    set --local failure
    set --local errpat
    set --local lineno
    set --local fishfile

    # Every FishCheck needs to report on itself
    argparse 's/severity' -- $argv
    or return 1
    if set -q _flag_severity
        echo $severity && return
    end

    for fishfile in $argv
        set failure (
            fish --no-execute $fishfile 2>&1 |
                string replace -r -- '^warning:\s*.+$' '' |
                string collect
        )
        if test -n "$failure"
            set errpat '^'$fishfile' \(line (\d+)\):\s*'
            set lineno (string match -rg -- $errpat $failure)
            if test $status -eq 0
                set failure (string replace -r -- $errpat '' $failure | string collect)
            else
                set lineno 0
            end

            set exitcode 1
            _fishcheck_report \
                --file $fishfile \
                --check-id (status function) \
                --severity $severity \
                --lineno $lineno \
                --message $failure
        end
    end
    return $exitcode
end
