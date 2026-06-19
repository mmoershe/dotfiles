# MongoDB Compass Credentials Storage Fix

On Hyprland, MongoDB Compass doesn't save database credentials and throws this error instead:

> Compass cannot access credential storage. You can still connect, but please note that passwords will not be saved.

This has something to do with the GNOME keyring daemon. This can be fixed by editing the `/usr/share/applications/mongodb-compass.desktop` file as root. Add the following flag in the `Exec=` line:

```bash
--password-store="gnome-libsecret"
```
