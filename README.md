# قالب Mason برای معماری Clean و BLoC در Flutter

این قالب (brick) برای اوناییه که می‌خوان بدون دردسر و به صورت خودکار فایل‌ها و پوشه‌های مربوط به فیچرهای پروژه Flutter رو بسازن. با استفاده از این ابزار، می‌تونی با سرعت و نظم بیشتر کدنویسی کنی و ساختار پروژه‌ات همیشه استاندارد بمونه.

## چرا این قالب خیلی خفنه؟

### 🚀 ساخت خودکار همه چی برای یه پروژه
دیگه لازم نیست دستی بری پوشه درست کنی یا فایل بسازی. این قالب همه چی رو خودش برات مرتب و آماده می‌کنه. 😎

### ✨ معماری Clean
با این قالب، کدت تمیز، منظم و مقیاس‌پذیره. انگار داری برای آینده‌ات برنامه‌ریزی می‌کنی، چون ساختار پروژه‌ات همیشه قابل گسترشه.

### 🧩 همه چی آماده هست (BLoC، UseCase و Repository)
همه لایه‌ها از هم جدا شدن. یعنی خیلی راحت‌تر می‌تونی منطق، داده‌ها و رابط کاربری رو مدیریت کنی.

### 📂 پوشه‌بندی تمیز و منعطف
همه چی سر جای خودشه و اگه بخوای گسترش بدی، هیچ مشکلی نداری. ساختار پروژه همیشه مرتب و خواناست.

### 🌐 پشتیبانی از چندزبانه بودن (Localization)
اگه می‌خوای برنامه‌ات چندزبانه باشه، این قالب بهت اجازه می‌ده راحت ترجمه‌های مختلف رو اضافه کنی و از کاربرهای مختلف پشتیبانی کنی.

### 🎨 مدیریت تم و رنگ‌ها
این قالب از سیستم تم قدرتمند Flutter استفاده می‌کند و امکان تعریف تم‌های سفارشی را فراهم می‌کند.

### 🔔پشتیبانی از نوتیفیکیشن (Firebase Cloud Messaging)
برای ارسال و دریافت نوتیفیکیشن‌ها از Firebase می‌تونی با این قالب خیلی ساده کار کنی. حتی اگه تجربه زیادی نداری، اینجا کارها برات راحت‌تر شده. البته این قابلیت نیاز به تنظیمات بیشتری داره برای firebase.

### 🔒 ذخیره امن داده (FlutterSecureStorage)
برای ذخیره‌سازی امن داده‌ها (مثل توکن‌ها یا اطلاعات حساس کاربر) می‌تونی از FlutterSecureStorage استفاده کنی. امنیت اطلاعاتت تضمینه.

### 🍴 پشتیبانی از Flavor
اگه پروژه‌ات چندین محیط مختلف (مثل dev، staging، prod) داره، این قالب پشتیبانی از flavor رو هم فراهم می‌کنه تا مدیریت این محیط‌ها خیلی ساده‌تر بشه.

### 🚦ناوبری (Navigation) آسان (بدون نیاز به context)
خیلی ساده و بدون نیاز به context بین صفحات جابه جا شو.حتی log این که به چه صفحه ای هم رفتی رو داری.😊

### 📱 تنظیمات ابعاد صفحه با Flutter ScreenUtil
یکی از دلایل خفن بودن این قالب، پشتیبانی از پکیج قدرتمند flutter_screenutil است. این پکیج به شما کمک می‌کنه طراحی رابط کاربری‌ روی تمامی دستگاه‌ها و ابعاد صفحه‌ نمایش کاملاً ریسپانسیو و هماهنگ باشه.

### 🌐 ارتباط با سرور با Dio
مدیریت درخواست‌های HTTP با کتابخونه قدرتمند و حرفه‌ای Dio انجام می‌شه. سریع، راحت و قابل اطمینان.

