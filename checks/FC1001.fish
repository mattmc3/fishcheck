function FC1001 -d "Run fish_indent."
    set --local severity warning
    set --local exitcode 0
    set --local fishfile
    set --local contents
    set --local newcontents

    # Every FishCheck needs to report on itself
    argparse 's/severity' -- $argv
    or return 1
    if set -q _flag_severity
        echo $severity && return
    end

    for fishfile in $argv
        set contents (cat $fishfile)
        set newcontents (fish_indent $fishfile)
        if test "$contents" != "$newcontents"
            set exitcode 1
            _fishcheck_report \
                --file $fishfile \
                --check-id (status function) \
                --severity $severity \
                --message "fish_indent needs run to fix the format and style of this script." \
                --fix "fish_indent -w $fishfile"
        end
    end
    return $exitcode
end
