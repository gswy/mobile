
import 'package:intl/intl.dart';

class DateUtil {

  static String readTime(int ms) {
    final dt = DateTime.fromMillisecondsSinceEpoch(ms);
    final now = DateTime.now();

    bool isSameDay(DateTime a, DateTime b) =>
        a.year == b.year && a.month == b.month && a.day == b.day;

    // 今天：显示 HH:mm
    if (isSameDay(dt, now)) {
      return DateFormat('HH:mm').format(dt);
    }

    // 非今年：显示 yyyy-MM-dd
    if (dt.year != now.year) {
      return DateFormat('yyyy-MM-dd').format(dt);
    }

    // 同一年但非今天：显示 MM-dd
    return DateFormat('MM-dd').format(dt);
  }

}