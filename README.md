# Overlay service

This is a small dbus/systemd service that allows non-privalliged users to mount using overlayfs.

We may choose to control access to this via polkit (not implemented currently).

- The program should be built using meson and ninja
- Once built, `builddir/overlay-service` should be installed as `/usr/bin/overlay-service`
- `dbus.conf` shoud be installed as `/usr/share/dbus-1/system.d/org.github.MattSturgeon.OverlayService.conf`
- `dbus.service` should be installed as `/usr/share/dbus-1/system-services/org.github.MattSturgeon.OverlayService.service`
- `systemd.service` should be installed as `/usr/lib/systemd/system/overlay.service`

For testing purposes, `install.sh` and `uninstall.sh` can be run as root to create symlinks in the respective system directories, pointing to this repository. D-Bus must be restarted after initially installing to detect the installed service and configuration.