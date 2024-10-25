import 'package:flutter_flash_template/welcome_template.dart';
import 'package:go_router/go_router.dart';

import '../../feature/register/presentation/signup.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeTemplate(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return RegisterScreen(id: id);
      },
    ),
  ],
);
