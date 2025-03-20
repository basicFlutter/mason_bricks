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

#### تغییر زبان با LanguageBloc
این قالب از BLoC برای مدیریت زبان استفاده می‌کند. برای تغییر زبان برنامه می‌توانید از روش‌های زیر استفاده کنید:

1. تغییر زبان به انگلیسی:
```dart
context.read<LanguageBloc>().add(ChangeLanguage(const Locale('en')));
```

2. تغییر زبان به فارسی:
```dart
context.read<LanguageBloc>().add(ChangeLanguage(const Locale('fa')));
```

3. اضافه کردن زبان جدید به لیست زبان‌های پشتیبانی شده:
```dart
context.read<LanguageBloc>().add(AddSupportedLocale(const Locale('ar'))); // اضافه کردن زبان عربی
```

4. حذف یک زبان از لیست زبان‌های پشتیبانی شده:
```dart
context.read<LanguageBloc>().add(RemoveSupportedLocale(const Locale('ar'))); // حذف زبان عربی
```

نکات مهم:
- زبان انتخاب شده به صورت خودکار در حافظه امن دستگاه ذخیره می‌شود
- در صورت باز شدن مجدد برنامه، آخرین زبان انتخاب شده به صورت خودکار اعمال می‌شود
- اگر زبانی در لیست `supportedLocales` نباشد، نمی‌توان به آن زبان تغییر وضعیت داد

#### استفاده از ترجمه‌ها در کد:
بعد از تولید فایل‌های محلی‌سازی با اجرای دستور flutter pub get، می‌توانید به راحتی از متغیرهای تعریف‌شده برای نمایش ترجمه‌ها استفاده کنید. کافیست دستور زیر را در کد خود به‌کار ببرید:
```dart
AppLocalizations localizations = AppLocalizations.of(context)!;
```
### مثال
```dart
Text(localizations.hello);
``` 