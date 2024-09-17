# Checks

| check    | severity | description                                                     | implemented        |
| -------- | -------- | --------------------------------------------------------------- | ------------------ |
| [FC1000] | error    | Fish syntax error. Unable to parse script.                      | :white_check_mark: |
| [FC1001] | warning  | Run fish_indent                                                 | :white_check_mark: |
| [FC1002] | error    | Use '#!/usr/bin/env fish' for Fish's shebang                    | :white_check_mark: |
| [FC1003] | error    | test command does not support '=='                              | :white_check_mark: |
| [FC1004] | error    | Found bash-ism ';then'                                          | :white_check_mark: |
| [FC1005] | error    | Found bash-ism 'elif'                                           | :white_check_mark: |

[FC1000]: https://github.com/mattmc3/fishcheck/wiki/FC1000
[FC1001]: https://github.com/mattmc3/fishcheck/wiki/FC1001
[FC1002]: https://github.com/mattmc3/fishcheck/wiki/FC1002
[FC1003]: https://github.com/mattmc3/fishcheck/wiki/FC1003
[FC1004]: https://github.com/mattmc3/fishcheck/wiki/FC1004
[FC1005]: https://github.com/mattmc3/fishcheck/wiki/FC1005
