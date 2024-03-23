import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String get toYMDFormat {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String get toHMFormat {
    return DateFormat('HH:mm').format(this);
  }
}
