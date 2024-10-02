import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebasemessaging = FirebaseMessaging.instance;
  Future<void> initnotification() async {
    await _firebasemessaging.requestPermission();
    final fcmToken = await _firebasemessaging.getToken();
    print(fcmToken);
  }
}

Future<void> recordCustomEvent() async {
  final event = AnalyticsEvent('PasswordReset');

  event.customProperties
    ..addStringProperty('Channel', 'SMS')
    ..addBoolProperty('Successful', true);

  // You can also add the properties one by one like the following
  event.customProperties.addIntProperty('ProcessDuration', 792);
  event.customProperties.addDoubleProperty('doubleKey', 120.3);

  await Amplify.Analytics.recordEvent(event: event);
}

