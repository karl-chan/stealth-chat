import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Value;
import 'package:stealth_chat/chat/attachment/attachment.dart';
import 'package:stealth_chat/chat/chat_input_panel.dart';
import 'package:stealth_chat/chat/message/message_card.dart';
import 'package:stealth_chat/chat/message/message_info_page.dart';
import 'package:stealth_chat/contact/avatar.dart';
import 'package:stealth_chat/contact/contact_settings_page.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/date_time_formatter.dart';
import 'package:stealth_chat/util/db/db.dart';
import 'package:stealth_chat/util/security/aes.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:stealth_chat/util/socket/client/send_attachment_event.dart';
import 'package:stealth_chat/util/socket/client/send_chat_event.dart';
import 'package:stealth_chat/util/socket/client/send_chat_update_event.dart';
import 'package:tinycolor/tinycolor.dart';

class ChatController extends GetxController {
  final GZipCodec gzip = GZipCodec();

  final Globals globals;
  final Rx<Contact> contact;
  final RxList<ChatMessage> chatMessages;
  final Rx<Color> themeColour;

  final RxBool isMultiSelectMode;
  final RxSet<ChatMessage> selected;

  Worker markAsReadWorker;

  ChatController(Contact contact, Globals globals)
      : this.globals = globals,
        this.contact = contact.obs
          ..bindStream(globals.db.contacts.watchContact(contact.id)),
        this.chatMessages = <ChatMessage>[].obs
          ..bindStream(globals.db.chatMessages.listChatMessages(contact.id)),
        // ignore: unnecessary_cast
        this.themeColour = (Colors.green as Color).obs,
        this.isMultiSelectMode = false.obs,
        this.selected = Set<ChatMessage>().obs {
    ever(this.contact, (c) => this.themeColour.value = Color(c.color));
    markAsReadWorker = ever(chatMessages, markIncomingMessagesAsRead);
  }

  @override
  void onClose() {
    this.markAsReadWorker.dispose();
    super.onClose();
  }

  Future<void> sendMessage(String message, Attachment attachment) async {
    DateTime now = DateTime.now();
    Keys keys = Keys(secretKey: contact.value.chatSecretKey);

    await globals.db.chatMessages
        .insertMessage(contact.value.id, true, message, now);
    if (attachment != null) {
      await globals.db.chatMessages
          .insertAttachment(contact.value.id, true, now, attachment);
    }

    AesMessage aes = await Aes.encrypt(message, keys);
    await globals.socket.client.sendChat.push(SendChatMessage(
        contactId: contact.value.id,
        encrypted: aes.encrypted,
        iv: aes.iv,
        timestamp: now.millisecondsSinceEpoch));

    if (attachment != null) {
      AesMessage attachmentAes = await attachment.encode(keys);
      await globals.socket.client.sendAttachment.push(SendAttachmentMessage(
        contactId: contact.value.id,
        timestamp: now.millisecondsSinceEpoch,
        encrypted: attachmentAes.encrypted,
        iv: attachmentAes.iv,
      ));
    }
  }

  Future<void> markIncomingMessagesAsRead(List<ChatMessage> value) async {
    DateTime readTimestamp = DateTime.now();
    List<DateTime> timestamps = value
        .where((m) => !m.isSelf)
        .takeWhile((m) => m.readTimestamp == null)
        .map((m) => m.timestamp)
        .toList();
    await globals.db.chatMessages
        .updateReadMulti(contact.value.id, timestamps, readTimestamp);
    await Future.forEach(timestamps, (timestamp) async {
      await globals.socket.client.sendChatUpdate.push(SendChatUpdateMessage(
          contactId: contact.value.id,
          timestamp: timestamp.millisecondsSinceEpoch,
          event: 'read',
          eventTimestamp: readTimestamp.millisecondsSinceEpoch));
    });
  }

  void enterMultiSelectMode(ChatMessage message) {
    this.selected.add(message);
    this.isMultiSelectMode.value = true;
  }

  void exitMultiSelectMode() {
    this.selected.clear();
    this.isMultiSelectMode.value = false;
  }

  bool isSelected(ChatMessage message) {
    return this.selected.contains(message);
  }

  bool isInfoAvailable() {
    return this.selected.length == 1 && this.selected.first.isSelf;
  }

  void toggleSelect(ChatMessage message) {
    if (isSelected(message)) {
      this.selected.remove(message);
    } else {
      this.selected.add(message);
    }
  }

