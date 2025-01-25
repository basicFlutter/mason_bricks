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

bricks:
  feature:
    git:
      url: https://github.com/basicFlutter/mason_bricks.git
      path: bricks/feature
### 2 . نصب Mason CLI
ابزار Mason CLI را با دستور زیر نصب و فعال کنید:

dart pub global activate mason_cli
### 3. دانلود قالب‌ها
برای دانلود قالب‌ها دستور

mason get

### 4. تولید فیچر جدید
برای ایجاد فایل‌های موردنیاز یک فیچر جدید، از دستور زیر استفاده کنید:
mason make feature --name=نام_فیچر --useCase=نام_مورد_استفاده

### مثال
برای ایجاد فیچری به نام user_selector با مورد استفاده‌ای به نام get_users، دستور زیر را اجرا کنید:
mason make feature --name=user_selector --useCase=get_users






