import 'package:dartz/dartz.dart';

import '../../error/falilure.dart';
import '../usecases/auth_params.dart';

/// This Repository will handle functions related to gettting user account
/// and logout user and more
///
abstract class UserRepository<T> {
  Future<Either<Failure, void>> emailSignup(EmailAuthParams params);
}
