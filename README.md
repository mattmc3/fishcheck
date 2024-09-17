# fishcheck

> A pure Fish linter for your Fish scripts

## NOTE:

This project is in active development. Thanks for your interest! It will be changing and evolving significantly over the next few weeks. Feel free to use it and submit feature requests, but know that as an early adopter things may change drastically on you.

For now:
- This is ALPHA software. I'll promote it more when it stabilizes, but for now it's for advanced users to give early feedback only.
- The check IDs or descriptions may change!
- The installation procedure is subject to change
- Performance has not been addressed, so checking a large number of files may be slow
- There's no config file or special comments yet for skipping checks, but one is planned
- There's no desire to make this project into a full-blown LSP, or reimplement an AST parser. We rely on Fish to tokenize itself where possible and look for patterns in that.
- There may be false positives detected, and edge cases.
- In other words, use with caution.

## Fish users can have nice things too

One of the amazing things about Fish is that it has sensible scripting. Fish doesn't have all the warts of Bash. If you are a Bash scripter, [ShellCheck][shellcheck] is an essential tool.

In Bash, as an example, you have to quote every single thing to prevent word splitting. You don't need to worry about those obscure rules in Fish scripts, but there are still gotchas, common mistakes, and stylistic considerations that a Fish linter can help with. FishCheck brings that to Fish users for the first time!

## Installation

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
