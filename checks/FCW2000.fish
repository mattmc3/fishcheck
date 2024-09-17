function FCW2000 -d "Local variable redeclared, and possibly shadows prior scope."
    set -l exitcode 0
    set -l pat '\bset\s+-(?:l|-local)\s*(\w+)'
    set -l seen_vars
    for fishfile in $argv
        set -l lineno 0
        while read -l line
            set lineno (math $lineno + 1)
            set var_name (string match -rg -- $pat $line)
            if test $status -eq 0
                if contains $var_name $seen_vars
                    set exitcode 1
                    set -l position (string match -rn -- $pat $line | string split ' ')
                    test $status -eq 0 || set position 0 0
                    _fishcheck_report \
                        --file $fishfile \
                        --check FCW2000 \
                        --lineno $lineno \
                        --line $line \
                        -S $position[1] -L $position[2] \
                        --did-you-mean "set $var_name ..."
                else
                    set --append seen_vars $var_name
                end
            end
        end <$fishfile
    end
    return $exitcode
end




# You said:
# Write a fish function to check a fish script file for shadowed variables.
# ChatGPT said:
# ChatGPT
# To check a Fish script file for shadowed variables, we need to identify variables that are redeclared in a scope, which hides (or "shadows") the previously declared variable in a parent scope. In the Fish shell, scoping rules for variables are a bit different from other shells due to its use of dynamic scoping, but we can still try to track down variable shadowing issues in a simple way.

# Here’s a Fish function that parses a Fish script, identifies variable declarations, and checks if any variables are redefined in the same or a nested scope (which could indicate shadowing):

# fish
# Copy code
# function check_shadowed_variables
#     # Get the file to check as the first argument
#     set file_path $argv[1]

#     # Ensure the file exists
#     if not test -f $file_path
#         echo "File not found: $file_path"
#         return 1
#     end

#     # Keep track of declared variables
#     set -l declared_vars

#     # Read the file line by line
#     for line in (cat $file_path)
#         # Use regex to find variable declarations (set or set -l/-g/-x)
#         if string match -r '^set\s+(-[lgx]?\s*)?(\w+)' $line
#             set -l match (string match -r '^set\s+(-[lgx]?\s*)?(\w+)' $line)
#             set var_name $match[2]

#             # Check if the variable has already been declared
#             if contains $var_name $declared_vars
#                 echo "Warning: Variable '$var_name' is shadowed!"
#             else
#                 # Add the variable to the declared list
#                 set declared_vars $declared_vars $var_name
#             end
#         end
#     end
# end
