/* Note: this attribute specifies the _interface_ name.  It
 * is called 'name =' for historical reasons.
 */
 [DBus (name = "org.github.MattSturgeon.OverlayService")]
 public class OverlayService : Object {
 
     private int counter;
 
     public int ping (string msg) {
         stdout.printf ("%s\n", msg);
         return counter++;
     }
 
     public int ping_with_signal (string msg) {
         stdout.printf ("%s\n", msg);
         pong(counter, msg);
         return counter++;
     }
 
     /* Including any parameter of type GLib.BusName won't be added to the
        interface and will return the dbus sender name (who is calling the method) */
     public int ping_with_sender (string msg, GLib.BusName sender) {
         stdout.printf ("%s, from: %s\n", msg, sender);
         return counter++;
     }
 
     public void ping_error () throws Error {
         throw new OverlayServiceError.SOME_ERROR ("There was an error!");
     }
 
     public signal void pong (int count, string msg);
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
 
 void main () {
     Bus.own_name (BusType.SYSTEM, "org.github.MattSturgeon.OverlayService", BusNameOwnerFlags.NONE,
                   on_bus_aquired,
                   () => {},
                   () => stderr.printf ("Could not aquire name\n"));
 
     new MainLoop ().run ();
 }