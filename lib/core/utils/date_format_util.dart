import 'package:intl/intl.dart';

/// Shortcut for DateFormatUtil [DFU]
typedef DFU = DateFormatUtil;

abstract class _DateTimeFormats {
  static final dayName = DateFormat('EEE');
  static final dayNameFull = DateFormat('EEEE');
  static final ddMMyyyy = DateFormat('dd-MMM-yyyy');
  static final ddMMMyyyy = DateFormat('dd/MM/yyyy');
  static final friendlyFormat = DateFormat('dd-MM-yyyy');
  static final dateTimeLabel = DateFormat('MMM d, h:mm a');
  static final timeLabel = DateFormat('hh:mm a');
}
abstract class DateFormatUtil {
  static DateTime now() => DateTime.now();

  static String getDayName(DateTime dateTime) => _DateTimeFormats.dayName.format(dateTime);

  static String getDayNameFully(DateTime dateTime) => _DateTimeFormats.dayNameFull.format(dateTime);
  static String ddMMyyyy(DateTime dateTime) => _DateTimeFormats.ddMMyyyy.format(dateTime);
  static String ddMMMyyyy(DateTime dateTime) => _DateTimeFormats.ddMMMyyyy.format(dateTime);
  static String friendlyFormat(DateTime dateTime) => _DateTimeFormats.friendlyFormat.format(dateTime);
  static String dateTimeLabel(DateTime dateTime) => _DateTimeFormats.dateTimeLabel.format(dateTime);

  static String ddMMyyyyFromStr(String? date) {
    try {      
      if(date == null) return 'NA';
      final dateTime = DateTime.parse(date);
      return _DateTimeFormats.ddMMyyyy.format(dateTime);
    } catch (e) {
      return '';
    }
  }

  static String timeLabelFromStr(String date) {
    try {
      final dateTime = DateTime.parse(date);
      return _DateTimeFormats.timeLabel.format(dateTime);
    } catch (e) {
      return '';
    }
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
