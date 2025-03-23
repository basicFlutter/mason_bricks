import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';

/// اکستنشن جامع برای کار با فایل
extension FileExtension on File {
  /// دریافت سایز فایل به بایت
  Future<int> getFileSize() async {
    try {
      return await length();
    } catch (e) {
      rethrow;
    }
  }

  /// دریافت سایز فایل به مگابایت
  Future<double> getFileSizeInMB() async {
    final bytes = await getFileSize();
    return bytes / (1024 * 1024);
  }

  /// تبدیل فایل به MultipartFile جهت ارسال به سمت سرور با استفاده از dio
  ///
  /// فقط فایل ورودی لازم است، دیگر نیازی به تعیین نام فایل و نوع MIME نیست.
  Future<MultipartFile> toMultipartFile() async {
    try {
      final bytes = await readAsBytes();
      final name = p.basename(path);
      // MediaType به صورت خودکار بر اساس پسوند فایل انتخاب می‌شود
      final contentType = _getMediaTypeFromExtension(name);

      return MultipartFile.fromBytes(
        bytes,
        filename: name,
        contentType: contentType,
      );
    } catch (e) {
      rethrow;
    }
  }

  /// دریافت نوع MIME از پسوند فایل
  MediaType _getMediaTypeFromExtension(String fileName) {
    final extension = p.extension(fileName).toLowerCase();

    switch (extension) {
      case '.jpg':
      case '.jpeg':
        return MediaType('image', 'jpeg');
      case '.png':
        return MediaType('image', 'png');
      case '.gif':
        return MediaType('image', 'gif');
      case '.pdf':
        return MediaType('application', 'pdf');
      case '.txt':
        return MediaType('text', 'plain');
      case '.json':
        return MediaType('application', 'json');
      case '.html':
        return MediaType('text', 'html');
    // افزودن انواع MIME دیگر طبق نیاز
      default:
        return MediaType('application', 'octet-stream');
    }
  }

  /// خواندن محتویات فایل به صورت رشته
  Future<String> readContentAsString({Encoding encoding = utf8}) async {
    try {
      return await readAsString(encoding: encoding);
    } catch (e) {
      rethrow;
    }
  }

  /// خواندن محتویات فایل به صورت بایت
  Future<List<int>> readContentAsBytes() async {
    try {
      return await readAsBytes();
    } catch (e) {
      rethrow;
    }
  }

  /// دریافت پسوند فایل (به عنوان مثال: .jpg, .png, .txt)
  String get fileExtension {
    return p.extension(path);
  }

  /// حذف فایل در صورت وجود
  Future<void> deleteFileIfExists() async {
    if (await exists()) {
      await delete();
    }
  }

  /// نوشتن داده‌ها به فایل به صورت بایت
  Future<File> writeContent(
      List<int> bytes, {
        FileMode mode = FileMode.write,
      }) async {
    try {
      return await writeAsBytes(bytes, mode: mode);
    } catch (e) {
      rethrow;
    }
  }

  /// نوشتن رشته به فایل
  Future<File> writeStringContent(
      String content, {
        FileMode mode = FileMode.write,
        Encoding encoding = utf8,
      }) async {
    try {
      return await writeAsString(content, mode: mode, encoding: encoding);
    } catch (e) {
      rethrow;
    }
  }
}
