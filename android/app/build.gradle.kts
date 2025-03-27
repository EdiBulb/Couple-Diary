//// Harry is learning about Gradle.kts file. ////////

///This file configures how your Android app is built, packaged, and how it integrates with Flutter.

/// plugins block
plugins {
    /// Android application Gradle plugin, which tells Gradle you're building an android app
    id("com.android.application")
    /// You need this to use Kotlin featuers in android code.
    id("kotlin-android")
    // THis integrates Flutter's build process with Android gradle system.
    id("dev.flutter.flutter-gradle-plugin")
}

/// android block
android {
    // namespace is to define the package used at compile time for generated code(like resource R classes)
    namespace = "com.example.couple_diary"
    // Specifies the API level of the Android SDK you're compiling against
    compileSdk = 33

    // Defines the Java language versions for compilation.
    compileOptions {
        //The language level for your Java source code(Java 11 here)
        sourceCompatibility = JavaVersion.VERSION_11
        //The bytecode version Gradle will produce(Also Java 11)
        targetCompatibility = JavaVersion.VERSION_11
    }
    // Similar concept but for Kotiln.
    kotlinOptions {
        //jvmTarget = 11 ensures Kotlin code is compiled to Java 11 bytecode.
        jvmTarget = JavaVersion.VERSION_11.toString()
    }
    // defaultConfig{} defines the default or base configuration for you app.
    defaultConfig {
        //The unique package name that identifies your app on the device and in the playstore.
        applicationId = "com.example.couple_diary"
        // The minimum Android API level required to install and run your app.
        // minSdk=23 means devices with API<23 cannot install your app.
        minSdk = 23
        // The API level you've tested your app for.
        targetSdk = 33
        // An integer that the play store uses to differentiate versions. you must increment this for every release.
        versionCode = 1           // <-- Hardcoded integer
        // A human-readable string displayed to users.
        versionName = "1.0"       // <-- Hardcoded string
    }

    // Defines two main build types: debug and release. Each can have different settings.
    buildTypes {
        release {
            // If you want to shrink in release, do:
            isMinifyEnabled = true
            isShrinkResources = true
            // proguardFiles or rules for R8 go here
        }
        debug {
            // No shrinking in debug
            isMinifyEnabled = false
            isShrinkResources = false
        }
    }


}
// This block is specific to the Flutter Gradle Plugin.
flutter {
    source = "../.."
}
