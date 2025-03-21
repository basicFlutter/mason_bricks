// اکستنشن‌های عمومی برای String
extension StringExtensions on String {
  String capitalize() => this[0].toUpperCase() + substring(1);
} 