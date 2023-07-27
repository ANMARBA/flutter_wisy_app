# Wisy Flutter App #

App Test

## Starting ##

### Pre requirements ###
- Flutter 3.10.0
- Dart 3.0.0

### Pre requirements Flutter ###

Add to local.properties inside android/

- flutter.minSdkVersion=21
- flutter.targetSdkVersion=30
- flutter.compileSdkVersion=30

### Instalación ###

Follow the instructions in the following link: [Installation process](https://flutter.dev/docs/get-started/install)

### To get the latest dependencies ###

```shell
flutter pub get
```

## Rebuilds all generated files ##

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```