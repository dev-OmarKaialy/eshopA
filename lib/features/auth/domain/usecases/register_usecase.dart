import 'package:dartz/dartz.dart';
import 'package:eshop_a/core/api/error/failure.dart';
import 'package:eshop_a/core/helper/src/typedef.dart';
import 'package:eshop_a/core/usecases/usecase.dart';
import 'package:eshop_a/features/auth/data/models/user_model.dart';
import 'package:eshop_a/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUsecase implements UseCase<UserModel, RegisterParams> {
  final AuthRepository repository;

  const RegisterUsecase({required this.repository});

  @override
  Future<Either<Failure, UserModel>> call(RegisterParams params) {
    return repository.register(params: params);
  }
}

class RegisterParams implements UseCaseParams {
  final String fullName;
  final String userName;
  final String email;
  final String password;
  final DateTime birthDate;

  const RegisterParams({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.password,
    required this.birthDate,
  });

  @override
  BodyMap getBody() => {
        'fullName': fullName,
        'userName': userName,
        'email': email,
        'password': password,
        'birthDate': birthDate.toIso8601String(),
      };

  @override
  QueryParams? getParams() => {};
}
