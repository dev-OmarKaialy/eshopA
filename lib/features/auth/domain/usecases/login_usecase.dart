import 'package:dartz/dartz.dart';
import 'package:eshop_a/core/api/error/failure.dart';
import 'package:eshop_a/core/helper/src/typedef.dart';
import 'package:eshop_a/core/usecases/usecase.dart';
import 'package:eshop_a/features/auth/data/models/user_model.dart';
import 'package:eshop_a/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase implements UseCase<UserModel, LoginParams> {
  final AuthRepository repository;

  const LoginUsecase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(LoginParams params) {
    return repository.login(params: params);
  }
}

class LoginParams implements UseCaseParams {
  final String userName;
  final String password;

  const LoginParams({
    required this.userName,
    required this.password,
  });

  @override
  BodyMap getBody() => {
        'userName': userName,
        'password': password,
      };

  @override
  QueryParams? getParams() => {};
}
