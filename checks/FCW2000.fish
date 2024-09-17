function FCW2000 -d "Run fish_indent."
    set -l exitcode 0
    for fishfile in $argv
        set -l contents (cat $fishfile)
        set -l newcontents (fish_indent $fishfile)
        if test "$contents" != "$newcontents"
            set exitcode 1
            _fishcheck_report \
                --file $fishfile \
                --check (status function) \
                --message "fish_indent needs run to fix the format and style of this script." \
                --fix "fish_indent -w $fishfile"
        end
    end
    return $exitcode
end