### 🛠️ لاگ‌گیری زیبا و خوانا Pretty Dio Logger
با استفاده از Pretty Dio Logger، مدیریت لاگ‌های شبکه رو به صورت حرفه ای داری.

### 📅 پشتیبانی از تاریخ شمسی (Jalali Date Support)
این قالب یه سری اکستنشن برا تاریخ شمسی رو داره کار با تاریخ شمسی رو برات راحت میکنه.


---
# خیلی راحته اصلا نگران نباش.😊
---

## مراحل نصب و استفاده

### 1. اضافه کردن قالب به پروژه
فایل `mason.yaml` را در ریشه پروژه ایجاد کنید و کد زیر را در آن قرار دهید:
```yaml
bricks:
  feature:
    git:
      url: https://github.com/basicFlutter/mason_bricks.git
      path: bricks/feature
  base:
    git:
      url: https://github.com/basicFlutter/mason_bricks.git
      path: bricks/base
```
---
### 2 . نصب Mason CLI
ابزار Mason CLI را با دستور زیر نصب و فعال کنید:
```bash

dart pub global activate mason_cli

```
---
### 3. دانلود قالب‌ها
برای دانلود قالب‌ها دستور
```bash
mason get
```
---

### 4. ایجاد فایل های مورد نیاز (از این دستور فقط یک بار استفاده شود)
برای ایجاد فایل‌های موردنیاز کل پروژه، از دستور زیر استفاده کنید:

```bash
mason make base
```
---
### 5. تولید فیچر جدید
برای ایجاد فایل‌های موردنیاز یک فیچر جدید، از دستور زیر استفاده کنید:
```bash
mason make feature --name=نام_فیچر --useCase=نام_مورد_استفاده
```

### مثال
برای ایجاد فیچری به نام user با useCase به نام get_users، دستور زیر را اجرا کنید:
```bash
mason make feature --name=user --useCase=get_users
```
---

### 6. تزریق وابستگی (Dependency injection)
برای فیچر های جدیدی که ایجاد میکنید باید تزریق وابستگی های فیچر جدید رو داخل فایل service_locator.dart قرار بدید.
#### مثال تزریق وابستگی
```dart

serviceLocator() async {

  locator.registerLazySingleton<AppNavigator>(() => AppNavigator());
  locator.registerSingleton<Dio>(Dio());

 ///############################################## API Provider #############################

 locator.registerLazySingleton<UserApiProvider>(() => UserApiProvider());

  ///############################################## Repository #############################

  locator.registerLazySingleton<UserRepository>(()=>UserRepositoryImp(userApiProvider: locator()));

  ///############################################## UseCase #############################


   locator.registerLazySingleton<GetUserUseCase>(()=>GetUserUseCase( userRepository: locator()));


}
```
#### فراهم کردن یک bloc
کلاس bloc به عنوان ورودی useCase های مورد نیاز خودش رو دریافت میکنه که میتونیم از locator برای تزریق وابستگی به شکل زیر استفاده کنیم.
```dart
BlocProvider(
      create: (context) => UserBloc(getUsersUseCase: locator()),
    )
```
---

### 7. چند زبانه
برای تعریف متغیرهای چندزبانه در پروژه Flutter، باید فایل‌های موجود در پوشه lib/l10n را ویرایش کنید. در این پوشه، فایل‌های .arb برای هر زبان قرار دارند که ترجمه‌ها را ذخیره می‌کنند. به عنوان مثال، فایل intl_en.arb برای زبان انگلیسی و intl_fa.arb برای زبان فارسی استفاده می‌شود.
#### تنظیمات
برای اضافه کردن تنظیمات فایل‌های ترجمه به فایل pubspec.yaml، می‌توانید از ساختار زیر استفاده کنید. این تنظیمات مشخص می‌کند که Flutter باید فایل‌های ترجمه را پردازش کند و کلاس‌های محلی‌سازی را تولید کند:

```yaml

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.19.0

flutter:
  generate: true // خیلی مهم

  assets: 
    - lib/l10n/intl_en.arb
    - lib/l10n/intl_fa.arb
```


