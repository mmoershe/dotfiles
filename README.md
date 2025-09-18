# dotfiles

## TODO

- fastfetch?

## Fedora Quickstart

```bash
sudo dnf update -y && sudo dnf install git -y && git clone https://github.com/mmoershe/dotfiles ~/dotfiles && bash ~/dotfiles/MISC/fedora/install_fedora.sh
```

---

My dotfiles

The general idea of the keybindings is the following:

| Super-Key   | Scope                                   |
| ----------- | --------------------------------------- |
| Windows-Key | Sway Navigation                         |
| ALT-Key     | TMUX Navigation                         |
| CTRL-Key    | Navigation inside an application        |
| Shift-Key   | Navigate buffers inside a NeoVim window |

## Sway

Press `MOD + Shift + c` to reload the Sway-Config!

### Workspaces

In my Sway setup, every workspace has a _purpose_.

| Index | Name         | Purpose                           | Key      |
| ----- | ------------ | --------------------------------- | -------- |
| 1     | Terminal     | Main Terminal _(NeoVim, ...)_     | `Return` |
| 2     | Terminal-2   | Static / Secondary Terminal       | `n`      |
| 3     | Codium       | Secondary Code _(VSCodium)_       | `m`      |
| 4     | Browser      | Main Browser                      | `b`      |
| 5     | Browser-2    | Secondary / Private Browser       | `p`      |
| 6     | File-Browser | _(Dolphin, Thunar, ...)_          | `z`      |
| 7     | Variable     | Everything else                   | `u`      |
| 8     | E-Mail       | _(Thunderbird)_                   | `o`      |
| 9     | Chat         | _(WhatsApp, Discord, Slack, ...)_ | `i`      |

> (`MOD` + `{INDEX}`) and (`MOD` + `Shift` + `{INDEX}`) still exist as a backup!

### Windows

| Keybindings                         | Description          |
| ----------------------------------- | -------------------- |
| `MOD` + `{Vim Direction}`           | Move focus           |
| `MOD` + `Shift` + `{Vim Direction}` | Move focussed window |

### Applications

| Keybindings               | Description                |
| ------------------------- | -------------------------- |
| Windows-Key               | `Mod`                      |
| `Mod` + `CTRL` + `Return` | Open Kitty                 |
| `Mod` + `CTRL` + `Space`  | Open Wofi                  |
| `Mod` + `q`               | Kill focussed window       |
| `Mod` + `CTRL` + `f`      | Fullscreen focussed window |
| `Mod` + `Shift` + `c`     | Reload Sway config         |

### Overrides

There are machine-specific overrides for Sway, mostly for output stuff.
Set the `$machine` variable in `$HOME/.config/sway/config.d/vars` to the machine.
It will load the corresponding `$HOME/.config/sway/config.d/overrides/$machine` config file.

## Kitty

| Keybindings      | Description                 |
| ---------------- | --------------------------- |
| `CTRL` + `Shift` | `Mod`                       |
| `Mod` + `+`      | Slightly increase font-size |
| `Mod` + `-`      | Slightly decrease font-size |
| `Mod` + `F2`     | Open Kitty config           |
| `Mod` + `F5`     | Reload Kitty config         |

## TMUX

| Keybindings              | Description                 |
| ------------------------ | --------------------------- |
| `CTRL` + `s`             | `prefix`                    |
| `prefix` -> `CTRL` + `c` | Create new window           |
| `ALT` + `c`              | Kill current window         |
| `ALT` + `[1-0]`          | Select Window               |
| `ALT` + (`h` OR `l`)     | Select previous/next window |

## NeoVim

## Firefox

I use the `Vimium C - All by Keyboard` extension with the following _Custom Key Mappings_:

```txt
map J nextTab
map K previousTab
```
