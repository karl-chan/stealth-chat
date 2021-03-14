import 'package:flutter/material.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';
import 'package:stealth_chat/util/db/db.dart';

class MostRecentMessagePreview extends StatelessWidget {
  final ChatMessage chatMessage;
  final int numUnread;

  const MostRecentMessagePreview(ChatMessage chatMessage, int numUnread,
      {Key key})
      : this.chatMessage = chatMessage,
        this.numUnread = numUnread,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chatMessage == null) {
      return Text('');
    }

    List<Widget> row = [
      Text(chatMessage.message, maxLines: 1, overflow: TextOverflow.ellipsis)
    ];

    if (numUnread != null) {
      row = [...row, SizedBox(width: 5), Text('($numUnread)')];
    }

    Icon icon = AttachmentTypes.parseInt(chatMessage.attachmentType).toIcon();
    if (icon != null) {
      row = [
        IconTheme(data: IconThemeData(color: Colors.grey), child: icon),
        SizedBox(width: 5),
        ...row
      ];
    }

    Widget widget = Row(children: row);
    if (numUnread != null) {
      widget = DefaultTextStyle(
          child: widget,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey));
    }
    return widget;
  }
}
