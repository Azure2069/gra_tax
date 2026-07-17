# Setup commands

Run these commands from the root of your Flutter project:

```bash
flutter clean
rm -rf .dart_tool pubspec.lock
flutter pub get
dart format lib
flutter analyze
flutter run
```

If this ZIP contains only `lib`, `pubspec.yaml`, and support files, copy them into an existing Flutter project. Alternatively create a fresh project first:

```bash
flutter create bizinvoice_ghana
cd bizinvoice_ghana
```

Then replace the generated `lib` folder and `pubspec.yaml` with the supplied ones, and run the setup commands above.

The dependency versions are deliberately pinned. Do not run `flutter pub upgrade --major-versions` before the project builds, because Riverpod 3 uses migration changes and this code uses the Riverpod 2 `StateNotifierProvider` API.
