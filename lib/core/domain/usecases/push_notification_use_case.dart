// lib/domain/usecases/push_notification_use_case.dart

import '../../data/repositories/push_notification_repositories.dart';

class PushNotificationUseCase {
  final PushNotificationRepository repository;

  PushNotificationUseCase(this.repository);

  Future<String?> getDeviceToken() {
    return repository.getDeviceToken();
  }

  // Other use cases can be added here
}
