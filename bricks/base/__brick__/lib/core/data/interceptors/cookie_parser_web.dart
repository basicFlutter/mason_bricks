import 'package:cookie_jar/cookie_jar.dart';

/// Parse Set-Cookie header value for web platform
/// This is a simple parser that extracts name, value, and basic attributes
Cookie parseCookie(String setCookieValue) {
  // Parse Set-Cookie header: name=value; attribute1=value1; attribute2=value2
  final parts = setCookieValue.split(';').map((e) => e.trim()).toList();
  final nameValue = parts[0].split('=');
  
  if (nameValue.length < 2) {
    throw FormatException('Invalid Set-Cookie header: $setCookieValue');
  }
  
  final name = nameValue[0].trim();
  final value = nameValue.sublist(1).join('=').trim();
  
  // Create cookie with name and value
  final cookie = Cookie(name, value);
  
  // Parse additional attributes
  for (var i = 1; i < parts.length; i++) {
    final part = parts[i];
    final attrParts = part.split('=');
    final attrName = attrParts[0].trim().toLowerCase();
    final attrValue = attrParts.length > 1 ? attrParts.sublist(1).join('=').trim() : '';
    
    switch (attrName) {
      case 'domain':
        cookie.domain = attrValue;
        break;
      case 'path':
        cookie.path = attrValue;
        break;
      case 'expires':
        // Parse expires date if needed
        try {
          cookie.expires = DateTime.parse(attrValue);
        } catch (e) {
          // Ignore parse errors
        }
        break;
      case 'max-age':
        try {
          final maxAge = int.parse(attrValue);
          cookie.expires = DateTime.now().add(Duration(seconds: maxAge));
        } catch (e) {
          // Ignore parse errors
        }
        break;
      case 'secure':
        cookie.secure = true;
        break;
      case 'httponly':
        cookie.httpOnly = true;
        break;
      case 'samesite':
        // SameSite attribute (not directly supported by Cookie class)
        break;
    }
  }
  
  return cookie;
}






