import 'package:ecommerce_app_huma_volve/core/di/service_locator.dart';
import 'package:ecommerce_app_huma_volve/core/routes/app_routing.dart';
import 'package:flutter/material.dart';

import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItsetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouting,
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // home: const SplashScreen(),
    );
  }
}
