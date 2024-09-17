function FCW2000 -d "Local variable redeclared, and possibly shadows prior scope."
    # set -l exitcode 0
    # set -l pat '\bset\s+-(?:l|-local)\s*(\w+)'
    # set -l seen_vars
    # for fishfile in $argv
    #     set -l lineno 0
    #     while read -l line
    #         set lineno (math $lineno + 1)
    #         set var_name (string match -rg -- $pat $line)
    #         if test $status -eq 0
    #             if contains $var_name $seen_vars
    #                 set exitcode 1
    #                 set -l position (string match -rn -- $pat $line | string split ' ')
    #                 test $status -eq 0 || set position 0 0
    #                 _fishcheck_report \
    #                     --file $fishfile \
    #                     --check FCW2000 \
    #                     --lineno $lineno \
    #                     --line $line \
    #                     -S $position[1] -L $position[2] \
    #                     --did-you-mean "set $var_name ..."
    #             else
    #                 set --append seen_vars $var_name
    #             end
    #         end
    #     end <$fishfile
    # end
    # return $exitcode
end
