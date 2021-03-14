import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_ffmpeg/media_information.dart';
import 'package:get/state_manager.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';

class AudioAttachmentController extends GetxController {
  final Rx<Duration> duration = Duration.zero.obs;

  AudioAttachmentController(Attachment attachment) {
    loadAudio(attachment);
  }

  Future<void> loadAudio(Attachment attachment) async {
    Directory tempDir = await getTemporaryDirectory();
    String path = join(tempDir.path, attachment.name);
    await File(path).writeAsBytes(attachment.value);

    FlutterFFprobe ffprobe = FlutterFFprobe();
    MediaInformation info = await ffprobe.getMediaInformation(path);
    double milliseconds =
        double.parse(info.getMediaProperties()['duration']) * 1000;
    duration.value = Duration(milliseconds: milliseconds.toInt());
  }
}

class AudioAttachmentView extends StatelessWidget {
  final Attachment attachment;

  const AudioAttachmentView(Attachment attachment, {Key key})
      : this.attachment = attachment,
        super(key: key);

  String format(Duration d) {
    int min = d.inMinutes;
    int secs = d.inSeconds - min * 60;
    return "${min.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    AudioAttachmentController c = AudioAttachmentController(attachment);

    return Container(
        color: Colors.grey.shade300,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [
              Icon(Icons.play_arrow),
              Flexible(child: Slider(value: 0, onChanged: null)),
              Obx(() => Text(format(c.duration.value)))
            ])));
  }
}
