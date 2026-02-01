import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';

/// Parse Set-Cookie header value using dart:io Cookie class
Cookie parseCookie(String setCookieValue) {
  return Cookie.fromSetCookieValue(setCookieValue);
}






