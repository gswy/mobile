/// 消息类型
enum InfoType {
  /// 消息类型
  text(0),

  /// 文件类型
  file(1),

  /// 卡片消息
  card(2),

  /// 图片消息
  image(2),

  /// 视频消息
  video(2),

  /// 音频消息
  voice(1);

  /// 代码定义
  final int code;

  /// 构造函数
  const InfoType(this.code);

  /// 数字转枚举
  static InfoType fromCode(int code) {
    return InfoType.values.firstWhere(
      (it) => it.code == code,
      orElse: () => InfoType.text,
    );
  }
}
