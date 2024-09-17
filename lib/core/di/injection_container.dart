import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Data sources
  sl.registerLazySingleton<LocalDeviceDataSource>(
      () => LocalDeviceDataSource());

  // Repository
  sl.registerLazySingleton<DeviceRepository>(
      () => DeviceRepositoryImpl(localDeviceDataSource: sl()));

  // Use cases
  sl.registerLazySingleton(() => DeviceUseCase(sl()));

  // Cubit
  sl.registerFactory(() => DeviceCubit(deviceUseCase: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
