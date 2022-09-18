project('overlay service', 'vala', 'c', version: '0.0.1')

config = configuration_data()
config.set_quoted('VERSION', meson.project_version())
config.set_quoted('HOST_OS', host_machine.system())
configure_file(configuration: config, output: 'config.h')
config_h_dir = include_directories('.')

add_project_arguments([
        '--vapidir', join_paths(meson.source_root(), 'vapi'),
    ],
    language: 'vala')

subdir('src')