  void deleteMessages() async {
    await Get.defaultDialog(
        title: 'Confirm delete',
        middleText: 'Are you sure to delete the selected messages?',
        confirm: TextButton(
            onPressed: () async {
              await globals.db.chatMessages
                  .deleteMessages(this.selected.toList());
              Get.back();
            },
            child: Text('Yes', style: TextStyle(color: Colors.white)),
            style: TextButton.styleFrom(backgroundColor: Colors.green)),
        cancel: TextButton(
          onPressed: Get.back,
          child: Text('No', style: TextStyle(color: Colors.white)),
          style: TextButton.styleFrom(backgroundColor: Colors.red),
        ));
  }
}

class ChatPage extends StatelessWidget {
  final Contact contact;

  const ChatPage(Contact contact, {Key key})
      : this.contact = contact,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    ChatController c = Get.put(ChatController(contact, globals));

    final appBar = AppBar(
      title: Stack(alignment: Alignment.center, children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Avatar(c.contact.value, darkMode: true),
        ),
        Column(children: [
          Text(c.contact.value.name, style: TextStyle(color: Colors.white)),
          Obx(() => Text(
              c.contact.value.online
                  ? 'Online'
                  : 'Last seen ${DateTimeFormatter.formatShort(c.contact.value.lastSeen)}',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.white)))
        ])
      ]),
      actions: [
        PopupMenuButton<Function>(
          onSelected: (Function function) => function(),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<Function>(
                  value: () => Get.to(ContactSettingsPage(c.contact.value)),
                  child: const Text('Preferences'))
            ];
          },
        ),
      ],
      centerTitle: true,
    );
    final multiSelectModeAppBar = AppBar(
      title: Obx(() => Text('${c.selected.length} selected')),
      backgroundColor: TinyColor(c.themeColour.value).darken(20).color,
      centerTitle: false,
      actions: [
        Obx(() => c.isInfoAvailable()
            ? Tooltip(
                message: 'Info',
                child: IconButton(
                    icon: Icon(Icons.info_outline),
                    onPressed: () => Get.to(MessageInfoPage(c.selected.first))))
            : SizedBox(width: 0, height: 0)),
        Tooltip(
          message: 'Delete selected',
          child:
              IconButton(icon: Icon(Icons.delete), onPressed: c.deleteMessages),
        )
      ],
    );

    final chatPanel = Obx(() => Container(
          decoration: c.contact.value.wallpaper != null
              ? BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.9), BlendMode.dstATop),
                      image: MemoryImage(c.contact.value.wallpaper)))
              : null,
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              ChatMessage message = c.chatMessages.elementAt(index);

              return Obx(() => Container(
                  foregroundDecoration: BoxDecoration(
                      color: c.isSelected(message)
                          ? Colors.lightBlueAccent.withAlpha(64)
                          : null),
                  child: FractionallySizedBox(
                      alignment: message.isSelf
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      widthFactor: 0.7,
                      child: MessageCard(
                        message,
                        colour: message.isSelf
                            ? Colors.grey.shade200
                            : c.themeColour.value,
                        onTap: () => c.isMultiSelectMode.value
                            ? c.toggleSelect(message)
                            : null,
                        onLongPress: () => c.enterMultiSelectMode(message),
                      ).marginSymmetric(horizontal: 5))));
            },
            separatorBuilder: (BuildContext context, int index) {
              ChatMessage prevMessage = c.chatMessages.elementAt(index + 1);
              ChatMessage message = c.chatMessages.elementAt(index);
              if (prevMessage.timestamp.day != message.timestamp.day) {
                return Center(
                    child: Card(
                            elevation: 2,
                            color: Colors.lightBlueAccent.shade100,
                            child: Text(
                              DateTimeFormatter.formatDateShort(
                                  message.timestamp),
                              style: TextStyle(color: Colors.grey.shade700),
                            ).paddingSymmetric(vertical: 5, horizontal: 10))
                        .marginSymmetric(vertical: 20));
              } else {
                return const SizedBox(height: 0, width: 0);
              }
            },
            itemCount: c.chatMessages.length,
            reverse: true,
          ),
        ));

    return Obx(() => Theme(
        data: ThemeData.from(
            colorScheme: ColorScheme.light(primary: c.themeColour.value)),
        child: WillPopScope(
            onWillPop: () async {
              if (c.isMultiSelectMode.value) {
                c.exitMultiSelectMode();
                return false;
              } else {
                return true;
              }
            },
            child: Scaffold(
                appBar:
                    c.isMultiSelectMode.value ? multiSelectModeAppBar : appBar,
                body: Column(children: [
                  Expanded(child: chatPanel),
                  Divider(),
                  SafeArea(
                    child: ChatInputPanel(
                        themeColour: c.themeColour.value,
                        onSend: c.sendMessage),
                  )
                ])))));
  }
}
