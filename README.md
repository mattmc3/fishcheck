# fishcheck

> A pure Fish linter for your Fish scripts

## NOTE:

This project is in active development. Thanks for your interest! It will be changing and evolving significantly over the next few weeks. Feel free to use it and submit feature requests, but know that as an early adopter things may change drastically on you.

## Fish users can have nice things too

One of the amazing things about Fish is that it has sensible scripting. Fish doesn't have all the warts of Bash. If you are a Bash scripter, [ShellCheck][shellcheck] is an essential tool.

While it's refreshing not to have to quote every single thing to prevent word splitting like in Bash, there are still some helpful things to check for in your Fish scripts. Now, you can with FishCheck.

## Installation

FishCheck is currently alpha software, so this installation procedure is subject to change.

### Manual install

```fish
# Clone this project
git clone https://github.com/mattmc3/fishcheck ~/.local/bin/fishcheck

# Add this to your config.fish
fish_add_path -g --prepend ~/.local/bin/fishcheck
```

## Checks

To see this list of checks FishCheck performs, [click here](checks.md)

[shellcheck]: https://www.shellcheck.net/
