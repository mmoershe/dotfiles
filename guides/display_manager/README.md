# Display Manager

| Plasma Login Manager         | LY                           |
| ---------------------------- | ---------------------------- |
| - looks okay                 | + looks cool af              |
| - just works with everything | -problems with wider screens |
| + customizable               | + light-weight               |

## Plasma Login Manager

## Ly

### Setup

```bash
systemctl enable --now ly@tty5.service
```

```bash
systemctl disable getty@tty5.service
```

```bash
# Disable the other display managers, for example:
systemctl disable gdm.service
systemctl disable plasmalogin.service
```

### Customization

System-wide Ly configuration files can be found in `/etc/ly/config.ini`.

#### Changes to make:

- use custom animation
  - copy `blackhole-smooth-240x67.dur` from this directory into `/etc/ly/`
  - set `animation = dur_file`
  - set `dur_file_path = /etc/ly/blackhole-smooth-240x67.dur`
- use vim mode
  - set `vi_mode = true`
  - set `vi_default_mode = insert`
  - (obviously Ly won't accept _capslock_ as _escape_ to switch to normal mode, which is a little annoying)
- (optional) show battery status
  - find out battery_id
    - `ls /sys/class/power_supply/`
  - set `battery_id` to battery_id
