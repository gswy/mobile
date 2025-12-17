
import 'package:uuid/uuid.dart';

class UuidUtil {
  UuidUtil._();

  static const _uuid = Uuid();

  static String get id => _uuid.v4().replaceAll('-', '');

}