#### استفاده از ترجمه‌ها در کد:
بعد از تولید فایل‌های محلی‌سازی با اجرای دستور flutter pub get، می‌توانید به راحتی از متغیرهای تعریف‌شده برای نمایش ترجمه‌ها استفاده کنید. کافیست دستور زیر را در کد خود به‌کار ببرید:
```dart
AppLocalizations localizations = AppLocalizations.of(context)!;
```
### مثال
```dart
Text(localizations.hello);
```
---

### 8. مدیریت تم

#### ساختار فایل‌های تم
- `app_theme.dart`: تعریف تم‌های اصلی برنامه (روشن و تاریک)
- `color_themes.dart`: تعریف رنگ‌های سفارشی
- `text_themes.dart`: تعریف استایل‌های متنی

#### نحوه استفاده از رنگ‌ها
برای استفاده از رنگ‌های سفارشی در برنامه:

```dart
final color = Theme.of(context).extension<AppAdditionalColorsEx>()?.success50;
// یا با استفاده از extension
final color = context.appColors.success50;
```

#### اضافه کردن رنگ جدید
برای اضافه کردن رنگ جدید به تم:

1. در فایل `color_themes.dart` به کلاس `AppAdditionalColorsEx` یک فیلد جدید اضافه کنید:
```dart
class AppAdditionalColorsEx extends ThemeExtension<AppAdditionalColorsEx> {
  const AppAdditionalColorsEx({
    // ... رنگ‌های موجود ...
    required this.newColor,
  });

  final Color newColor;
  
  // اضافه کردن به متدهای copyWith و lerp
  @override
  AppAdditionalColorsEx copyWith({
    // ... رنگ‌های موجود ...
    Color? newColor,
  }) {
    return AppAdditionalColorsEx(
      // ... رنگ‌های موجود ...
      newColor: newColor ?? this.newColor,
    );
  }
}
```

2. رنگ جدید را در کلاس‌های `LightColorThemes` و `DarkColorThemes` تعریف کنید:
```dart
class LightColorThemes {
  static final appAdditionalColors = AppAdditionalColorsEx(
    // ... رنگ‌های موجود ...
    newColor: Color(0xFF000000),
  );
}
```

#### نحوه استفاده از استایل‌های متنی
برای استفاده از استایل‌های متنی سفارشی:

```dart
final textStyle = Theme.of(context).extension<AppTextTheme>()?.h1;
// یا با استفاده از extension
final textStyle = context.appTextTheme.h1;
```

#### اضافه کردن استایل متنی جدید
برای اضافه کردن استایل متنی جدید:

1. در فایل `text_themes.dart` به کلاس `AppTextTheme` یک فیلد جدید اضافه کنید:
```dart
class AppTextTheme extends ThemeExtension<AppTextTheme> {
  const AppTextTheme({
    // ... استایل‌های موجود ...
    required this.newStyle,
  });

  final TextStyle newStyle;
  
  // اضافه کردن به متدهای copyWith و lerp
  @override
  AppTextTheme copyWith({
    // ... استایل‌های موجود ...
    TextStyle? newStyle,
  }) {
    return AppTextTheme(
      // ... استایل‌های موجود ...
      newStyle: newStyle ?? this.newStyle,
    );
  }
}
```

2. استایل جدید را در کلاس‌های `LightTextThemes` و `DarkTextThemes` تعریف کنید:
```dart
class LightTextThemes {
  static final appTextTheme = AppTextTheme(
    // ... استایل‌های موجود ...
    newStyle: TextStyle(
      fontSize: 16.sp,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
  );
}
```

### 🌓 تغییر تم با BLoC
این قالب از BLoC برای مدیریت تغییر تم استفاده می‌کند.

1. برای تغییر تم در هر جای برنامه:
```dart
context.read<ThemeBloc>().add(ThemeChanged(isDarkMode: true));
context.read<ThemeBloc>().add(ThemeChanged(isDarkMode: false));
```

