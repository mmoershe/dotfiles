# dotfiles

My dotfiles

## Keybindings

The general idea of the keybindings is the following:

| Super-Key   | Scope                                   |
| ----------- | --------------------------------------- |
| Windows-Key | Sway Navigation                         |
| ALT-Key     | TMUX Navigation                         |
| CTRL-Key    | Navigation inside the application       |
| Shift-Key   | Navigate buffers inside a NeoVim window |

### Sway

#### Workspaces

In my Sway setup, every workspace has a _purpose_.

| Index | Workspace    | Keybinding       | Move to workspace          |
| ----- | ------------ | ---------------- | -------------------------- |
| 1     | Terminal     | `MOD` + `Return` | `MOD` + `Shift` + `Return` |
| 2     | Browser      | `MOD` + `b`      | `MOD` + `Shift` `b`        |
| 5     | File-Browser | `MOD` + `z`      | `MOD` + `Shift` + `z`      |
| 9     | Chat         | `MOD` + `i`      | `MOD` + `Shift` + `i`      |

> (`MOD` + `{INDEX}`) and (`MOD` + `Shift` + `{INDEX}`) still exist as a backup!

#### Windows

| Keybindings                         | Description          |
| ----------------------------------- | -------------------- |
| `MOD` + `{Vim Direction}`           | Move focus           |
| `MOD` + `Shift` + `{Vim Direction}` | Move focussed window |

#### Applications

| Keybindings               | Description                |
| ------------------------- | -------------------------- |
| Windows-Key               | `Mod`                      |
| `Mod` + `CTRL` + `Return` | Open Kitty                 |
| `Mod` + `CTRL` + `Space`  | Open Wofi                  |
| `Mod` + `q`               | Kill focussed window       |
| `Mod` + `CTRL` + `f`      | Fullscreen focussed window |
| `Mod` + `Shift` + `c`     | Reload Sway config         |

### Kitty

| Keybindings      | Description                 |
| ---------------- | --------------------------- |
| `CTRL` + `Shift` | `Mod`                       |
| `Mod` + `+`      | Slightly increase font-size |
| `Mod` + `-`      | Slightly decrease font-size |
| `Mod` + `F2`     | Open Kitty config           |
| `Mod` + `F5`     | Reload Kitty config         |

### TMUX

| Keybindings              | Description                 |
| ------------------------ | --------------------------- |
| `CTRL` + `s`             | `prefix`                    |
| `prefix` -> `CTRL` + `c` | Create new window           |
| `ALT` + `c`              | Kill current window         |
| `ALT` + `[1-0]`          | Select Window               |
| `ALT` + (`h` OR `l`)     | Select previous/next window |

### NeoVim
