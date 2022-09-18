# Overlay service

**Note: this is currently in an unfinished state! You will not be able to do anything useful with this project yet, other than review the source code.**

This is a small dbus/systemd service that allows non-privalliged users to mount using overlayfs.

We may choose to control access to this via polkit (not implemented currently).

- The program should be built using meson and ninja
- Once built, `builddir/overlay-service` should be installed as `/usr/bin/overlay-service`
- `dbus.conf` shoud be installed as `/usr/share/dbus-1/system.d/org.github.MattSturgeon.OverlayService.conf`
- `dbus.service` should be installed as `/usr/share/dbus-1/system-services/org.github.MattSturgeon.OverlayService.service`
- `systemd.service` should be installed as `/usr/lib/systemd/system/overlay.service`

For testing purposes, `install.sh` and `uninstall.sh` can be run as root to create symlinks in the respective system directories, pointing to this repository. D-Bus must be restarted after initially installing to detect the installed service and configuration.

## Build system

This project uses the [Meson build system](https://mesonbuild.com/). You can _configure_ the project using `meson builddir` and _compile_ the project using `ninja -C builddir`:

```
meson --reconfigure builddir
ninja -C builddir
```
