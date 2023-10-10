import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

class Socket {
  init() async {
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

// try {
//   await pusher.init(
//     apiKey: API_KEY,
//     cluster: API_CLUSTER,
//     onConnectionStateChange: onConnectionStateChange,
//     onError: onError,
//     onSubscriptionSucceeded: onSubscriptionSucceeded,
//     onEvent: onEvent,
//     onSubscriptionError: onSubscriptionError,
//     onDecryptionFailure: onDecryptionFailure,
//     onMemberAdded: onMemberAdded,
//     onMemberRemoved: onMemberRemoved,
//     // authEndpoint: "<Your Authendpoint>",
//     // onAuthorizer: onAuthorizer
//   );
//   await pusher.subscribe(channelName: 'presence-chatbox');
//   await pusher.connect();
// } catch (e) {
//   print("ERROR: $e");
// }
}
