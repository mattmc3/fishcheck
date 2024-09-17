# Checks

| check     | severity | description                                                   | implemented        |
| --------- | -------- | ------------------------------------------------------------- | ------------------ |
| [FCE1000] | error    |  Fish syntax error. Unable to parse script.                   | :white_check_mark: |
| [FCE1001] | error    | 'test' command expects '=', not '=='.                         | :white_check_mark: |
| [FCE1002] | error    | Fish does not support double bracket test.                    | :x:                |
| [FCE1003] | error    | Count used incorrectly in a conditional test.                 | :x:                |
| [FCE1010] | error    | Found bash-ism ';then'                                        | :white_check_mark: |
| [FCW2000] | warning  | Local variable redeclared, and possibly shadows prior scope.  | :white_check_mark: |
| [FCW2001] | warning  | Unused local variable.                                        | :x:                |
| [FCW2002] | warning  | Fish uses argv[1] for arguments, not \$1                      | :x:                |
| [FCI3000] | info     | Don't use equals when assigning aliases.                      | :x:                |
| [FCS4000] | style    | Run fish_indent.                                              | :white_check_mark: |


## Checks that must be enabled

| check     | severity | description                                            | implemented        |
| --------- | -------- | ------------------------------------------------------ | ------------------ |
| [FCS5000] | style    | Found bash-ism. Use test, not square brackets.         | :x:                |


[FCE1000]: https://github.com/mattmc3/fishcheck/wiki/FCE1000
[FCE1001]: https://github.com/mattmc3/fishcheck/wiki/FCE1001
[FCE1002]: https://github.com/mattmc3/fishcheck/wiki/FCE1002
[FCE1003]: https://github.com/mattmc3/fishcheck/wiki/FCE1003
[FCW2000]: https://github.com/mattmc3/fishcheck/wiki/FCW2000
[FCS4000]: https://github.com/mattmc3/fishcheck/wiki/FCS4000
