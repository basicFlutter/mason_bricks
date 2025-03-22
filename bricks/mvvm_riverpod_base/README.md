# MVVM Riverpod Base Template

این یک قالب پایه برای پروژه‌های Flutter با معماری MVVM و استفاده از Riverpod است. این قالب شامل ساختار پایه‌ای برای مدیریت خطا، شبکه، تنظیمات و ابزارهای مفید است.

## ویژگی‌ها

- مدیریت خطای پیشرفته با استفاده از Exceptions و Failures
- مدیریت شبکه با استفاده از Dio
- مدیریت وضعیت اتصال به اینترنت
- تنظیمات قابل پیکربندی
- Provider های آماده برای استفاده
- Extension های مفید برای Context و String
- پشتیبانی از RTL
- لاگینگ پیشرفته
- مدیریت احراز هویت
- ثابت‌های برنامه

## پیش‌نیازها

- Flutter SDK (نسخه 3.0.0 یا بالاتر)
- Dart SDK (نسخه 2.17.0 یا بالاتر)
- Mason CLI

## نصب Mason CLI

```bash
dart pub global activate mason_cli
```

## وابستگی‌های اصلی

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.9
  dio: ^5.4.0
  internet_connection_checker: ^1.0.0+1
  logger: ^2.0.2+1
  equatable: ^2.0.5
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.8
  freezed: ^2.4.6
  json_serializable: ^6.7.1
```

## نحوه استفاده

1. ابتدا این brick را به پروژه خود اضافه کنید:
```bash
mason add mvvm_riverpod_base
```

2. سپس آن را در پروژه خود استفاده کنید:
```bash
mason make mvvm_riverpod_base --project_name "نام پروژه" --organization "نام سازمان" --description "توضیحات پروژه"
```

3. وابستگی‌های مورد نیاز را نصب کنید:
```bash
flutter pub get
```

4. کدهای تولید شده را بسازید:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## ساختار پروژه

```
lib/
└── core/
    ├── config/
    │   ├── app_config.dart
    │   └── dio_config.dart
    ├── error/
    │   ├── exceptions.dart
    │   ├── failures.dart
    │   └── error_handler.dart
    ├── network/
    │   ├── api_client.dart
    │   ├── network_info.dart
    │   └── interceptors/
    │       ├── auth_interceptor.dart
    │       └── logging_interceptor.dart
    ├── providers/
    │   ├── api_client_provider.dart
    │   ├── dio_provider.dart
    │   └── network_info_provider.dart
    └── utils/
        ├── constants.dart
        └── extensions/
            ├── context_extensions.dart
            └── string_extensions.dart
```

## نحوه استفاده از Provider ها

```dart
final apiClient = ref.watch(apiClientProvider);

// استفاده از NetworkInfo
final networkInfo = ref.watch(networkInfoProvider);

// استفاده از Dio
final dio = ref.watch(dioProvider);
```

## نحوه استفاده از Theme

این قالب از سیستم تم پیشرفته با پشتیبانی از حالت‌های روشن و تاریک استفاده می‌کند. برای استفاده از تم در برنامه:

```dart
// تغییر تم
ref.read(themeProvider.notifier).toggleTheme();

// دریافت وضعیت فعلی تم
final isDarkMode = ref.watch(themeProvider);

// استفاده از ThemeData
final themeData = ref.watch(themeDataProvider);

// استفاده از رنگ‌های سفارشی
final colors = ref.watch(colorThemeProvider);

// استفاده از استایل‌های متنی سفارشی
final textStyles = ref.watch(textThemeProvider);
```

### ساختار تم

```
lib/
└── core/
    └── theme/
        ├── app_theme.dart        // تنظیمات اصلی تم
        ├── color_themes.dart     // رنگ‌های سفارشی
        ├── text_themes.dart      // استایل‌های متنی
        └── theme_provider.dart   // مدیریت وضعیت تم
```

### تنظیمات تم

1. تنظیمات اصلی تم را در `app_theme.dart` انجام دهید:
```dart
class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    // تنظیمات تم روشن
  );

  static ThemeData get darkTheme => ThemeData(
    // تنظیمات تم تاریک
  );
}
```

2. رنگ‌های سفارشی را در `color_themes.dart` تعریف کنید:
```dart
class LightColorThemes {
  static const appAdditionalColors = AppColorsTheme(
    // رنگ‌های سفارشی تم روشن
  );
}