2. برای ذخیره‌سازی حالت تم در حافظه دستگاه:
```dart
// in ThemeBloc
on<ThemeChanged>((event, emit) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isDarkMode', event.isDarkMode);
  emit(ThemeState(isDarkMode: event.isDarkMode));
});
```
---

## 9. تنظیم Flavor برای اندروید

برای تنظیم Flavor، این کدها رو به فایل `build.gradle` در پوشه `app` اضافه کنید:

```gradle
android {
    flavorDimensions "default"

    productFlavors {
        dev {
            dimension  "default"
            applicationIdSuffix ".dev"
        }

        prod {
            dimension  "default"
            applicationIdSuffix ""
        }

        local {
            dimension  "default"
            applicationIdSuffix ".local"
        }
    }
}
```

#### اجرای پروژه برای هر Flavor

برای اجرای پروژه در محیط‌های مختلف، از این دستورات استفاده کنید:

#### محیط توسعه (dev):

  ```bash
  flutter run --flavor dev --target lib/main_dev.dart
  ```

#### محیط تولید (prod):

  ```bash
  flutter run --flavor prod --target lib/main_prod.dart
  ```

#### محیط محلی (local):

  ```bash
  flutter run --flavor local --target lib/main_local.dart
  ```
#### تنظیم base url برای محیط ها مختلف
باید فایل app_config رو با توجه به نیاز خودتون تغییر بدید.
```bash
  class AppConfig{
  static Flavor appFlavor = Flavor.production;
  static String get baseUrl {
    switch(appFlavor){
      case Flavor.development:
        return 'http://192.168.1.7:8080';
      case Flavor.production:
      return 'http://192.168.1.3:8080';
      case Flavor.local:
        return 'http://172.17.240.1:8080';
    }
  }
}
```

