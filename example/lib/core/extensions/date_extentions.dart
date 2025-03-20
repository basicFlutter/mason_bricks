import 'package:intl/intl.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart' as datePicker;

extension CustomDateExtensions on DateTime {

  datePicker.Jalali get toJalaliDateTime{
    return datePicker.Jalali.fromDateTime(this);
  }

  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  String? weekdayName() {
    const Map<int, String> weekdayName = {
      1: "Monday",
      2: "Tuesday",
      3: "Wednesday",
      4: "Thursday",
      5: "Friday",
      6: "Saturday",
      7: "Sunday"
    };
    return weekdayName[weekday];
  }

  DateTime toNoonUTC() {
    // Set time to 12:00 noon UTC
    return DateTime.utc(year, month, day, 12, 0, 0, 0, 0);
  }

  String getTime() {
    // Format time as HH:mm
    return "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
  }

  String toJalaliFullDate() {
    // Convert to Jalali and format as full date
    return datePicker.Jalali.fromDateTime(this).formatFullDate();
  }

  String toJalaliCompactDate() {
    // Convert to Jalali and format as compact date
    return datePicker.Jalali.fromDateTime(this).formatCompactDate();
  }

  String toJalaliShortDate() {
    // Convert to Jalali and format as short date
    return datePicker.Jalali.fromDateTime(this).formatShortDate();
  }

  String toJalaliMediumDate() {
    // Convert to Jalali and format as medium date
    return datePicker.Jalali.fromDateTime(this).formatMediumDate();
  }
}

extension DateExtension on String? {
  DateTime? get toDateTime {
    if (this == null) return null;
    return DateTime.tryParse(this!);
  }

  String get timeFormat {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    return dateTime != null
        ? DateFormat(DateFormat.HOUR_MINUTE_TZ).format(dateTime)
        : "";
  }

  String get abbrWeekDay {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    return dateTime != null
        ? DateFormat(DateFormat.ABBR_WEEKDAY).format(dateTime)
        : "";
  }

  String get YEAR_ABBR_MONTH_DAY {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    return dateTime != null
        ? DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(dateTime)
        : "";
  }

  String get ABBR_MONTH_WEEKDAY_DAY {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    return dateTime != null
        ? DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(dateTime)
        : "";
  }

  String formatWithTime() {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    if (dateTime == null) return "";
    return "${DateFormat("yyyy-MM-dd").format(dateTime)} "
        "${dateTime.hour.toString().padLeft(2, "0")}:${dateTime.minute.toString().padLeft(2, "0")}";
  }

  String get toJalaliFullDate {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    if (dateTime == null) return "";
    return dateTime.toJalaliFullDate();
  }

  String get toJalaliCompactDate {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    if (dateTime == null) return "";
    return dateTime.toJalaliCompactDate().replaceAll("/", "-");
  }

  String get toJalaliShortDate {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    if (dateTime == null) return "";
    return dateTime.toJalaliShortDate();
  }

  String get toJalaliMediumDate {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    if (dateTime == null) return "";
    return dateTime.toJalaliMediumDate();
  }

  String get toJalaliMediumDateWithTime {
    if (this == null) return "";
    final dateTime = DateTime.tryParse(this!);
    if (dateTime == null) return "";
    return "${dateTime.toJalaliMediumDate()} ${dateTime.getTime()}";
  }

  String calculateDifference(String endDate) {
    if (this == null || endDate.isEmpty) return "";

    final dateTime1 = DateTime.tryParse(this!);
    final dateTime2 = DateTime.tryParse(endDate);
    if (dateTime1 == null || dateTime2 == null) return "";

    final difference = dateTime2.difference(dateTime1);

    final days = difference.inDays;
    final hours = difference.inHours % 24;
    final minutes = difference.inMinutes % 60;

    final parts = [
      if (days > 0) "${days}d",
      if (hours > 0) "${hours}h",
      if (minutes > 0) "${minutes}m"
    ];

    return parts.join(" ");
  }
}
