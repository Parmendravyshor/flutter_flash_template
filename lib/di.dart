import 'package:flutter_flash_template/feature/register/domain/usecases/email_signup.dart';
import 'package:kiwi/kiwi.dart';

import 'core/data/datasource/remote/auth_source.dart';
import 'core/data/datasource/local/database_manager.dart';
import 'core/data/datasource/local/hive_services.dart';
import 'core/data/datasource/local/shared_preferences_service.dart';
import 'core/data/datasource/local/sqlite_service.dart';
import 'core/data/datasource/user_service.dart';
import 'core/data/repositories/user_repositories.dart';
import 'core/domain/repositories/user_repository.dart';
import 'feature/register/presentation/bloc/register_bloc.dart';

Future<void> registerDependencyInjection() async {
  var container = KiwiContainer();

  await _registerDataSources(container);
  _registerRepositories(container);
  _registerUseCases(container);
  _registerBloc(container);
  _registerDatabaseManager(container);
}

void _registerBloc(KiwiContainer container) {
  container.registerFactory((c) => RegisterBloc(c.resolve()));
}

void _registerUseCases(KiwiContainer container) {
  container.registerFactory((c) => EmailSignup(c.resolve()));
}

void _registerRepositories(KiwiContainer container) {
  container.registerFactory<UserRepository>(
      (c) => UserRepositoryImpl(c.resolve(), c.resolve()));
}

_registerDataSources(KiwiContainer container) {
  container.registerFactory<AuthSource>((c) => UserService(c.resolve()));
}

void _registerDatabaseManager(KiwiContainer container) {
  container.registerFactory((c) => HiveService());
  container.registerFactory((c) => SQLiteService());
  container.registerFactory((c) => SharedPreferencesService());

  container.registerSingleton((c) => DatabaseManager());
}
