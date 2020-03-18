/**
 * server.dart
 *
 * Purpose:
 *
 * Description:
 *
 * History:
 *   26/07/2017, Created by jumperchen
 *
 * Copyright (C) 2017 Potix Corporation. All Rights Reserved.
 */
import 'package:socket_io/socket_io.dart';

void main() {
  // Dart server
  var io = Server();
  io.on('connection', (client) {
    final headers = client.handshake['headers'];
    headers.forEach((k, v) => print('$k => $v'));

    print('connection default namespace');
    client.on('msg', (data) {
      print('data from default => $data');
      client.emit('fromServer', '$data');
    });
  });
  io.listen(3000);
}
