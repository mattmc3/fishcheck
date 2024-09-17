# Notes

FishCheck tests:

```fish
./fishcheck (string match --invert --entire /tests/ ./**/*.fish)
```

Get Fish shell code:

```fish
git clone https://github.com/fish-shell/fish-shell ~/.repos/fish-shell/fish-shell
```

FishCheck Fish shell code:

```fish
./fishcheck (string match --invert --entire /tests/ ~/.repos/fish-shell/**/*.fish)
```

Fix Fish shell formatting:

```fish
fish_indent -w (string match --invert --entire /tests/ ~/.repos/fish-shell/**/*.fish)
```
