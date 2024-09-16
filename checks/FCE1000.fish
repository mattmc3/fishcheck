function FCE1000 -d "Fish syntax error. Unable to parse script."
    set -l exitcode 0
    for fishfile in $argv
        set -l failure (
            fish --no-execute $fishfile 2>&1 |
                string replace -r -- '^warning:\s*.+$' '' |
                string collect
        )
        if test -n "$failure"
            set -l errpat '^'$fishfile' \(line (\d+)\):\s*'
            set -l lineno (string match -rg -- $errpat $failure)
            if test $status -eq 0
                set failure (string replace -r -- $errpat '' $failure | string collect)
            end

            set exitcode 1
            _fishcheck_report \
                --file $fishfile \
                --check FCE1000 \
                --lineno $lineno \
                --message $failure
        end
    end
    return $exitcode
end
