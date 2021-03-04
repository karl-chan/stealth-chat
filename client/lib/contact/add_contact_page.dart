import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';
import 'package:stealth_chat/contact/accept_invite_page.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/main.dart';
import 'package:stealth_chat/util/security/rsa.dart';

class AddContactController extends GetxController {
  final Globals globals;
  final TextEditingController personalMessageController;
  final String scheme;
  final String host;

  Uri inviteLink;
  RxString message = ''.obs;
  RxString renderedMessage = ''.obs;

  AddContactController(Globals globals)
      : this.globals = globals,
        this.scheme = globals.properties.get('applink.scheme'),
        this.host = globals.properties.get('applink.host'),
        this.personalMessageController =
            TextEditingController(text: 'Hi, this is ${globals.user.name}!') {
    this.inviteLink = generateInviteLink(globals);
    updateRenderedMessage();
    personalMessageController.addListener(updateRenderedMessage);
  }

  @override
  void onClose() {
    this.personalMessageController.dispose();
    super.onClose();
  }

  Uri generateInviteLink(Globals globals) {
    String id = globals.user.id;
    String name = globals.user.name;
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String signature = Rsa.sign('$id|$name|$timestamp', globals.user.keys);

    return Uri(
        scheme: this.scheme,
        host: this.host,
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

  Future<void> showAcceptInviteTextDialog() async {
    TextEditingController controller = TextEditingController();
    Rx<Uri> acceptInviteLink = Rx(null);
    await Get.defaultDialog(
      title: 'Paste invite link',
      content: Obx(() => TextField(
            controller: controller,
            decoration: InputDecoration(
                suffix: IconButton(
                    icon: Icon(Icons.paste),
                    onPressed: () async {
                      final data = await Clipboard.getData('text/plain');
                      if (data != null) {
                        controller.text = data.text;
                      }
                    }),
                hintText: 'e.g. app://chat/accept-invite/...',
                errorText:
                    acceptInviteLink.value == null && controller.text.isNotEmpty
                        ? 'Not a valid link!'
                        : null),
            onChanged: (input) {
              final uri = Uri.tryParse(input.trim());
              if (uri != null &&
                  uri.scheme == this.scheme &&
                  uri.host == this.host &&
                  uri.path == Paths.ACCEPT_INVITE) {
                acceptInviteLink.value = uri;
              } else {
                acceptInviteLink.nil();
              }
            },
          )),
      textConfirm: 'Enter',
      confirmTextColor: Colors.white,
      onConfirm: () async {
        if (acceptInviteLink.value != null) {
          await Get.to(AcceptInvitePage(acceptInviteLink.value));
        }
      },
    );
  }

  Future<void> showAcceptInviteQRDialog() async {
    stayAwake(true);
    await Get.defaultDialog(
      title: 'Scan QR code',
      content: SizedBox(
          width: 200,
          height: 200,
          child: QRView(
              key: GlobalKey(debugLabel: 'AcceptInviteQRDialog'),
              onQRViewCreated: (controller) {
                controller.scannedDataStream.listen((scanData) async {
                  final uri = Uri.tryParse(scanData.code);
                  if (uri != null &&
                      uri.scheme == this.scheme &&
                      uri.host == this.host &&
                      uri.path == Paths.ACCEPT_INVITE) {
                    await Get.to(AcceptInvitePage(uri));
                    stayAwake(false);
                  }
                });
              })),
    );
    stayAwake(false);
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
              InPersonTab(globals, c).paddingAll(10)
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
        ),
        MaterialButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('I already have an invite link!'),
            ],
          ),
          color: Colors.orange,
          textColor: Colors.white,
          onPressed: c.showAcceptInviteTextDialog,
        )
      ],
    ));
  }
}

class InPersonTab extends StatelessWidget {
  final Globals globals;

  final AddContactController c;

  const InPersonTab(Globals globals, AddContactController c, {Key key})
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
        HeaderText('Scan QR code'),
        SizedBox(height: 20),
        QrImage(
          padding: EdgeInsets.all(10),
          data: c.inviteLink.toString(),
        ),
        MaterialButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('I have a code to scan'),
              const SizedBox(width: 10),
              const Icon(Icons.camera_alt)
            ],
          ),
          color: Colors.orange,
          textColor: Colors.white,
          onPressed: c.showAcceptInviteQRDialog,
        ),
      ],
    ));
  }
}
