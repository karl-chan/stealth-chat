import 'package:flutter/material.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';

class OtherAttachmentView extends StatelessWidget {
  final Attachment attachment;

  const OtherAttachmentView(Attachment attachment, {Key key})
      : this.attachment = attachment,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: null,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.file_download),
          SizedBox(width: 10),
          Text('Download')
        ]));
  }
}
