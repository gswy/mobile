
class ChatUtil {
  ChatUtil._();

  /// 传入两个 id，按从小到大拼成 "min_max"
  static String getSN(int targetId, int sourceId) {
    final minId = targetId < sourceId ? targetId : sourceId;
    final maxId = targetId < sourceId ? sourceId : targetId;
    return '${minId}_$maxId';
  }

}