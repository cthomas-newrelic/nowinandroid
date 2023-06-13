# Keep `Companion` object fields of serializable classes.
# This avoids serializer lookup through `getDeclaredClasses` as done for named companion objects.
-if @kotlinx.serialization.Serializable class **
-keepclassmembers class <1> {
    static <1>$Companion Companion;
}

# Keep `serializer()` on companion objects (both default and named) of serializable classes.
-if @kotlinx.serialization.Serializable class ** {
    static **$* *;
}
-keepclassmembers class <2>$<3> {
    kotlinx.serialization.KSerializer serializer(...);
}

# Keep `INSTANCE.serializer()` of serializable objects.
-if @kotlinx.serialization.Serializable class ** {
    public static ** INSTANCE;
}
-keepclassmembers class <1> {
    public static <1> INSTANCE;
    kotlinx.serialization.KSerializer serializer(...);
}

# @Serializable and @Polymorphic are used at runtime for polymorphic serialization.
-keepattributes RuntimeVisibleAnnotations,AnnotationDefault

-dontwarn org.bouncycastle.jsse.BCSSLParameters
-dontwarn org.bouncycastle.jsse.BCSSLSocket
-dontwarn org.bouncycastle.jsse.provider.BouncyCastleJsseProvider
-dontwarn org.conscrypt.Conscrypt$Version
-dontwarn org.conscrypt.Conscrypt
-dontwarn org.conscrypt.ConscryptHostnameVerifier
-dontwarn org.openjsse.javax.net.ssl.SSLParameters
-dontwarn org.openjsse.javax.net.ssl.SSLSocket
-dontwarn org.openjsse.net.ssl.OpenJSSE


##
## NewRelic Gradle plugin 7.x requires the following additions:
##
-keep class com.newrelic.agent.android.** { *; }
-dontwarn com.newrelic.agent.android.**
-keepattributes Exceptions, Signature, InnerClasses, LineNumberTable, SourceFile, EnclosingMethod

# For using GSON @Expose annotation
# -keepattributes *Annotation*

# Retain generic signatures of TypeToken and its subclasses with R8 version 3.0 and higher.
# -keep class com.google.gson.reflect.TypeToken
# -keep class * extends com.google.gson.reflect.TypeToken
# -keep public class * implements java.lang.reflect.Type

-keepattributes Signature
-keep class com.google.gson.reflect.TypeToken { *; }
-keep class *