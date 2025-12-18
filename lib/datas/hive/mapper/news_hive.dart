import 'dart:async';

import 'package:app/datas/hive/entity/news.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';

/// 推送通知
class NewsHive extends GetxService {

  /// 本地存储通知
  final _hive = Hive.box<News>('news');

  /// 创建通知信息
  Future<void> add(News news) async {
    await _hive.put(news.id, news);
  }

  /// 消息变化通知
  StreamSubscription<BoxEvent> listen(void Function(News news) onData) {
    return _hive.watch().listen((e) {
      final v = e.value;
      if (v is News) onData(v);
    });
  }

}
