// lib/data/repositories/push_notification_repository.dart
import '../datasource/remote/push_notifiaction_data_source.dart';

class PushNotificationRepository {
  final PushNotificationDataSource dataSource;

  PushNotificationRepository(this.dataSource);

  Future<String?> getDeviceToken() {
    return dataSource.getDeviceToken();
  }

  // Other repository methods if required
}
