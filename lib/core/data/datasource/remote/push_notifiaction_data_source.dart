// lib/data/datasources/push_notification_data_source.dart
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationDataSource {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getDeviceToken() async {
    return await _firebaseMessaging.getToken();
  }

  // Add any additional methods if required
}
