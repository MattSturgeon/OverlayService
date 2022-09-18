[CCode (cheader_filename = "config.h")]
public class Config {
    [CCode (cname = "VERSION")]
    public const string VERSION;

    [CCode (cname = "HOST_OS")]
    public const string HOST_OS;
}