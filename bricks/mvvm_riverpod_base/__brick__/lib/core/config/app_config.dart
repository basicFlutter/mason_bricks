class AppConfig {
  static const String appName = '{{project_name}}';
  static const String apiBaseUrl = 'YOUR_API_BASE_URL';
  
  // API Timeouts
  static const int connectTimeout = 30;
  static const int receiveTimeout = 30;
  static const int sendTimeout = 30;

  // Cache Configuration
  static const int cacheMaxAge = 7; // days
  static const int maxCacheSize = 10 * 1024 * 1024; // 10MB

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 32;
  
  // Other App Constants
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm:ss';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm:ss';
} 