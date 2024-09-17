function FC1002 -d "Use '#!/usr/bin/env fish' for Fish's shebang"
    set --local exitcode 0
    set --local fishfile
    set --local shebang

    # Every FishCheck needs to report on itself
    argparse s/severity -- $argv
    or return 1
    if set -q _flag_severity
        # could be warning, could be error - say error
        echo error && return
    end

    for fishfile in $argv
        set shebang (head -n 1 $fishfile)
        if string match -rq -- '^\!#' $shebang
            set exitcode 1
            _fishcheck_report \
                --file $fishfile \
                --check-id (status function) \
                --severity error \
                --line $shebang \
                --lineno 1 \
                --message "Use #!, not !#, for the shebang." \
                -S 1 -L 2
        else if string match -rq -- '^#\s*!\s*\/' $shebang
            if not string match -rq -- '^#!\s*/usr/bin/env fish' $shebang
                set exitcode 1
                _fishcheck_report \
                    --file $fishfile \
                    --check-id (status function) \
                    --severity warning \
                    --line $shebang \
                    -S 1 -L (string length $shebang)
            end
        end
    end
    return $exitcode
end
