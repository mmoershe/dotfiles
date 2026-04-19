# Display Manager - Ly

## Use ly as Display Manager

```bash
systemctl enable --now ly@tty5.service
```

```bash
systemctl disable getty@tty5.service
```

```bash
systemctl disable gdm.service
```

## Customization

System-wide ly configuration files can be found in `/etc/ly/config.ini`.

### Changes to make:

- use custom animation
  - copy `blackhole-smooth-240x67.dur` from this directory into `/etc/ly/`
  - set `animation = dur_file`
  - set `dur_file_path = /etc/ly/blackhole-smooth-240x67.dur`
- (optional) show battery status
  - find out battery_id
    - `ls /sys/class/power_supply/`
  - set `battery_id` to battery_id
