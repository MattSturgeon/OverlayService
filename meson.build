project('overlay service', 'vala', 'c')

dependencies = [
    dependency('glib-2.0'),
    dependency('gio-2.0'),
    dependency('gobject-2.0'),
]

executable('overlay-service', files('overlay-server.vala'), dependencies: dependencies)

# Build a test/example client too TODO use meson tests
executable('client', files('client.vala'), dependencies: dependencies)