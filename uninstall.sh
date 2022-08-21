#!/bin/sh

rm_empty_dir() {
    DIR="$1"
    if [ -d "$DIR" ] && [ ! "$(ls -A "$DIR")" ]; then
        rmdir "$DIR"
    fi
}

echo "Installing server binary to /usr/bin/overlay-service"
rm -rf /usr/bin/overlay-service
rm_empty_dir "/usr/bin"

echo "Installing dbus permissions config to /usr/share/dbus-1/system.d/org.github.MattSturgeon.OverlayService.conf"
rm -rf /usr/share/dbus-1/system.d/org.github.MattSturgeon.OverlayService.conf
rm_empty_dir "/usr/share/dbus-1/system.d"

echo "Installing dbus service to /usr/share/dbus-1/system-services/org.github.MattSturgeon.OverlayService.service"
rm -rf /usr/share/dbus-1/system-services/org.github.MattSturgeon.OverlayService.service
rm_empty_dir "/usr/share/dbus-1/system-services"

echo "Installing systemd service to /usr/lib/systemd/system/overlay.service"
rm -rf /usr/lib/systemd/system/overlay.service
rm_empty_dir "/usr/lib/systemd/system"
