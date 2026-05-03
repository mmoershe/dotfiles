# Bluetooth

All required packages should already be installed.

Start and enable `bluetooth.service`

```bash
systemctl enable --now bluetooth.service
```

## Settings

Enable or disable bluetooth on startup in `/etc/bluetooth/main.conf`:

```bash
AutoEnable=false # or true
```

## Links

- [Bluetooth - Arch Wiki](https://wiki.archlinux.org/title/Bluetooth)
