import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';

class AudioAttachmentController extends GetxController {
  final AudioPlayer player = AudioPlayer();
  final RxBool isPlaying = false.obs;
  final Rx<Duration> duration = Duration.zero.obs;
  final RxDouble currentPositionMs = 0.0.obs;

  AudioAttachmentController(Attachment attachment) {
    loadAudio(attachment);
    player.playingStream.listen((boolean) {
      isPlaying.value = boolean;
    });
    player.positionStream.listen((duration) {
      currentPositionMs.value = duration.inMilliseconds.toDouble();
    });
  }

  Future<void> loadAudio(Attachment attachment) async {
    Directory tempDir = await getTemporaryDirectory();
    String path = join(tempDir.path, attachment.name);
    await File(path).writeAsBytes(attachment.value);

    duration.value = await player.setFilePath(path);
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

    final playButton = Obx(
      () => IconButton(
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          onPressed: c.isPlaying.isTrue ? c.player.pause : c.player.play,
          icon: Icon(c.isPlaying.isTrue ? Icons.pause : Icons.play_arrow)),
    );

    return Obx(() => Container(
        color: Colors.grey.shade300,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(children: [
              playButton,
              Flexible(
                  child: Slider(
                      value: c.currentPositionMs.value,
                      min: 0,
                      max: c.duration.value.inMilliseconds.toDouble(),
                      onChanged: (ms) async {
                        c.currentPositionMs.value = ms;
                        await c.player.seek(Duration(milliseconds: ms.toInt()));
                      })),
              Text(format(
                  Duration(milliseconds: c.currentPositionMs.value.toInt())))
            ]))));
  }
}
