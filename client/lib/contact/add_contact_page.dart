import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:share/share.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/security/rsa.dart';

class AddContactController extends GetxController {
  final Globals globals;
  final TextEditingController personalMessageController;
  final Uri inviteLink;

  RxString message = ''.obs;
  RxString renderedMessage = ''.obs;

  AddContactController(Globals globals)
      : this.globals = globals,
        this.personalMessageController =
            TextEditingController(text: 'Hi, this is ${globals.user.name}!'),
        this.inviteLink = generateInviteLink(globals) {
    updateRenderedMessage();
    personalMessageController.addListener(updateRenderedMessage);
  }

  static Uri generateInviteLink(Globals globals) {
    String id = globals.user.id;
    String name = globals.user.name;
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String signature = Rsa.sign('$id|$name|$timestamp', globals.user.keys);

    return Uri(
        scheme: globals.properties.get('applink.scheme'),
        host: globals.properties.get('applink.host'),
        path: Paths.ACCEPT_INVITE,
        queryParameters: {
          'id': id,
          'name': name,
          'ts': timestamp,
          'sig': signature
        });
  }

  void updateRenderedMessage() {
    renderedMessage.value = '''${personalMessageController.text}

Join me by opening the following link:

$inviteLink''';
  }

  void sendInvite() {
    Share.share(renderedMessage.value,
        subject: 'Invite from ${globals.user.name}');
  }
}

class AddContactPage extends StatelessWidget {
  const AddContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Globals globals = Get.find();
    AddContactController c = Get.put(AddContactController(globals));

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Add contact'),
            bottom: TabBar(
              tabs: [Tab(text: 'Via Message'), Tab(text: 'In person')],
            ),
          ),
          body: TabBarView(
            children: [
              ViaMessageTab(globals, c).paddingAll(10),
              AcceptInviteTab(globals, c).paddingAll(10)
            ],
          ),
        ));
  }
}

class HeaderText extends StatelessWidget {
  final String text;

  HeaderText(String text, {Key key})
      : this.text = text,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
    );
  }
}

class ViaMessageTab extends StatelessWidget {
  final Globals globals;

  final AddContactController c;

  const ViaMessageTab(Globals globals, AddContactController c, {Key key})
      : this.globals = globals,
        this.c = c,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        HeaderText('Send an email, SMS or IM'),
        SizedBox(height: 20),
        TextField(
          controller: c.personalMessageController,
          keyboardType: TextInputType.multiline,
          minLines: 3,
          maxLines: null,
          decoration: InputDecoration(
              labelText: 'Add a personal message (optional)',
              hintText: 'e.g. Hi, this is ${globals.user.name}.'),
        ),
        SizedBox(height: 50),
        HeaderText('Preview'),
        Card(child: Obx(() => SelectableText(c.renderedMessage.value))),
        MaterialButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Send invite'),
              const SizedBox(width: 10),
              const Icon(Icons.send)
            ],
          ),
          color: Colors.green,
          textColor: Colors.white,
          onPressed: c.sendInvite,
        )
      ],
    ));
  }
}

class AcceptInviteTab extends StatelessWidget {
  final Globals globals;

  final AddContactController c;

  const AcceptInviteTab(Globals globals, AddContactController c, {Key key})
      : this.globals = globals,
        this.c = c,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [],
    ));
  }
}
