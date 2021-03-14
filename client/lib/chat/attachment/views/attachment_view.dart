import 'dart:io';

import 'package:filesize/filesize.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';
import 'package:stealth_chat/chat/attachment/views/audio_attachment_view.dart';
import 'package:stealth_chat/chat/attachment/views/image_attachment_view.dart';
import 'package:stealth_chat/chat/attachment/views/other_attachment_view.dart';
import 'package:stealth_chat/chat/attachment/views/video_attachment_view.dart';
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
    await File(path).delete();
  }

  Widget getConcreteView() {
    switch (attachment.type) {
      case AttachmentType.photo:
        return ImageAttachmentView(attachment);
      case AttachmentType.video:
        return VideoAttachmentView(attachment);
      case AttachmentType.audio:
        return AudioAttachmentView(attachment);
      default:
        return OtherAttachmentView(attachment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getConcreteView(),
                    SizedBox(height: 10),
                    Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconTheme(
                              data: IconThemeData(color: Colors.grey.shade700),
                              child: attachment.type.toIcon()),
                          SizedBox(width: 5),
                          Text(attachment.name),
                          SizedBox(width: 5),
                          Text('(${filesize(attachment.value.lengthInBytes)})')
                        ])
                  ]),
            ),
            color: Colors.grey.shade100),
        onTap: open);
  }
}