class DarkColorThemes {
  static const appAdditionalColors = AppColorsTheme(
    // رنگ‌های سفارشی تم تاریک
  );
}
```

3. استایل‌های متنی را در `text_themes.dart` تعریف کنید:
```dart
class LightTextThemes {
  static const appTextTheme = AppTextTheme(
    // استایل‌های متنی تم روشن
  );
}

class DarkTextThemes {
  static const appTextTheme = AppTextTheme(
    // استایل‌های متنی تم تاریک
  );
}
```

## نحوه استفاده از مدیریت زبان

این قالب از سیستم مدیریت زبان چند زبانه با استفاده از Riverpod استفاده می‌کند. برای استفاده از سیستم زبان در برنامه:

```dart
// تغییر زبان
ref.read(languageProvider.notifier).changeLanguage('en');

// دریافت زبان فعلی
final currentLocale = ref.watch(currentLocaleProvider);

// استفاده در MaterialApp
MaterialApp(
  locale: ref.watch(currentLocaleProvider),
  localizationsDelegates: const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('fa'),
    Locale('en'),
  ],
)
```

### ساختار مدیریت زبان

```
lib/
└── core/
    └── language/
        └── language_provider.dart   // مدیریت وضعیت زبان
```

### تنظیمات زبان

1. تنظیم زبان پیش‌فرض در `language_provider.dart`:
```dart
@riverpod
class Language extends _$Language {
  @override
  Locale build() => const Locale('fa'); // زبان پیش‌فرض

  void changeLanguage(String languageCode) {
    state = Locale(languageCode);
  }
}
```

2. اضافه کردن زبان‌های جدید:
   - فایل‌های ترجمه را در پوشه `assets/translations` قرار دهید
   - زبان جدید را به `supportedLocales` در `MaterialApp` اضافه کنید

## نحوه استفاده از Error Handling

```dart
try {
  // کد مورد نظر
} catch (e) {
  final failure = ErrorHandler.handleError(e);
  final message = ErrorHandler.getErrorMessage(failure);
  // نمایش پیام خطا
}
```

## نحوه استفاده از Extensions

```dart
// Context Extensions
context.theme
context.textTheme
context.colorScheme
context.size
context.isMobile
context.isTablet
context.isDesktop

// String Extensions
"test".isEmail
"test".isPhoneNumber
"test".isURL
"test".capitalize
"test".titleCase
"test".camelCase
"test".toPersianNumber
"1000".toCurrency()
```

## تنظیمات

1. تنظیمات API را در `app_config.dart` انجام دهید:
```dart
static const String apiBaseUrl = 'YOUR_API_BASE_URL';
```

2. تنظیمات Dio را در `dio_config.dart` انجام دهید:
```dart
static Dio createDio({
  String? baseUrl,
  String? Function()? getToken,
  Duration? connectTimeout,
  Duration? receiveTimeout,
  Duration? sendTimeout,
})
```

3. تنظیمات احراز هویت را در `auth_interceptor.dart` انجام دهید:
```dart
class AuthInterceptor extends Interceptor {
  final String? Function()? getToken;
  // ...
}
```

## نکات مهم

- قبل از استفاده، حتماً تنظیمات API را در `app_config.dart` انجام دهید.
- برای استفاده از احراز هویت، توکن را در `auth_interceptor.dart` تنظیم کنید.
- برای تغییر پیام‌های خطا، می‌توانید از `constants.dart` استفاده کنید.
- برای اضافه کردن extension های جدید، می‌توانید در پوشه `extensions` فایل جدیدی ایجاد کنید.
- برای استفاده از Freezed، حتماً دستور `build_runner` را اجرا کنید.

## عیب‌یابی

اگر با خطای "Invalid constant value" مواجه شدید:
   - مطمئن شوید که از `const` در constructor های `Failure` استفاده کرده‌اید.
   - مطمئن شوید که لیست‌ها به صورت `const <dynamic>[]` تعریف شده‌اند.

 اگر با خطای "Abstract classes can't be instantiated" مواجه شدید:
   - مطمئن شوید که از `NetworkInfoImpl` به جای `NetworkInfo` استفاده می‌کنید.

 اگر با خطای "Missing concrete implementation" مواجه شدید:
   - مطمئن شوید که تمام متدهای abstract را پیاده‌سازی کرده‌اید.

## مشارکت

لطفاً برای بهبود این قالب، pull request ارسال کنید.

## مجوز

این پروژه تحت مجوز MIT منتشر شده است. 
