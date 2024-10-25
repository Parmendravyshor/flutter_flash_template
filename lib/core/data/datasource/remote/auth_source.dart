import '../../../domain/usecases/auth_params.dart';
import '../../../error/exceptions.dart';

class UserNotFoundAuthException extends AuthException {}

class BadCredentialsAuthException extends AuthException {}

class EmailAlreadyInUseAuthException extends AuthException {}

/// This class provides basic starting point for any kind of [AuthSource]
/// Any class that implements has to implement their own signup method
/// to become an [AuthSource]. When user is successfully created on remote,
/// this will return [UserCredentials] on success or throw [Exception]
/// finishSignup step which actually creates user on Triffic Servers will use
/// the credentials from local disk after this is called.
abstract class AuthSource {
  Future<void> emailSignup(EmailAuthParams params);
}
