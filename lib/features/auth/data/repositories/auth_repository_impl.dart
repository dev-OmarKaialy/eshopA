import 'package:dartz/dartz.dart';
import 'package:eshop_a/core/api/error/error_handeler.dart';
import 'package:eshop_a/core/api/error/failure.dart';
import 'package:eshop_a/features/auth/data/datasources/remote_auth_datasource.dart';
import 'package:eshop_a/features/auth/data/models/user_model.dart';
import 'package:eshop_a/features/auth/domain/repositories/auth_repository.dart';
import 'package:eshop_a/features/auth/domain/usecases/login_usecase.dart';
import 'package:eshop_a/features/auth/domain/usecases/register_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoriesImpl with HandlingException implements AuthRepository {
  final RemoteAuthDatasource remoteDatasource;

  const AuthRepositoriesImpl({required this.remoteDatasource});

  @override
  Future<Either<Failure, UserModel>> register({required RegisterParams params}) {
    return wrapHandlingException<UserModel>(
      tryCall: () async {
        final response = await remoteDatasource.register(body: params.getBody());
        return response.result;
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> login({required LoginParams params}) {
    return wrapHandlingException<UserModel>(
      tryCall: () async {
        final response = await remoteDatasource.login(body: params.getBody());
        return response.result;
      },
    );
  }
}
