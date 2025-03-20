# example

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## مدیریت تم و رنگ‌ها

### ساختار تم‌ها
پروژه از یک سیستم تم پیشرفته استفاده می‌کند که شامل موارد زیر است:
- تم روشن و تاریک
- رنگ‌های سفارشی
- استایل‌های متنی
- قابلیت تغییر تم در زمان اجرا

### استفاده از رنگ‌ها
برای استفاده از رنگ‌های سفارشی در برنامه:

```dart
// دسترسی به رنگ‌های سفارشی
final colors = Theme.of(context).extension<AppAdditionalColorsEx>();

// مثال استفاده
Container(
  color: colors?.success50,
  child: Text(
    'متن موفقیت',
    style: TextStyle(color: colors?.success700),
  ),
)
```

### اضافه کردن رنگ جدید
برای اضافه کردن رنگ جدید به سیستم تم:

1. در فایل `lib/core/theme/color_themes.dart` به کلاس `AppAdditionalColorsEx` یک فیلد جدید اضافه کنید:
```dart
final Color newColor;
```

2. رنگ را در کلاس‌های `LightColorThemes` و `DarkColorThemes` تعریف کنید:
```dart
static final appAdditionalColors = AppAdditionalColorsEx(
  // رنگ‌های موجود
  newColor: Color(0xFF...), // رنگ جدید
);
```

3. متد `lerp` و `copyWith` را به‌روزرسانی کنید.

### تغییر تم با استفاده از BLoC
برای تغییر تم در برنامه:

1. اضافه کردن BLoC به درخت ویجت:
```dart
BlocProvider(
  create: (context) => ThemeBloc(),
  child: MaterialApp(
    // ...
  ),
)
```

2. تغییر تم:
```dart
// تغییر تم
context.read<ThemeBloc>().add(ToggleTheme());

// تنظیم تم خاص
context.read<ThemeBloc>().add(SetTheme(isDark: true));
```

3. استفاده از تم فعلی:
```dart
BlocBuilder<ThemeBloc, ThemeState>(
  builder: (context, state) {
    return MaterialApp(
      theme: state.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      // ...
    );
  },
)
```

### نکات مهم
- تمام رنگ‌های سفارشی باید از طریق `Theme.of(context).extension<AppAdditionalColorsEx>()` دسترسی شوند
- برای حفظ سازگاری، همیشه از رنگ‌های تعریف شده در تم استفاده کنید
- تغییر تم به صورت خودکار در کل برنامه اعمال می‌شود
