function FC1_1000 -d "Errors in Fish script. It fails the Fish parser."
    set --local exitcode 0
    for fishfile in $argv
        set --local failure (fish --no-execute $fishfile 2>&1)
        if test -n "$failure"
            set exitcode 1
            _fishcheck_report \
                --file $fishfile \
                --check FC_1000 \
                --severity error
        end
    end
    return $exitcode
end
