function FCE1000 -d "Errors in script. Script fails the Fish parser."
    set --local exitcode 0
    for fishfile in $argv
        set --local failure (fish --no-execute $fishfile 2>&1)
        if test -n "$failure"
            set exitcode 1
            _fishcheck_report \
                --file $fishfile \
                --check FCE1000 \
                --severity error
        end
    end
    return $exitcode
end
