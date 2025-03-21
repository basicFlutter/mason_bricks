class Constants {
  // API Endpoints
  static const String baseUrl = 'YOUR_API_BASE_URL';
  
  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  
  // Error Messages
  static const String networkError = 'خطا در اتصال به اینترنت';
  static const String serverError = 'خطا در ارتباط با سرور';
  static const String unknownError = 'خطای ناشناخته';
  
  // Validation Messages
  static const String requiredField = 'این فیلد الزامی است';
  static const String invalidEmail = 'ایمیل نامعتبر است';
  static const String invalidPassword = 'رمز عبور نامعتبر است';
  
  // Success Messages
  static const String successMessage = 'عملیات با موفقیت انجام شد';
  
  // Loading Messages
  static const String loadingMessage = 'لطفاً صبر کنید...';
  
  // Timeouts
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
  static const int sendTimeout = 30000;
} 