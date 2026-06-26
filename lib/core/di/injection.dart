import 'package:app_fixed/Business_logic/cubit/login_cupit/login_cupit_cubit.dart';
import 'package:app_fixed/Business_logic/cubit/products_cupit/products_cubit.dart';
import 'package:app_fixed/data/repository/products_rebository.dart';
import 'package:app_fixed/data/repository/users_rebository.dart';
import 'package:app_fixed/data/services/DioFactory.dart';
import 'package:app_fixed/data/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGitIt() {
  getIt.registerLazySingleton<Dio>(() => DioFactory().setupDio());
  getIt.registerLazySingleton<WebServieces>(() => WebServieces(getIt<Dio>()));
  getIt.registerLazySingleton<Productsrebository>(
    () => Productsrebository(getIt()),
  );
  getIt.registerLazySingleton<UsersRebository>(
    () => UsersRebository(loginServices: getIt<WebServieces>()),
  );

  getIt.registerFactory<LoginCupitCubit>(
    () => LoginCupitCubit(getIt<UsersRebository>()),
  );

  getIt.registerFactory<ProductsCubit>(
    () => ProductsCubit(getIt<Productsrebository>()),
  );
}
