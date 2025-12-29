import 'package:get/get.dart';

/// 公共控制器基类，统一封装一些通用能力和生命周期回调。
/// 
/// - 继承自 [SuperController]，可以同时感知：
///   - GetX 控制器生命周期（onInit / onReady / onClose）
///   - 页面可见性变化（onHidden）
///   - App 前后台生命周期（onDetached / onInactive / onPaused / onResumed）
abstract class BaseCtrl extends SuperController {

  /// 当控制器所在的页面/组件首次渲染完成后调用。
  ///
  /// 区别于 [onInit]：
  /// - `onInit`：在依赖注入完毕后立即调用，Widget 还未渲染
  /// - `onReady`：首帧绘制完成后调用，适合做：
  ///   - 首次网络请求
  ///   - 弹窗 / Dialog
  ///   - 依赖 BuildContext 的操作
  @override
  void onReady() {
    super.onReady();
  }

  /// 当前页面/组件被「隐藏」时调用。
  ///
  /// 典型场景：
  /// - 使用 `TabBarView` / `PageView` 切换 Tab 时，当前页滑出视野
  /// - 新页面通过 `Navigator.push` / `Get.to` 覆盖当前页面
  ///
  /// 适合在此处：
  /// - 暂停当前页面的动画 / 计时器
  /// - 暂停无关紧要的轮询任务
  @override
  void onHidden() {
    //
  }

  /// App 与宿主引擎分离时调用（生命周期中最早被触发的结束状态）。
  ///
  /// 这是整体 App 生命周期的一部分，对应原生的 `AppLifecycleState.detached`：
  /// - 通常在应用即将完全退出或销毁时触发
  /// - 适合做一些「兜底」的资源释放或日志上报
  ///
  /// 大部分业务场景用不到这个方法，可按需重写。
  @override
  void onDetached() {
    //
  }

  /// App 处于非活动状态时调用。
  ///
  /// 对应原生的 `AppLifecycleState.inactive`：
  /// - 应用仍在前台，但暂时无法响应用户输入
  /// - 例如：系统弹出电话、权限请求弹窗等短暂中断场景
  ///
  /// 可在此处：
  /// - 暂停一些对用户交互敏感的操作
  @override
  void onInactive() {
    //
  }

  /// App 进入后台、界面不可见时调用。
  ///
  /// 对应原生的 `AppLifecycleState.paused`：
  /// - 用户切到其他 App
  /// - 按 Home 键回到桌面
  ///
  /// 适合在此处：
  /// - 持久化当前页面关键数据
  /// - 暂停长轮询、降低资源消耗
  @override
  void onPaused() {
    //
  }

  /// App 从后台恢复到前台、重新可见时调用。
  ///
  /// 对应原生的 `AppLifecycleState.resumed`：
  /// - 用户重新回到 App
  ///
  /// 适合在此处：
  /// - 恢复中断的任务（如轮询、动画）
  /// - 刷新关键数据（检查会话是否有新消息等）
  @override
  void onResumed() {

  }

  /// 控制器被销毁时调用。
  ///
  /// 触发时机：
  /// - 对应的路由被 `Get.off` / `Get.offAll` 等方式移除
  /// - 手动调用 `Get.delete<YourController>()`
  ///
  /// 适合在此处：
  /// - 释放资源（Stream、Timer、WebSocket 监听等）
  /// - 取消订阅、移除监听器
  @override
  void onClose() {
    super.onClose();
  }
}
