import 'package:app/cores/bases/base_ctrl.dart';
import 'package:app/datas/http/apis/conf_apis.dart';
import 'package:app/datas/http/resp/conf/conf_safe.dart';
import 'package:get/get.dart';

/// 公共配置
class ConfCtrl extends BaseCtrl {
  /// 远程请求
  final _http = Get.find<ConfApis>();

  /// 是否加载
  final message = ''.obs;
  final loading = false.obs;

  /// ------------- 通知管理 ---------------


  /// ------------- 收藏管理 ---------------
  final likeList = <LikeItem>[].obs;
  Future<void> initLike() async {
    loading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      likeList.value = [
        LikeItem(title: '测试收藏', value: '您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定约定您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定处理且本人您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定失联，后续可能安排调查人员核实情况，烦请转告，谢谢！'),
        LikeItem(title: '测试收藏', value: '您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定处理且本人失联，后续可能安排调查人员核实情况，烦请转告，谢谢！'),
        LikeItem(title: '测试收藏', value: '您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定处理且本人失联，后续可能安排调查人员核实情况，烦请转告，谢谢！'),
        LikeItem(title: '测试收藏', value: '您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定处理且本人失联，后续可能安排调查人员核实情况，烦请转告，谢谢！'),
        LikeItem(title: '测试收藏', value: '您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定处理且本人失联，后续可能安排调查人员核实情况，烦请转告，谢谢！'),
        LikeItem(title: '测试收藏', value: '您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定处理且本人失联，后续可能安排调查人员核实情况，烦请转告，谢谢！'),
        LikeItem(title: '测试收藏', value: '您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定处理且本人失联，后续可能安排调查人员核实情况，烦请转告，谢谢！'),
        LikeItem(title: '测试收藏', value: '您好，您是倪福胜在【宜享花】办理业务预留的紧急联系人，现在没有按照约定处理且本人失联，后续可能安排调查人员核实情况，烦请转告，谢谢！'),
      ];
      loading.value = false;
    });
  }

  /// ------------- 设备管理 ---------------
  /// 设备列表
  final deskList = [].obs;
  /// 加载设备
  Future<void> initDesk() async {
    loading.value = true;
    try {
      safe.value = await _http.getSafe();
      message.value = '';
    } catch (e) {
      safe.value = null;
      message.value = '加载失败';
    } finally {
      loading.value = false;
    }
  }
  /// 移除设备
  Future<void> moveDesk() async {

  }

  /// ------------- 语言设置 ---------------
  /// 语言设置
  final lang = 'zh_CN'.obs;
  final langAuto = false.obs;
  final langList = [
    LangItem(title: '简体中文', value: 'zh_CN'),
    LangItem(title: '繁體中文（香港）', value: 'zh_HK'),
    LangItem(title: '繁體中文（台灣）', value: 'zh_TW'),
    LangItem(title: 'English (United States)', value: 'en_US'),
    LangItem(title: 'English (United Kingdom)', value: 'en_GB'),
  ];
  /// 切换语言
  Future<void> swapLang(String value) async {
    lang.value = value;
  }
  /// 设置自动切换
  Future<void> swapLangAuto(bool value) async {
    langAuto.value = value;
  }

  /// ------------- 隐私设置 ---------------
  /// 隐私表单
  final safe = Rxn<ConfSafe>();
  /// 加载隐私
  Future<void> initSafe() async {
    loading.value = true;
    try {
      safe.value = await _http.getSafe();
      message.value = '';
    } catch (e) {
      safe.value = null;
      message.value = '加载失败';
    } finally {
      loading.value = false;
    }
  }
  /// 保存隐私
  Future<void> saveSafe() async {

  }


}

/// 语言选项
class LangItem {
  final String title;
  final String value;
  LangItem({required this.title, required this.value});
}

/// 收藏选项
class LikeItem {
  final String title;
  final String value;
  LikeItem({required this.title, required this.value});
}
