import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'core/network/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External dependencies
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);

  // Network - Dio clients
  sl.registerLazySingleton<Dio>(
    () => DioClient.createPublicDio(),
    instanceName: 'PublicDio',
  );

  sl.registerLazySingleton<Dio>(
    () => DioClient.createPrivateDio(
      () async {
        return sl<SharedPreferences>().getString('access_token');
      },
    ),
    instanceName: 'PrivateDio',
  );

  // Data sources
  // sl.registerLazySingleton<AuthRemoteDataSource>(
  //   () => AuthRemoteDataSourceImpl(sl<Dio>(instanceName: 'PublicDio'))
  // );

  // sl.registerLazySingleton<UserRemoteDataSource>(
  //   () => UserRemoteDataSourceImpl(sl<Dio>(instanceName: 'PrivateDio'))
  // );

  // Repositories
  // sl.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(sl<AuthRemoteDataSource>())
  // );

  // Use cases
  // sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  // sl.registerLazySingleton(() => GetUserProfileUseCase(sl<UserRepository>()));

  // Blocs/Cubits
  // sl.registerFactory(() => AuthBloc(sl<LoginUseCase>()));
}
