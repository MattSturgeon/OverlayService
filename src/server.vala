
namespace Server {

    [DBus (name = "org.github.MattSturgeon.OverlayService")]
    public class OverlayService : Object {
    
        private Freedesktop.DBus dbus;
    
        public OverlayService() throws IOError {
        this.dbus = Bus.get_proxy_sync(BusType.SYSTEM, "org.freedesktop.DBus", "/org/freedesktop/DBus");
        }
    
        [DBus (name = "Mount")]
        public void mount(string mount_point, string work_dir, string upper_dir, string[] lower_dirs, BusName sender) throws Error {
            uint uid;
            try {
                uid = this.dbus.get_connection_unix_user(sender);
            } catch (Error error) {
                uid = -1;
            }
            stdout.printf ("Called mount \"%s\" from %u\n", mount_point, uid);
        }
    
    
        [DBus (name = "UMount")]
        public void umount(string mount_point, BusName sender) throws Error {
            uint uid;
            try {
                uid = this.dbus.get_connection_unix_user(sender);
            } catch (Error error) {
                uid = -1;
            }
            stdout.printf ("Called umount \"%s\" from %u\n", mount_point, uid);
        }
    
        [DBus (name = "GetMounts")]
        public string[] get_mounts(BusName sender) throws Error {
            string[] ret = new string[3];
            stdout.printf ("Called get_mounts\n");
    
            string uid;
            try {
                uid = this.dbus.get_connection_unix_user(sender).to_string();
            } catch (Error error) {
                uid = "world";
            }
    
            ret[0] = "hello";
            ret[1] = uid;
            ret[2] = sender;
    
            return ret;
        }
    }
    
    [DBus (name = "org.github.MattSturgeon.OverlayService.OverlayServiceError")]
    public errordomain OverlayServiceError
    {
        SOME_ERROR
    }
    
    void on_bus_aquired (DBusConnection connection) {
        try {
            connection.register_object ("/org/github/MattSturgeon/OverlayService", new OverlayService ());
        } catch (IOError e) {
            stderr.printf ("Could not register service\n");
        }
    }
    
    int run_server () {
        int exit_code = 0;
        Bus.own_name (BusType.SYSTEM, "org.github.MattSturgeon.OverlayService", BusNameOwnerFlags.NONE,
                      on_bus_aquired,
                      () => {},
                      () => {
                        stderr.printf ("Could not aquire name\n");
                        exit_code = 1;
                    });
    
        new MainLoop ().run ();
        return exit_code;
    }
}