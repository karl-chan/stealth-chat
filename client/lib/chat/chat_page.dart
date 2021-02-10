import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/date_time_formatter.dart';
import 'package:stealth_chat/util/db/db.dart';
import 'package:stealth_chat/util/security/aes.dart';
import 'package:stealth_chat/util/security/keys.dart';
import 'package:stealth_chat/util/socket/client/send_chat_event.dart';

class ChatController extends GetxController {
  final Globals globals;
  final Contact contact;
  final RxList<ChatMessage> chatMessages;
  final Rx<Color> themeColour;
  final RxBool canSend = false.obs;
  final Rx<Uint8List> inputAttachment = Rx(null);
  final TextEditingController inputMessageController = TextEditingController();

  ChatController(Contact contact, Globals globals)
      : this.globals = globals,
        this.contact = contact,
        this.chatMessages = List<ChatMessage>().obs
          ..bindStream(globals.db.chatMessages.listChatMessages(contact)),
        this.themeColour = Color(contact.color).obs {
    inputMessageController.addListener(() {
      canSend.value = inputMessageController.text.isNotEmpty;
    });
  }

  void sendMessage() async {
    String message = inputMessageController.text;
    AesMessage aes =
        Aes.encrypt(message, Keys(secretKey: contact.chatSecretKey));
    DateTime now = DateTime.now();

    globals.socket.client.sendChat.push(SendChatMessage(
        contactId: contact.id,
        encrypted: aes.encrypted,
        iv: aes.iv,
        timestamp: now.millisecondsSinceEpoch));
    await globals.db.chatMessages.insertMessage(contact.id, true, message, now);

    inputMessageController.clear();
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

    final chatPanel = Obx(() => Container(
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              ChatMessage message = c.chatMessages.elementAt(index);

              final messageText = Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    message.message,
                    style: TextStyle(
                        color: message.isSelf ? Colors.black : Colors.white,
                        fontSize: 16),
                  ));
              final timestamp = Align(
                  alignment: Alignment.bottomRight,
                  child: Text(DateTimeFormatter.formatTime(message.timestamp),
                      style: TextStyle(
                          color: message.isSelf
                              ? Colors.grey.shade700
                              : Colors.grey.shade300)));

              return FractionallySizedBox(
                  alignment: message.isSelf
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  widthFactor: 0.7,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: message.isSelf
                          ? Colors.grey.shade200
                          : c.themeColour.value,
                      child: Column(children: [messageText, timestamp])
                          .paddingAll(10)));
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
                return SizedBox(height: 0);
              }
            },
            itemCount: c.chatMessages.length,
            reverse: true,
          ),
        ));

    final inputPanel = Obx(() => Row(
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
              icon: Icon(
                Icons.send,
              ),
              color: c.themeColour.value,
              onPressed: c.canSend.value ? c.sendMessage : null,
            ),
          ],
        ));

    return Obx(() => Theme(
        data: ThemeData.from(
            colorScheme: ColorScheme.light(primary: c.themeColour.value)),
        child: Scaffold(
            appBar: AppBar(
              title: Text(contact.name),
            ),
            body: SafeArea(
                minimum: EdgeInsets.all(10),
                child: Column(children: [
                  Expanded(child: chatPanel),
                  Divider(),
                  inputPanel
                ])))));
  }
}
