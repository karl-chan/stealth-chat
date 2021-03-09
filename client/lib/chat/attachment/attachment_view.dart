import 'dart:io';

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';
import 'package:stealth_chat/main.dart';

class AttachmentView extends StatelessWidget {
  final Attachment attachment;

  const AttachmentView(Attachment attachment, {Key key})
      : this.attachment = attachment,
        super(key: key);

  Future<void> open() async {
    Directory tempDir = await getTemporaryDirectory();
    String path = join(tempDir.path, attachment.name);
    await File(path).writeAsBytes(attachment.value);

    stayAwake(true);
    await OpenFile.open(path);
    stayAwake(false);
  }

  List<Widget> renderContents() {
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
    return contents;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: renderContents(),
              ),
            ),
            color: Colors.grey.shade100),
        onTap: open);
  }
}
