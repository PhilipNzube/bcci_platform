# Suppress warnings about errorprone annotations that aren't needed at runtime
-dontwarn com.google.errorprone.annotations.**
-keep class com.google.errorprone.annotations.** { *; }

# Optional: Also useful for some Firebase or Tink dependencies
-dontwarn org.threeten.bp.**
-keep class org.threeten.bp.** { *; }
