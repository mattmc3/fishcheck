# Checks

| check     | severity | description                                         | implemented |
| --------- | -------- | --------------------------------------------------- | ----------- |
| [FCE1000] | error    |  Fish syntax error. Unable to parse script.         | [X]         |
| [FCE1001] | error    | 'test' command expects '=', not '=='.               | [X]         |
| [FCE1002] | error    | Fish does not support double bracket test.          | [X]         |
| [FCE1003] | error    | Count used incorrectly in a conditional test.       | [X]         |
| [FCW2000] | warning  | Local variable in block shadows outer-scoped local. | [X]         |
| [FCS4000] | style    | Run fish_indent.                                    | [X]         |


[FCE1000]: https://github.com/mattmc3/fishcheck/wiki/FCE1000
[FCE1001]: https://github.com/mattmc3/fishcheck/wiki/FCE1001
[FCE1002]: https://github.com/mattmc3/fishcheck/wiki/FCE1002
[FCE1003]: https://github.com/mattmc3/fishcheck/wiki/FCE1003
[FCW2000]: https://github.com/mattmc3/fishcheck/wiki/FCW2000
[FCS4000]: https://github.com/mattmc3/fishcheck/wiki/FCS4000
