import 'package:phoenix_socket/phoenix_socket.dart';
import 'package:stealth_chat/globals.dart';
import 'package:stealth_chat/util/security/rsa.dart';

class Socket {
  final Globals globals;

  PhoenixSocket socket;
  PhoenixChannel messageChannel;

  Socket(Globals globals) : this.globals = globals;

  void connect() {
    assert(globals.user.keys != null, "User is not signed in!");

    String socketHost = globals.properties.get('server.socket.host');

    String sigUser = globals.user.id;
    int sigTimestamp = DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
    String msg = '$sigTimestamp';
    String sigHash = Rsa.sign(msg, globals.user.keys);

    final params = {
      'sig-user': sigUser,
      'sig-timestamp': sigTimestamp.toString(),
      'sig-hash': sigHash
    };

    socket = PhoenixSocket('$socketHost/socket/websocket',
        socketOptions: PhoenixSocketOptions(params: params))
      ..connect();

    socket.openStream.listen((event) {
      messageChannel = socket.addChannel(topic: 'message:${globals.user.id}');
    });
  }
}
