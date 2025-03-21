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

## نحوه استفاده

1. ابتدا این brick را به پروژه خود اضافه کنید:
```bash
mason add mvvm_riverpod_base
```

2. سپس آن را در پروژه خود استفاده کنید:
```bash
mason make mvvm_riverpod_base
```

3. تنظیمات مورد نیاز را در `app_config.dart` انجام دهید.

4. از provider های آماده در کد خود استفاده کنید:
```dart
final apiClient = ref.watch(apiClientProvider);
final networkInfo = ref.watch(networkInfoProvider);
```

## وابستگی‌ها

- dio: ^5.4.0
- flutter_riverpod: ^2.4.9
- internet_connection_checker: ^1.0.0+1
- logger: ^2.0.2+1
- equatable: ^2.0.5

## نکات مهم

- قبل از استفاده، حتماً تنظیمات API را در `app_config.dart` انجام دهید.
- برای استفاده از احراز هویت، توکن را در `auth_interceptor.dart` تنظیم کنید.
- برای تغییر پیام‌های خطا، می‌توانید از `constants.dart` استفاده کنید.
- برای اضافه کردن extension های جدید، می‌توانید در پوشه `extensions` فایل جدیدی ایجاد کنید.

## مشارکت

لطفاً برای بهبود این قالب، pull request ارسال کنید.

## مجوز

این پروژه تحت مجوز MIT منتشر شده است. 