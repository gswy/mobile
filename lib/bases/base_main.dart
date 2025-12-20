
import 'package:app/cores/drift/datas/db.dart';
import 'package:app/cores/store/local_store.dart';
import 'package:app/cores/utils/desk_util.dart';
import 'package:app/datas/hive/entity/chat.dart';
import 'package:app/datas/hive/entity/info.dart';
import 'package:app/datas/hive/entity/mate.dart';
import 'package:app/datas/hive/entity/mine.dart';
import 'package:app/datas/hive/entity/news.dart';
import 'package:app/datas/hive/entity/team.dart';
import 'package:app/datas/hive/entity/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

/// 全局基础
class BaseMain {
  /// 禁止构造
  BaseMain._();

  /// 主题切换
  static final Rx<ThemeMode> themeMode = ThemeMode.system.obs;

  /// 应用初始化
  static Future<void> init() async {
    /// 应用初始化
    WidgetsFlutterBinding.ensureInitialized();

    /// 初始化存储
    await LocalStore.init();

    /// 初始化设备
    await DeskUtil.init();

    /// 初始化存储
    await _initHive();

    /// 测试
    DB.test();

    /// 设置系统样式
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    /// 锁定竖屏显示
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  /// 初始化存储
  static Future<void> _initHive() async {
    /// 初始化Hive
    await Hive.initFlutter();
    /// 注册适配器
    Hive.registerAdapter(ChatAdapter());
    Hive.registerAdapter(InfoAdapter());
    Hive.registerAdapter(MateAdapter());
    Hive.registerAdapter(MineAdapter());
    Hive.registerAdapter(NewsAdapter());
    Hive.registerAdapter(TeamAdapter());
    Hive.registerAdapter(UserAdapter());
    /// 打开表信息
    await Hive.openBox<Chat>('chat');
    await Hive.openBox<Info>('info');
    await Hive.openBox<Mate>('mate');
    await Hive.openBox<Mine>('mine');
    await Hive.openBox<News>('news');
    await Hive.openBox<Team>('team');
    await Hive.openBox<User>('user');
  }

}
