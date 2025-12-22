import 'package:app/cores/drift/enums/chat_type.dart';
import 'package:app/cores/drift/enums/info_type.dart';

class InfoForm {
  final ChatType chat;
  final InfoType info;
  final String clientId;
  final int targetId;
  final int parentId;
  final String message;
  final int messageAt;

  InfoForm({
    required this.chat,
    required this.info,
    required this.clientId,
    required this.targetId,
    required this.parentId,
    required this.message,
    required this.messageAt,
  });

}
