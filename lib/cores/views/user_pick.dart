//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// enum UserPickMode { radio, multi }
//
// /// 用户选择
// class UserPick extends GetView {
//
//   const UserPick({
//     super.key,
//     required this.mode,
//     this.okText,
//     this.cancelText = '取消',
//     this.initialChildSize = 0.7,
//     this.minChildSize = 0.2,
//     this.maxChildSize = 0.95,
//   });
//
//   final UserPickMode mode;
//
//   final String title;
//   final String? okText;
//   final String cancelText;
//
//   final double initialChildSize;
//   final double minChildSize;
//   final double maxChildSize;
//
//   @override
//   Widget build(BuildContext context) {
//     final scheme = Theme.of(context).colorScheme;
//
//     // ✅ 弹窗内自己的状态
//     final selected = <int>[].obs;
//
//     // ✅ 弹窗内自己的 controller（内部请求）
//     final pickCtrl = Get.put(
//       UserPickCtrl(mateCtrl: Get.find<MateCtrl>()),
//       tag: hashCode.toString(),
//     );
//
//     // ✅ 只触发一次加载
//     Future.microtask(() => pickCtrl.load());
//
//     final ok = okText ?? (mode == UserPickMode.radio ? '确定' : '添加');
//
//     return Material(
//       child: DraggableScrollableSheet(
//         expand: false,
//         initialChildSize: initialChildSize,
//         minChildSize: minChildSize,
//         maxChildSize: maxChildSize,
//         builder: (ctx, scrollCtrl) {
//           return Column(
//             children: [
//               // 标题
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
//                 child: Row(
//                   children: [
//                     Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
//                     if (mode == UserPickMode.multi)
//                       Obx(() => Text('已选 ${selected.length}',
//                           style: TextStyle(color: scheme.outline))),
//                   ],
//                 ),
//               ),
//               const Divider(height: 0.2, thickness: 0.2),
//
//               // 列表区
//               Expanded(
//                 child: Obx(() {
//                   selected.length;
//                   if (pickCtrl.loading.value) {
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                   if (pickCtrl.message.value.isNotEmpty) {
//                     return Center(child: Text(pickCtrl.message.value));
//                   }
//                   final users = pickCtrl.users;
//                   return ListView.separated(
//                     controller: scrollCtrl,
//                     itemCount: users.length,
//                     separatorBuilder: (_, _) =>
//                     const Divider(height: 0.2, thickness: 0.2),
//                     itemBuilder: (ctx, i) {
//                       final u = users[i];
//
//                       /// 单个选择
//                       if (mode == UserPickMode.radio) {
//                         return RadioListTile<int>(
//                           value: u.id,
//                           groupValue: selected.isEmpty ? null : selected.first,
//                           title: Text(u.nickname),
//                           onChanged: (v) {
//                             if (v == null) return;
//                             selected
//                               ..clear()
//                               ..add(v);
//                           },
//                         );
//                       }
//
//                       /// 批量选择
//                       if (mode == UserPickMode.multi) {
//                         return CheckboxListTile(
//                           value: selected.contains(u.id),
//                           title: Text(u.nickname),
//                           onChanged: (v) {
//                             if (v == true) {
//                               if (!selected.contains(u.id)) selected.add(u.id);
//                             } else {
//                               selected.remove(u.id);
//                             }
//                           },
//                         );
//                       }
//                     },
//                   );
//                 }),
//               ),
//
//               // 底部按钮
//               SafeArea(
//                 top: false,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: scheme.errorContainer,
//                             foregroundColor: scheme.error,
//                           ),
//                           onPressed: () {
//                             Navigator.of(context).pop(null);
//                             Get.delete<UserPickCtrl>(tag: hashCode.toString());
//                           },
//                           child: Text(cancelText),
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       Expanded(
//                         child: Obx(() => ElevatedButton(
//                           onPressed: selected.isEmpty
//                               ? null
//                               : () {
//                             if (mode == UserPickMode.radio) {
//                               Navigator.of(context).pop(selected.first);
//                             } else {
//                               Navigator.of(context).pop(selected.toList());
//                             }
//                             Get.delete<UserPickCtrl>(tag: hashCode.toString());
//                           },
//                           child: Text(ok),
//                         )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   /// 单选
//   static Future<int?> radio() async {
//
//   }
//
//   /// 多选
//   static Future<List<int>?> multi() async {
//
//   }
//
// }
//
