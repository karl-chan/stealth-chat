import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/chat/message_card.dart';
import 'package:stealth_chat/util/date_time_formatter.dart';
import 'package:stealth_chat/util/db/db.dart';

class MessageInfoPage extends StatelessWidget {
  final ChatMessage message;

  const MessageInfoPage(ChatMessage message, {Key key})
      : this.message = message,
        super(key: key);

  Widget getTable(ChatMessage message) {
    final rows = List<Widget>();
    if (message.sentTimestamp != null) {
      rows.addAll([
        Text(
          'Sent',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
        ).marginAll(10),
        Text(DateTimeFormatter.formatDateLong(message.sentTimestamp))
            .marginOnly(left: 30),
        SizedBox(height: 10),
      ]);
    }
    if (message.deliveredTimestamp != null) {
      rows.addAll([
        Text(
          'Delivered',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
        ).marginAll(10),
        Text(DateTimeFormatter.formatDateLong(message.deliveredTimestamp))
            .marginOnly(left: 30),
        SizedBox(height: 10),
      ]);
    }
    if (message.readTimestamp != null) {
      rows.addAll([
        Text(
          'Read',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200),
        ).marginAll(10),
        Text(DateTimeFormatter.formatDateLong(message.readTimestamp))
            .marginOnly(left: 30),
        SizedBox(height: 10),
      ]);
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Message info'),
          backgroundColor: Colors.amber,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Flexible(
                  child: FractionallySizedBox(
                widthFactor: 0.7,
                child: MessageCard(message),
              ))
            ]),
            SizedBox(height: 20),
            Divider(
              height: 10,
            ),
            getTable(message)
          ],
        ));
  }
}
