#!/bin/sh

echo "Installing server binary to /usr/bin/overlay-service"
mkdir -p /usr/bin
rm -rf /usr/bin/overlay-service
ln -s "$(realpath ./builddir/src/overlay-service)" /usr/bin/overlay-service

echo "Installing dbus permissions config to /usr/share/dbus-1/system.d/org.github.MattSturgeon.OverlayService.conf"
mkdir -p /usr/share/dbus-1/system.d/
rm -rf /usr/share/dbus-1/system.d/org.github.MattSturgeon.OverlayService.conf
ln -s "$(realpath ./data/dbus.conf)" /usr/share/dbus-1/system.d/org.github.MattSturgeon.OverlayService.conf

echo "Installing dbus service to /usr/share/dbus-1/system-services/org.github.MattSturgeon.OverlayService.service"
mkdir -p /usr/share/dbus-1/system-services
rm -rf /usr/share/dbus-1/system-services/org.github.MattSturgeon.OverlayService.service
ln -s "$(realpath ./data/dbus.service)" /usr/share/dbus-1/system-services/org.github.MattSturgeon.OverlayService.service

echo "Installing systemd service to /usr/lib/systemd/system/overlay.service"
mkdir -p /usr/lib/systemd/system
rm -rf /usr/lib/systemd/system/overlay.service
ln -s "$(realpath ./data/systemd.service)" /usr/lib/systemd/system/overlay.service