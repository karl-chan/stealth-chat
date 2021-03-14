# To prevent startup from frozen
-keep class androidx.lifecycle.DefaultLifecycleObserver

# For encrypted moor
-keep class net.sqlcipher.** { *; }

# Workaround for mobile-ffmpeg
-keep class com.arthenica.mobileffmpeg.Config {
    native <methods>;
    void log(long, int, byte[]);
    void statistics(long, int, float, float, long , int, double, double);
}
-keep class com.arthenica.mobileffmpeg.AbiDetect {
    native <methods>;
}
