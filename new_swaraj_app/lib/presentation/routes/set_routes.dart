import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/HomePage.dart';
import '../screens/auth_section/Splash.dart';

// Define your route configuration in a separate class
class AppRoutes {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => Splash(),
      ),
      // GoRoute(
      //   path: '/details',
      //   builder: (BuildContext context, GoRouterState state) => DetailsPage(),
      // ),
    ],
  );
}
