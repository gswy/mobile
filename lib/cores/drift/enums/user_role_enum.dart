import 'package:drift/drift.dart';

/// 会话类型
enum UserRoleEnum {
  /// 群主
  owner(0),

  /// 管理
  admin(1),

  /// 成员
  other(2);

  /// 代码定义
  final int code;

  /// 构造函数
  const UserRoleEnum(this.code);

  /// 数字转枚举
  static UserRoleEnum fromCode(int code) {
    return UserRoleEnum.values.firstWhere(
          (it) => it.code == code,
      orElse: () => UserRoleEnum.other,
    );
  }
}

