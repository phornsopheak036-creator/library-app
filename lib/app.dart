import 'package:flutter/material.dart';
import 'package:num_library/core/routes/app_routes.dart';
import 'package:num_library/core/theme/app_theme.dart';

class ReadDailyApp extends StatelessWidget {
  const ReadDailyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Read-daily',
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
