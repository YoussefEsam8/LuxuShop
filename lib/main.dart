import 'package:app_fixed/core/routing/app_router.dart';
import 'package:app_fixed/core/di/injection.dart';
import 'package:flutter/material.dart';

void main() {
  initGitIt();
  runApp(LuxuryShop(appRouter: AppRouter()));
}

class LuxuryShop extends StatelessWidget {
  const LuxuryShop({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LuxeShop',

      // theme: AppTheme.ligtTheme,
      themeMode: ThemeMode.light,
      onGenerateRoute: (settings) => appRouter.generateRoute(settings),
    );
  }
}
