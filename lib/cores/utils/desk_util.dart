
import 'dart:io';

import 'package:app/cores/store/local_store.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

/// 设备信息缓存
class DeskUtil {
  DeskUtil._();

  static const _deskIdKey = 'DeskID';
  static const _deskNameKey = 'DeskName';
  static const _deskInfoKey = 'DeskName';

  static final DeviceInfoPlugin _plugin = DeviceInfoPlugin();

  /// 初始化存储
  static Future<void> init() async {
    /// 判定设备标识
    final id = LocalStore.getString(_deskIdKey);
    if (id == null) {
      final identity = Uuid().v4().replaceAll('-', '');
      LocalStore.setString(_deskIdKey, identity);
    }
    /// 判定设备名称
    final name = LocalStore.getString(_deskNameKey);
    if (name == null) {
      String name = 'unknown name';
      if (Platform.isIOS) {
        final ios = await _plugin.iosInfo;
        name = ios.name;
      }
      if (Platform.isAndroid) {
        final android = await _plugin.androidInfo;
        name = android.name;
      }
      LocalStore.setString(_deskNameKey, name);
    }
    /// 判定设备描述
    final info = LocalStore.getString(_deskInfoKey);
    if (info == null) {
      String info = 'unknown info';
      if (Platform.isIOS) {
        final ios = await _plugin.iosInfo;
        info = '${ios.modelName} ${ios.systemName} ${ios.systemVersion}';
      }
      if (Platform.isAndroid) {
        final android = await _plugin.androidInfo;
        info = '${android.device} ${android.display}';
      }
      LocalStore.setString(_deskInfoKey, info);
    }
  }

  /// 获取标识
  static String get id => LocalStore.getString(_deskIdKey) ?? 'unknown id';

  /// 获取名称
  static String get name => LocalStore.getString(_deskNameKey) ?? 'unknown name';

  /// 获取描述
  static String get info => LocalStore.getString(_deskInfoKey) ?? 'unknown info';

}