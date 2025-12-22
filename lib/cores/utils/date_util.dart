
import 'package:intl/intl.dart';

class DateUtil {

  static String readTime(int ms) {
    final now = DateTime.now();
    final dt = DateTime.fromMillisecondsSinceEpoch(ms);
    final diff = now.difference(dt);
    if (diff.isNegative) return '刚刚';
    if (diff.inSeconds < 10) return '刚刚';
    if (diff.inMinutes < 1) return '${diff.inSeconds}秒前';
    if (diff.inHours < 1) return '${diff.inMinutes}分钟前';
    if (diff.inDays < 1) return '${diff.inHours}小时前';
    if (diff.inDays < 30) return '${diff.inDays}天前';

    // 更久：显示日期（你可以改成 yyyy-MM-dd HH:mm）
    return DateFormat('yyyy-MM-dd').format(dt);
  }

}