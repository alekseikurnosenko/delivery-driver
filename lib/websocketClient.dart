import 'dart:convert';

import 'package:openapi/api.dart';
import 'package:web_socket_channel/io.dart';

import 'main.dart';

class WebsocketClient {

   final _channel = IOWebSocketChannel.connect(
      'wss://enigmatic-garden-23553.herokuapp.com/ws',
      headers: {"Authorization": "Bearer ${MyApp.token}"});

  Stream<dynamic> events;

  WebsocketClient() {
    events = _channel.stream.map((event) {
      var message = jsonDecode(event);
      var type = message['type'];
      var payload = jsonDecode(message['payload']);
      switch (type) {
        case "com.delivery.demo.delivery.DeliveryRequested": {
          return DeliveryRequested.fromJson(payload);
        }
        default: {
          print("Unknown event type: $type");
          return null;
        }
      }
    });
  }

}