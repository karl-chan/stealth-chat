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

    switch (AttachmentTypes.parseInt(chatMessage.attachmentType)) {
      case AttachmentType.photo:
        row = [
          Icon(Icons.photo, color: Colors.grey),
          SizedBox(width: 5),
          ...row
        ];
        break;
      case AttachmentType.video:
        row = [
          Icon(Icons.videocam, color: Colors.grey),
          SizedBox(width: 5),
          ...row
        ];
        break;
      case AttachmentType.audio:
        row = [
          Icon(Icons.audiotrack, color: Colors.grey),
          SizedBox(width: 5),
          ...row
        ];
        break;
      default:
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
