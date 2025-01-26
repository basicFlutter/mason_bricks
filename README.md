# قالب Mason برای معماری Clean و BLoC در فلاتر

این قالب (brick) برای تولید خودکار فایل‌ها و پوشه‌های موردنیاز یک فیچر در پروژه‌های فلاتر طراحی شده است. با استفاده از این ابزار می‌توانید فیچرهای خود را با سرعت و ساختار مناسب ایجاد کنید و از معماری Clean و الگوی BLoC بهره ببرید.

---

## ویژگی‌ها
- ایجاد خودکار فایل‌ها و پوشه‌های مربوط به فیچر
- استفاده از معماری Clean
- شامل کلاس‌های BLoC، UseCase و Repository
- پوشه‌بندی منظم و قابل گسترش

---

## مراحل نصب و استفاده

### 1. اضافه کردن قالب به پروژه
فایل `mason.yaml` را به پروژه خود اضافه کنید و کد زیر را در آن قرار دهید:
```yaml
bricks:
  feature:
    git:
      url: https://github.com/basicFlutter/mason_bloc_and_clean_bricks.git
      path: bricks/feature
```
### 2 . نصب Mason CLI
ابزار Mason CLI را با دستور زیر نصب و فعال کنید:
```bash

dart pub global activate mason_cli

```
### 3. دانلود قالب‌ها
برای دانلود قالب‌ها دستور
```bash
mason get
```
### 4. تولید فیچر جدید
برای ایجاد فایل‌های موردنیاز یک فیچر جدید، از دستور زیر استفاده کنید:
```bash
mason make feature --name=نام_فیچر --useCase=نام_مورد_استفاده
```
### مثال
برای ایجاد فیچری به نام user_selector با مورد استفاده‌ای به نام get_users، دستور زیر را اجرا کنید:
```bash
mason make feature --name=user_selector --useCase=get_users
```
### 5. فایل pubspec.yaml
برای اضافه کردن تنظیمات فایل‌های ترجمه به فایل pubspec.yaml، می‌توانید از ساختار زیر استفاده کنید. این تنظیمات مشخص می‌کند که Flutter باید فایل‌های ترجمه را پردازش کند و کلاس‌های محلی‌سازی را تولید کند:
```yaml

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

flutter:
  generate: true

  assets:
    - lib/l10n/intl_en.arb
    - lib/l10n/intl_fa.arb
```
همچنین باید آخرین ورژن پکیج های مورد نیاز را نیز نصب کنید.

```yaml
name: test_mason
description: "A new Flutter project."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: ^3.6.1

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  flutter_bloc: ^9.0.0
  dio: ^5.3.3
  pretty_dio_logger: ^1.3.1
  firebase_messaging: ^15.1.1
  firebase_core: ^3.4.1
  firebase_crashlytics: ^4.1.1
  awesome_notifications: ^0.10.0
  logger: ^2.0.2+1
  encrypt_shared_preferences: ^0.8.0
  flutter_screenutil: ^5.9.0
  dartz: ^0.10.1
  page_transition: ^2.1.0
  equatable: ^2.0.5
  get_it: ^8.0.1
  intl: ^0.19.0
  gap: ^3.0.1
  persian_datetime_picker: ^3.1.0
  shamsi_date: ^1.0.4
  package_info_plus: ^8.0.2
  flutter_secure_storage: ^9.2.4


dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.14

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^5.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true
  generate: true
  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/to/resolution-aware-images

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/to/asset-from-package

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/to/font-from-package
  assets:
    - lib/l10n/intl_en.arb
    - lib/l10n/intl_fa.arb
```








