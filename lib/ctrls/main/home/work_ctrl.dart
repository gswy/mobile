
import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/datas/http/apis/work_apis.dart';
import 'package:app/datas/http/resp/work/work.dart';
import 'package:get/get.dart';

class WorkCtrl extends BaseCtrl {

  final message = ''.obs;

  final loading = false.obs;

  final tasks = <WorkTask>[].obs;

  final work = Rxn<Work>(null);

  @override
  void onInit() {
    load();
    super.onInit();
  }

  /// 初始
  Future<void> init() async {
    loading.value = true;
    try {
      await load();
      message.value = '';
    } catch (_) {
      message.value = '加载失败';
    } finally {
      loading.value = false;
    }
  }

  /// 刷新
  Future<void> load() async {
    work.value = await WorkApis.getWork();
  }

}

class WorkTask {

  final int id;

  final String name;

  final String content;

  final int urgent;

  WorkTask({required this.id, required this.name, required this.content, required this.urgent});

}


