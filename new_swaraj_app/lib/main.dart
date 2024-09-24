import 'package:flutter/material.dart';
import 'package:new_swaraj_app/presentation/routes/set_routes.dart';
import 'package:new_swaraj_app/core/theme/theam_data.dart';
void  main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SwarajFinPro',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      routerConfig: AppRoutes.router,
    );
  }
}
