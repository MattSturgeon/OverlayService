dependencies = [
    dependency('glib-2.0'),
    dependency('gio-2.0'),
    dependency('gobject-2.0'),
]

sources = files(
    'overlay-server.vala',
    'freedesktop-dbus.vala',
)

executable('overlay-service', sources, dependencies: dependencies)

# Build a test/example client too TODO use meson tests
executable('client', files('client.vala'), dependencies: dependencies)