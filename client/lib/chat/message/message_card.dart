import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:stealth_chat/chat/attachment/attachment.dart';
import 'package:stealth_chat/chat/attachment/views/attachment_view.dart';
import 'package:stealth_chat/util/date_time_formatter.dart';
import 'package:stealth_chat/util/db/db.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageCard extends StatelessWidget {
  final ChatMessage message;
  final Color colour;
  final GestureTapCallback onTap;
  final GestureLongPressCallback onLongPress;

  const MessageCard(ChatMessage message,
      {Key key,
      Color colour,
      GestureTapCallback onTap,
      GestureLongPressCallback onLongPress})
      : this.message = message,
        this.colour = colour,
        this.onTap = onTap,
        this.onLongPress = onLongPress,
        super(key: key);

  Widget getLastSeenIcon(ChatMessage message) {
    if (message.isSelf) {
      if (message.readTimestamp != null) {
        return FaIcon(FontAwesomeIcons.checkDouble,
            color: Colors.blue, size: 14);
      }
      if (message.deliveredTimestamp != null) {
        return FaIcon(FontAwesomeIcons.checkDouble,
            color: Colors.grey, size: 14);
      }
      if (message.sentTimestamp != null) {
        return FaIcon(FontAwesomeIcons.check, color: Colors.grey, size: 14);
      }
    }
    return SizedBox(width: 0, height: 0);
  }

  @override
  Widget build(BuildContext context) {
    final messageText = Align(
        alignment: Alignment.topLeft,
        child: SelectableLinkify(
          text: message.message,
          style: TextStyle(
              color: message.isSelf ? Colors.black : Colors.white,
              fontSize: 16),
          linkStyle: TextStyle(
              color: message.isSelf ? Colors.blueAccent : Colors.white),
          options: LinkifyOptions(humanize: false),
          onOpen: (link) async {
            if (await canLaunch(link.url)) {
              await launch(link.url);
            } else {
              throw 'Could not launch $link';
            }
          },
        ));
    final timestamp = Text(DateTimeFormatter.formatTime(message.timestamp),
        style: TextStyle(
            color:
                message.isSelf ? Colors.grey.shade700 : Colors.grey.shade300));
    final lastSeen = getLastSeenIcon(message);
    final borderRadius = BorderRadius.circular(20);

    return InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          color: this.colour,
          child: Column(children: [
            ...(message.attachment != null
                ? [
                    AttachmentView(Attachment(
                        type: AttachmentTypes.parseInt(message.attachmentType),
                        name: message.attachmentName,
                        value: message.attachment))
                  ]
                : []),
            messageText,
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [timestamp, SizedBox(width: 2), lastSeen])
          ]).paddingAll(10),
        ));
  }
}
