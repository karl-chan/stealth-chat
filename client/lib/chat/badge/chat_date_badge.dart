import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;
import 'package:stealth_chat/util/date_time_formatter.dart';
import 'package:stealth_chat/util/db/db.dart';

class ChatDateBadge extends StatelessWidget {
  final ChatMessage message;

  const ChatDateBadge(ChatMessage message, {Key key})
      : this.message = message,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 2,
            color: Colors.lightBlueAccent.shade100,
            child: Text(
              DateTimeFormatter.formatDateShort(message.timestamp),
              style: TextStyle(color: Colors.grey.shade700),
            ).paddingSymmetric(vertical: 5, horizontal: 10))
        .marginSymmetric(vertical: 20);
  }
}