برای تنظیمات و توضیحات بیشتر میتونید به مستندات فلاتر مراجعه کنید.[flavors](https://docs.flutter.dev/deployment/flavors)

---
### 10. ناوبری (Navigation) آسان (بدون نیاز به context)
در این قالب، می‌توانید به سادگی و بدون نیاز به context بین صفحات ناوبری کنید.برای استفاده از ناوبری، به شکل زیر عمل کنید:

```dart
final navigation = locator<AppNavigator>();

// برای رفتن به یک صفحه جدید
navigation.to(UserPage());

// برای جایگزین کردن صفحه فعلی با یک صفحه جدید
navigation.off(UserPage());
```

این روش باعث می‌شود که نیازی به context برای ناوبری نداشته باشید و کد شما تمیزتر و مدیریت‌پذیرتر باشد.

---

### 11. تنظیمات ابعاد صفحه با Flutter ScreenUtil
این قالب از پکیج [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) برای مدیریت ابعاد صفحه استفاده می‌کند. برای تنظیم این ویژگی، در فایل `my_app.dart` مقدار `designSize` را مطابق نیاز پروژه خود تغییر دهید:

```dart
ScreenUtilInit(
          designSize: const Size(390,844), // این مقدار را بر اساس طراحی پروژه خود تنظیم کنید.
          minTextAdapt: true,
          splitScreenMode: false,
          useInheritedMediaQuery: true,
)
```
#### نحوه استفاده از Flutter ScreenUtil
```dart
//If you want to display a rectangle:
Container(
  width: 375.w,
  height: 375.h,
),
            
//If you want to display a square based on width:
Container(
  width: 300.w,
  height: 300.w,
),

//If you want to display a square based on height:
Container(
  width: 300.h,
  height: 300.h,
),

//If you want to display a square based on minimum(height, width):
Container(
  width: 300.r,
  height: 300.r,
),

Text(
      '16sp,if data is not set in MediaQuery,my font size will change with the system.',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
      ),
 ),
```
---
### 12. تنظیمات فایربیس (Firebase)
این قالب از Firebase برای مدیریت نوتیفیکیشن‌ها پشتیبانی می‌کند. کلاس‌های موردنیاز برای راه‌اندازی Firebase و نمایش نوتیفیکیشن‌ها در قالب فراهم شده‌اند. برای استفاده از این قابلیت، مراحل زیر را انجام دهید:

### ایجاد پروژه در کنسول Firebase
ابتدا به [Firebase Console](https://console.firebase.google.com/) بروید و یک پروژه جدید ایجاد کنید.

### دریافت فایل‌های پیکربندی
- **اندروید**: فایل `google-services.json` را دانلود کرده و در مسیر زیر قرار دهید:
  ```
  android/app/google-services.json
  ```
- **iOS**: فایل `GoogleService-Info.plist` را دانلود کرده و در مسیر زیر قرار دهید:
  ```
  ios/Runner/GoogleService-Info.plist
  ```

### تنظیمات Gradle برای اندروید
تنظیمات زیر را به فایل‌های `build.gradle` اضافه کنید:
در `android/build.gradle`:

  ```gradle
  dependencies {
      classpath 'com.google.gms:google-services:4.3.15' // نسخه متناسب با پروژه
  }
  ```

در `android/app/build.gradle`:

  ```gradle
  apply plugin: 'com.google.gms.google-services'
  ```

### تنظیمات iOS
در فایل `ios/Runner/Info.plist` تنظیمات مربوط به Firebase را طبق [مستندات Firebase](https://firebase.google.com/docs/flutter/setup) اضافه کنید.

### فعال‌سازی کد Firebase در پروژه
کدهای زیر در فایل `global_app_setup` قرار دارند. این کدها را از حالت کامنت خارج کنید تا Firebase تنظیم و توکن آن مدیریت شود:

```dart
// for firebase
final firebaseConfig = FirebaseConfig();

// گرفتن توکن Firebase
final token = await firebaseConfig.fetchToken();
logger.i('Firebase Token: $token');

// حذف توکن
final result = await firebaseConfig.deleteFirebaseToken();
logger.i('Token Deleted: $result');
```

## نکات مهم
- قبل از خارج کردن کدها از حالت کامنت، مطمئن شوید که تنظیمات پروژه Firebase را به طور کامل انجام داده‌اید.
- از نسخه‌های به‌روز کتابخانه‌های Firebase استفاده کنید تا از بروز مشکلات جلوگیری شود.

با این مراحل، پروژه شما آماده استفاده از Firebase برای نوتیفیکیشن‌ها و سایر قابلیت‌ها خواهد بود.

---
### 13. فایل کامل pubspec.yaml
همچنین باید آخرین ورژن پکیج های مورد نیاز را نیز نصب کنید.

```yaml
name: test_mason
description: "A new Flutter project."

publish_to: 'none' # Remove this line if you wish to publish to pub.dev
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
  intl: ^0.19.0
  cupertino_icons: ^1.0.8
  flutter_bloc: ^9.0.0
  dio: ^5.3.3
  pretty_dio_logger: ^1.3.1
  firebase_messaging: ^15.1.1
  firebase_core: ^3.4.1
  awesome_notifications: ^0.10.0
  logger: ^2.0.2+1
  flutter_screenutil: ^5.9.0
  dartz: ^0.10.1
  page_transition: ^2.1.0
  equatable: ^2.0.5
  get_it: ^8.0.1
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
---
### 13. آپدیت پکیج ها
برا نصب آخرین ورژن پکیج ها بعد از اضافه کردن به فایل yaml با دستور زیر به اخرین ورژن ها ارتقا داده میشوند.
```yaml
flutter pub upgrade --major-versions
```
---
# توجه مهم
چند پکیج در این قالب نیاز به تنظیمات جداگانه برای ios  و android دارند که باید طبق مستندات این پکیج ها این تنظیمات رو انجام بدید.
```dart
  firebase_messaging: ^15.1.1
firebase_core: ^3.4.1
awesome_notifications: ^0.10.0
```





