import '../../domain/usecases/auth_params.dart';
import 'remote/auth_source.dart';
import 'local/database_manager.dart';

class UserService extends AuthSource {
  final DatabaseManager databaseManager;

  UserService(this.databaseManager);

  @override
  Future<void> emailSignup(EmailAuthParams params) async {
    try {
      /// write code here
    } catch (e) {
      rethrow;
    }
  }
}
