// import 'package:shared_preferences/shared_preferences.dart';
// import 'core/network/dio_client.dart';

// void init() async {
//   final prefs = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => prefs);

//   // ✅ Public Dio (dùng ngay)
//   sl.registerLazySingleton<Dio>(() => DioClient.createPublicDio(), instanceName: 'PublicDio');

//   // ✅ Private Dio (dùng với token)
//   sl.registerLazySingleton<Dio>(() => DioClient.createPrivateDio(() async {
//     return sl<SharedPreferences>().getString('access_token');
//   }), instanceName: 'PrivateDio');

//   // Inject data source với đúng Dio
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//       () => AuthRemoteDataSourceImpl(sl<Dio>(instanceName: 'PublicDio')));

//   sl.registerLazySingleton<UserRemoteDataSource>(
//       () => UserRemoteDataSourceImpl(sl<Dio>(instanceName: 'PrivateDio')));
// }
