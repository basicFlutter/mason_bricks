extension StringExtensions on String {
  // Validation Extensions
  bool get isEmail => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);
  bool get isPhoneNumber => RegExp(r'^\+?[\d\s-]{10,}$').hasMatch(this);
  bool get isURL => RegExp(r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$').hasMatch(this);
  
  // Formatting Extensions
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
  String get titleCase => split(' ').map((word) => word.capitalize).join(' ');
  String get camelCase => split(' ').map((word) => word.capitalize).join('');
  
  // Trimming Extensions
  String get trimAll => replaceAll(RegExp(r'\s+'), '');
  String get trimStart => replaceFirst(RegExp(r'^\s+'), '');
  String get trimEnd => replaceFirst(RegExp(r'\s+$'), '');
  
  // Length Extensions
  bool get isEmptyOrNull => isEmpty || this == 'null';
  bool get isNotEmptyOrNull => !isEmptyOrNull;
  
  // Number Extensions
  int? get toInt => int.tryParse(this);
  double? get toDouble => double.tryParse(this);
  bool get isNumeric => double.tryParse(this) != null;
  
  // Date Extensions
  DateTime? get toDateTime => DateTime.tryParse(this);
  
  // HTML Extensions
  String get removeHtmlTags => replaceAll(RegExp(r'<[^>]*>'), '');
  
  // Password Strength Extensions
  bool get hasUpperCase => contains(RegExp(r'[A-Z]'));
  bool get hasLowerCase => contains(RegExp(r'[a-z]'));
  bool get hasNumbers => contains(RegExp(r'[0-9]'));
  bool get hasSpecialCharacters => contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  
  // Persian Number Extensions
  String get toPersianNumber {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    String result = this;
    for (int i = 0; i < english.length; i++) {
      result = result.replaceAll(english[i], persian[i]);
    }
    return result;
  }
  
  // RTL Extensions
  bool get isRTL => RegExp(r'[\u0591-\u07FF\u200F\u202B\u202E\uFB1D-\uFDFD\uFE70-\uFEFC]').hasMatch(this);
  
  // Currency Extensions
  String toCurrency({String symbol = 'ریال'}) {
    if (!isNumeric) return this;
    final number = double.parse(this);
    return '${number.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    )} $symbol';
  }
} 