public class Main : Object {
    private static bool version = false;
    private static bool server = false;
    private static string? mount_dir = null;
    private static string? work_dir = null;
    private static string? upper_dir = null;
    [CCode (array_length = false, array_null_terminated = true)]
    private static string[]? lower_dirs = null;

    [CCode (array_length = false, array_null_terminated = true)]
    private const GLib.OptionEntry[] options = {
        { "version", '\0', OptionFlags.NONE, OptionArg.NONE, ref version, "Display version number", null },
        { "server", '\0', OptionFlags.HIDDEN, OptionArg.NONE, ref server, "Run as a dbus server", null },
        { "mount-dir", 'm', OptionFlags.NONE, OptionArg.FILENAME, ref mount_dir, "Mount point", "DIRECTORY" },
        { "work-dir", 'w', OptionFlags.NONE, OptionArg.FILENAME, ref work_dir, "Work directory", "DIRECTORY" },
        { "upper-dir", 'u', OptionFlags.NONE, OptionArg.FILENAME, ref upper_dir, "Upper directory", "DIRECTORY" },
        { "lower-dirs", 'l', OptionFlags.NONE, OptionArg.FILENAME_ARRAY, ref lower_dirs, "List of lower overlay directories, low to high", "DIRECTORY..." },
        { null }
    };

    public static int main (string[] args) {
        try {
            var opt_context = new OptionContext ("");
            opt_context.set_help_enabled (true);
            opt_context.add_main_entries (options, null);
            opt_context.parse (ref args);
        } catch (OptionError e) {
            printerr ("error: %s\n", e.message);
            printerr ("Run '%s --help' to see a full list of available command line options.\n", args[0]);
            return 1;
        }

        if (version) {
            // TODO meson config.h
            print ("Version %s\n", Config.VERSION);
            global::Config.VERSION;
            return 0;
        }

        if (server) {
            // run dbus server
            print ("Running dbus server\n");
            return Server.run_server ();
        }

        // Debugging:
        print ("Paths:\n");
        print (@" mount_dir: '$mount_dir'\n");
        print (@" work_dir: '$work_dir'\n");
        print (@" upper_dir: '$upper_dir'\n");
        print (" lower_dirs: ");
        foreach (string dir in lower_dirs) {
            print (@"'$dir' ");
        }
        print ("\n\n");

        // run dbus client
        return Client.run_client ();
    }
}