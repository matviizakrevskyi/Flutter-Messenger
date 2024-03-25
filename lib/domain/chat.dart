import 'package:flutter_messenger/domain/message.dart';
import 'package:flutter_messenger/domain/user.dart';

class Chat {
  final String id;
  final User userData;
  final Message lastMessage;

  Chat(this.id, this.userData, this.lastMessage);
}
