# BizInvoice Ghana setup

1. Copy the `lib` folder and `pubspec.yaml` into a new Flutter project.
2. Ensure the Android package/application ID is `com.priscilla.bizinvoiceghana`.
3. Run:

```bash
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

The build_runner command generates `lib/core/database/app_database.g.dart`.

For Android WhatsApp launching, add this inside `<manifest>` in
`android/app/src/main/AndroidManifest.xml`:

```xml
<queries>
    <package android:name="com.whatsapp" />
    <intent>
        <action android:name="android.intent.action.VIEW" />
        <data android:scheme="https" />
    </intent>
</queries>
```

Recommended Android application ID:

```text
com.priscilla.bizinvoiceghana
```

This is a school project. It produces GRA-style invoices and configurable
VAT summaries but does not submit invoices to GRA or claim official E-VAT
certification.
