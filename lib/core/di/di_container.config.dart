// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/datasources/remote_auth_datasource.dart' as _i229;
import '../../features/auth/data/repositories/auth_repository_impl.dart' as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../api/dio/api_client.dart' as _i668;
import '../api/dio/logger_interceptor.dart' as _i79;
import 'di_container.dart' as _i198;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.lazySingleton<_i79.LoggerInterceptor>(() => _i79.LoggerInterceptor());
  gh.lazySingleton<_i361.Dio>(() => appModule.dio);
  gh.lazySingleton<_i668.ApiClient>(() => _i668.ApiClient(
        gh<_i361.Dio>(),
        loggingInterceptor: gh<_i79.LoggerInterceptor>(),
      ));
  gh.factory<_i229.RemoteAuthDatasource>(() => _i229.RemoteAuthDatasource(gh<_i668.ApiClient>()));
  gh.lazySingleton<_i787.AuthRepository>(() => _i153.AuthRepositoriesImpl(remoteDatasource: gh<_i229.RemoteAuthDatasource>()));
  gh.factory<_i941.RegisterUsecase>(() => _i941.RegisterUsecase(repository: gh<_i787.AuthRepository>()));
  gh.factory<_i188.LoginUsecase>(() => _i188.LoginUsecase(repository: gh<_i787.AuthRepository>()));
  gh.factory<_i117.AuthCubit>(() => _i117.AuthCubit(
        registerUsecase: gh<_i941.RegisterUsecase>(),
        loginUsecase: gh<_i188.LoginUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i198.AppModule {}
