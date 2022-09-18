dependencies = [
    dependency('glib-2.0'),
    dependency('gio-2.0'),
    dependency('gobject-2.0'),
]

sources = files(
    'main.vala',
    'client.vala',
    'server.vala',
    'freedesktop-dbus.vala',
)

executable('overlay', sources, dependencies: dependencies, include_directories: config_h_dir)