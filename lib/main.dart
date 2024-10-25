import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_flash_template/feature/register/presentation/theme/bloc/theme_event.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'core/data/datasource/local/database_manager.dart';
import 'core/route/app_routes.dart';
import 'di.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  DatabaseManager dbManager = DatabaseManager();
  await dbManager
      .initDatabases(); // Initialize Hive, SQLite, and SharedPreferences

  // Example: Store and retrieve data
  dbManager.storeDataInHive('username', 'Parmendra');
  dbManager.savePreference('isLoggedIn', 'true');
  // await Firebase.initializeApp();
  // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // await FirebaseMessaging.instance.setAutoInitEnabled(true);
  await registerDependencyInjection();
  // await FirebaseMessaging.instance.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp.router(
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            theme: theme,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Flash Template',
          );
        },
      ),
    );
  }
}
