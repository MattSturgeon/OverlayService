[DBus (name = "org.github.MattSturgeon.OverlayService")]
interface OverlayService : Object {
    public abstract int ping (string msg) throws IOError;
    public abstract int ping_with_sender (string msg) throws IOError;
    public abstract int ping_with_signal (string msg) throws IOError;
    public signal void pong (int count, string msg);
}

void main () {
    /* Needed only if your client is listening to signals; you can omit it otherwise */
    var loop = new MainLoop();

    /* Important: keep demo variable out of try/catch scope not lose signals! */
    OverlayService overlay = null;

    try {
        overlay = Bus.get_proxy_sync (BusType.SYSTEM, "org.github.MattSturgeon.OverlayService",
                                                    "/org/github/MattSturgeon/OverlayService");

        /* Connecting to signal pong! */
        overlay.pong.connect((c, m) => {
            stdout.printf ("Got pong %d for msg '%s'\n", c, m);
            loop.quit ();
        });

        int reply = overlay.ping ("Hello from Vala");
        stdout.printf ("%d\n", reply);

        reply = overlay.ping_with_sender ("Hello from Vala with sender");
        stdout.printf ("%d\n", reply);

        reply = overlay.ping_with_signal ("Hello from Vala with signal");
        stdout.printf ("%d\n", reply);

    } catch (IOError e) {
        stderr.printf ("%s\n", e.message);
    }
    loop.run();
}