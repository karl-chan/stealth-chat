import 'package:flutter/material.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';

class ImageAttachmentView extends StatelessWidget {
  final Attachment attachment;
  const ImageAttachmentView(Attachment attachment, {Key key})
      : this.attachment = attachment,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.memory(attachment.value,
        fit: BoxFit.fitWidth, gaplessPlayback: true);
  }
}
