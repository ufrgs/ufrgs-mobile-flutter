# UFRGS MOBILE - FLUTTER APP

### IMPORTANT
You need to create the settings file (eg. lib/settings.dart) and supply the following information:

```sh 
String BASE_URL = ""
String CLIENT_ID = ""
String CLIENT_SECRET = ""
String GRANT_TYPE = ""
String SCOPE = ""
```

### Build the project
The project uses mobx so in order to build it, first you need to generate the .g files.
For that use the following command:

```
flutter pub run build_runner build
or
flutter pub run build_runner build --delete-conflicting-outputs
```
