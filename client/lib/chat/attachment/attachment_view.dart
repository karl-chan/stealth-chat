import 'package:filesize/filesize.dart';
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
      Wrap(children: [
        Icon(Icons.attach_file),
        Text(attachment.name),
        SizedBox(width: 5),
        Text('(${filesize(attachment.value.lengthInBytes)})')
      ])
    ];

    switch (attachment.type) {
      case AttachmentType.photo:
        contents = [
          Image.memory(attachment.value,
              fit: BoxFit.fitWidth, gaplessPlayback: true),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: contents,
          ),
        ),
        color: Colors.grey.shade100);
  }
}
