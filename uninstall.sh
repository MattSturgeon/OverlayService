#!/bin/sh

rm_empty_dir() {
    DIR="$1"
    if [ -d "$DIR" ] && [ ! "$(ls -A "$DIR")" ]; then
        rmdir "$DIR"
    fi
}

echo "Removing server binary: /usr/bin/overlay"
rm -rf /usr/bin/overlay
rm_empty_dir "/usr/bin"

echo "Removing dbus permissions config: /usr/share/dbus-1/system.d/org.github.MattSturgeon.OverlayService.conf"
rm -rf /usr/share/dbus-1/system.d/org.github.MattSturgeon.OverlayService.conf
rm_empty_dir "/usr/share/dbus-1/system.d"

echo "Removing dbus service: /usr/share/dbus-1/system-services/org.github.MattSturgeon.OverlayService.service"
rm -rf /usr/share/dbus-1/system-services/org.github.MattSturgeon.OverlayService.service
rm_empty_dir "/usr/share/dbus-1/system-services"

echo "Removing systemd service: /usr/lib/systemd/system/overlay.service"
rm -rf /usr/lib/systemd/system/overlay.service
rm_empty_dir "/usr/lib/systemd/system"
