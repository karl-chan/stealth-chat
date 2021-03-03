import 'package:flutter/material.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';

class AttachmentView extends StatelessWidget {
  final Attachment attachment;

  const AttachmentView(Attachment attachment, {Key key})
      : this.attachment = attachment,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> contents = [
      Row(children: [
        Icon(Icons.attach_file),
        Text(attachment.name),
      ])
    ];

    switch (attachment.type) {
      case AttachmentType.photo:
        contents = [
          Image.memory(attachment.value, height: 200, gaplessPlayback: true),
          SizedBox(height: 10),
          ...contents
        ];
        break;
      default:
        break;
    }

    return Card(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(children: contents),
        ),
        color: Colors.grey.shade100);
  }
}
