import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:emoji_picker/emoji_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';
import 'package:stealth_chat/chat/attachment/views/attachment_view.dart';
import 'package:stealth_chat/main.dart';
import 'package:stealth_chat/util/compress.dart';
import 'package:stealth_chat/util/logging.dart';

typedef SendCallback = void Function(String, Attachment);

class ChatInputPanelController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  final TextEditingController inputMessageController = TextEditingController();
  final RxBool canSend = false.obs;
  final Rx<Attachment> inputAttachment = Rx(null);
  final RxBool showEmojiKeyboard;
  final SendCallback onSend;

  ChatInputPanelController(SendCallback onSend)
      : this.showEmojiKeyboard = false.obs,
        this.onSend = onSend {
    inputMessageController.addListener(updateCanSend);
    ever(this.inputAttachment, (_) => updateCanSend);
  }

  @override
  void onClose() {
    inputMessageController.dispose();
    super.onClose();
  }

  void updateCanSend() {
    this.canSend.value = this.inputAttachment.value != null ||
        !this.inputMessageController.value.isBlank;
  }

  Future<void> takePhoto() async {
    stayAwake(true);
    final file = await imagePicker.getImage(source: ImageSource.camera);
    stayAwake(false);

    if (file != null) {
      Uint8List bytes = await Compress.image(file.path);
      inputAttachment.value = Attachment(
          type: AttachmentType.photo, name: basename(file.path), value: bytes);
      updateCanSend();
      await File(file.path).delete();
    }
  }

  Future<void> takeVideo() async {
    stayAwake(true);
    final file = await imagePicker.getVideo(source: ImageSource.camera);
    stayAwake(false);

    if (file != null) {
      Uint8List bytes = await Compress.video(file.path);
      inputAttachment.value = Attachment(
          type: AttachmentType.video, name: basename(file.path), value: bytes);
      updateCanSend();
      await File(file.path).delete();
    }
  }

  Future<void> recordAudio() async {
    stayAwake(true);
    final file = await imagePicker.getVideo(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    stayAwake(false);

    if (file != null) {
      Uint8List bytes = await Compress.audio(file.path);
      if (bytes == null) {
        Get.snackbar('Error', 'Failed to encode audio');
        await File(file.path).delete();
        return;
      }
      inputAttachment.value = Attachment(
          type: AttachmentType.audio,
          name: '${basenameWithoutExtension(file.path)}.m4a',
          value: bytes);
      updateCanSend();
      await File(file.path).delete();
    }
  }

  Future<void> selectAttachment() async {
    stayAwake(true);
    FilePickerResult result = await FilePicker.platform
        .pickFiles(withData: true, allowCompression: true);
    stayAwake(false);

    if (result != null) {
      AttachmentType type =
          AttachmentTypes.fromExtension(result.files.single.extension);
      final file = result.files.single;
      logDebug('Original size: ${file.bytes.lengthInBytes / 1024} kB');
      Uint8List bytes = file.bytes;
      switch (type) {
        case AttachmentType.photo:
          bytes = await Compress.image(file.path);
          break;
        default:
      }
      logDebug('Compressed size: ${bytes.lengthInBytes / 1024} kB');
      inputAttachment.value =
          Attachment(type: type, name: result.files.single.name, value: bytes);
      updateCanSend();
    }
  }

  void deleteAttachment() {
    this.inputAttachment.nil();
  }

  Future<void> sendMessage() async {
    // get and clear input immediately
    String message = inputMessageController.text;
    Attachment attachment = inputAttachment.value;
    inputMessageController.clear();
    inputAttachment.nil();

    onSend(message, attachment);
  }
}

class ChatInputPanel extends StatelessWidget {
  final themeColour;
  final onSend;

  const ChatInputPanel(
      {Key key, @required Color themeColour, @required SendCallback onSend})
      : this.themeColour = themeColour,
        this.onSend = onSend,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatInputPanelController c = Get.put(ChatInputPanelController(onSend));

    Widget emojiKeyboard = EmojiPicker(
        rows: 4,
        columns: 9,
        onEmojiSelected: (emoji, category) {
          int baseIdx = max(0, c.inputMessageController.selection.baseOffset);
          int endIdx = max(0, c.inputMessageController.selection.extentOffset);
          String prefix =
              c.inputMessageController.text.substring(0, baseIdx) + emoji.emoji;
          String text =
              prefix + c.inputMessageController.text.substring(endIdx);
          c.inputMessageController.value = TextEditingValue(
              text: text,
              selection: TextSelection.fromPosition(
                  TextPosition(offset: prefix.length)));
        });

    Widget inputPanel = Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...(c.inputAttachment.value != null
                ? [
                    Stack(children: [
                      AttachmentView(c.inputAttachment.value),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: FloatingActionButton(
                                shape: CircleBorder(
                                    side: BorderSide(
                                        width: 2, color: Colors.white)),
                                child: Icon(Icons.close, size: 15),
                                backgroundColor: Colors.black54,
                                foregroundColor: Colors.white,
                                onPressed: c.deleteAttachment)),
                      )
                    ])
                  ]
                : []),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: c.inputMessageController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(hintText: 'Enter a message'),
                    minLines: 1,
                    maxLines: 5,
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.emoji_emotions_outlined),
                    onPressed: c.showEmojiKeyboard.toggle),
                PopupMenuButton<Function>(
                  icon: Icon(Icons.attach_file),
                  onSelected: (Function function) => function(),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<Function>(
                          value: c.takePhoto,
                          child: Row(children: [
                            Icon(Icons.camera_alt),
                            SizedBox(width: 10),
                            Text('Take photo')
                          ])),
                      PopupMenuItem<Function>(
                          value: c.takeVideo,
                          child: Row(children: [
                            Icon(Icons.videocam),
                            SizedBox(width: 10),
                            Text('Take video')
                          ])),
                      PopupMenuItem<Function>(
                          value: c.recordAudio,
                          child: Row(children: [
                            Icon(Icons.mic),
                            SizedBox(width: 10),
                            Text('Record audio')
                          ])),
                      PopupMenuItem<Function>(
                          value: c.selectAttachment,
                          child: Row(children: [
                            Icon(Icons.file_copy),
                            SizedBox(width: 10),
                            Text('Upload file')
                          ])),
                    ];
                  },
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: themeColour,
                  onPressed: c.canSend.value ? () => c.sendMessage() : null,
                ),
              ],
            )
          ],
        ));

    return Obx(() => Column(children: [
          c.showEmojiKeyboard.value ? emojiKeyboard : SizedBox(height: 0),
          inputPanel
        ]));
  }
}
