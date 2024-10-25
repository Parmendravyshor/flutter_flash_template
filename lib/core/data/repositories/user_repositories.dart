import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_flash_template/core/data/datasource/data_source_view.dart';
import 'package:flutter_flash_template/core/domain/usecases/auth_params.dart';

import '../../domain/repositories/user_repository.dart';
import '../../error/falilure.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthSource authSource;

  final DatabaseManager databaseManager;

  UserRepositoryImpl(
    this.authSource,
    this.databaseManager,
  );

  @override
  Future<Either<Failure, void>> emailSignup(EmailAuthParams params) async {
    try {
      await authSource.emailSignup(params);
      return const Right(Void);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
