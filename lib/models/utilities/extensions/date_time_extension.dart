import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toSlashFormattedDate() => DateFormat('d/M/yyyy').format(this);
}
