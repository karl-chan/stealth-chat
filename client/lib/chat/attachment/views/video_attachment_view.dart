import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';
import 'package:video_compress/video_compress.dart';

class VideoAttachmentController extends GetxController {
  final Rx<Uint8List> thumbnail = Rx(null);

  VideoAttachmentController(Attachment attachment) {
    loadThumbnail(attachment);
  }

  Future<void> loadThumbnail(Attachment attachment) async {
    Directory tempDir = await getTemporaryDirectory();
    String path = join(tempDir.path, attachment.name);
    await File(path).writeAsBytes(attachment.value);

    thumbnail.value = await VideoCompress.getByteThumbnail(path);
    await File(path).delete();
  }
}

class VideoAttachmentView extends StatelessWidget {
  final Attachment attachment;

  const VideoAttachmentView(Attachment attachment, {Key key})
      : this.attachment = attachment,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    VideoAttachmentController c = VideoAttachmentController(attachment);

    return Stack(alignment: AlignmentDirectional.center, children: [
      Obx(() => c.thumbnail.value == null
          ? SizedBox(height: 0)
          : ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.dstATop),
              child: Image.memory(c.thumbnail.value))),
      Icon(Icons.play_circle_fill, size: 96, color: Colors.white),
    ]);
  }
}
