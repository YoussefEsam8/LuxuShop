import 'package:app_fixed/Business_logic/cubit/category_cupit/category_cubit.dart';
import 'package:app_fixed/Business_logic/cubit/products_cupit/products_cubit.dart';
import 'package:app_fixed/core/routing/app_router.dart';
import 'package:app_fixed/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initGitIt();

  runApp(LuxuryShop(appRouter: AppRouter()));
}

class LuxuryShop extends StatelessWidget {
  const LuxuryShop({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProductsCubit>()..getAllProducts()),
        BlocProvider(create: (_) => getIt<CategoryCupit>()..getAllCategories()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LuxeShop',

        // theme: AppTheme.ligtTheme,
        themeMode: ThemeMode.light,

        onGenerateRoute: (settings) => appRouter.generateRoute(settings),
      ),
    );
  }
}
