# Divvy

A Flutter Project that makes bills and receipts easy to split among friends and family!

## Key Development Notes

### Package Versions
Make sure to that the [online documentation](https://developer.android.com/studio/build/application-id.html) for used packages [packages]:(pubspec.yaml) match-up.

Also note, the following changes were made to the App-level [build-gradle](./android/app/build.gradle) so we can import 64k+ Methods
'''
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        ...
        minSdkVersion 16
        targetSdkVersion 27
        multiDexEnabled true
    }
    ...
    dependencies {
        // MULTIDEX ADDED TO SUPPORT 64k Methods+ Imported BECAUSE minSdkVersion 16 < 20
        compile 'com.android.support:multidex:1.0.3'
        ...
    }
'''

### Getting Started - Flutter Development

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
