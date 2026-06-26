import 'package:app_fixed/Business_logic/cubit/products_cupit/products_cubit.dart';
import 'package:app_fixed/core/constants/strings.dart';
import 'package:app_fixed/Business_logic/cubit/login_cupit/login_cupit_cubit.dart';
import 'package:app_fixed/data/model/products.dart';
import 'package:app_fixed/core/di/injection.dart';
import 'package:app_fixed/presentatios/views/auth/SignUp.dart';
import 'package:app_fixed/presentatios/views/auth/forget.dart';
import 'package:app_fixed/presentatios/views/auth/login.dart';
import 'package:app_fixed/presentatios/views/details/detailsScreen.dart';
import 'package:app_fixed/presentatios/views/home/homeScreen.dart';
import 'package:app_fixed/presentatios/views/onboarding/Onboarding.dart';
import 'package:app_fixed/presentatios/views/splash/splash_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashPage());

      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCupitCubit>(),
            child: Login(),
          ),
        );

      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ProductsCubit>(),
            child: Homescreen(),
          ),
        );

      case forgetScreen:
        return MaterialPageRoute(builder: (_) => Forget());

      case signScreen:
        return MaterialPageRoute(builder: (_) => SignUp());
      case onboarding:
        return MaterialPageRoute(builder: (_) => Onboarding());

      case detailScreen:
        final products = settings.arguments as Product;

        return MaterialPageRoute(
          builder: (_) => DetailsScreen(products: products),
        );
    }
    return null;
  }
}
