import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class Socket {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  Future<PusherChannelsFlutter> init() async {
    print(dotenv.env['app_id']);
    try {
      await pusher.init(
          apiKey: dotenv.env['key']!, cluster: dotenv.env['cluster']!);
      await pusher.connect();
    } catch (e) {
      print("ERROR: $e");
    }

    return pusher;
  }
}