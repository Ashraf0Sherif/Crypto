import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/logic/auth_cubit.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/logic/home_cubit.dart';
import '../local/hive/hive_service.dart';
import '../local/secure_storage_service.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Hive Storage
  getIt.registerLazySingleton<HiveService>(() => HiveService());

  // Secure Storage
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );

  // Dio
  Dio dio = DioFactory.getDio();

  // ApiServices
  getIt.registerLazySingleton<ApiServices>(() => ApiServices(dio));

  // Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt(), getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // Auth
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
}
