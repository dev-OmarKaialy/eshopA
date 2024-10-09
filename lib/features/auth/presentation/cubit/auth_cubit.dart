import 'package:eshop_a/core/api/error/failure.dart';
import 'package:eshop_a/core/config/cubit_status.dart';
import 'package:eshop_a/features/auth/domain/usecases/login_usecase.dart';
import 'package:eshop_a/features/auth/domain/usecases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final RegisterUsecase _registerUsecase;
  final LoginUsecase _loginUsecase;

  AuthCubit({
    required RegisterUsecase registerUsecase,
    required LoginUsecase loginUsecase,
  })  : _registerUsecase = registerUsecase,
        _loginUsecase = loginUsecase,
        super(const AuthState());

  void register(RegisterParams params) async {
    emit(state.copyWith(status: CubitStatus.loading));

    final result = await _registerUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(status: CubitStatus.failure, failure: l)),
      (r) async {
        // TODO: save token to storage
        emit(state.copyWith(status: CubitStatus.success));
      },
    );
  }

  void login(LoginParams params) async {
    emit(state.copyWith(status: CubitStatus.loading));

    final result = await _loginUsecase(params);

    result.fold(
      (l) => emit(state.copyWith(status: CubitStatus.failure, failure: l)),
      (r) async {
        // TODO: save token to storage
        emit(state.copyWith(status: CubitStatus.success));
      },
    );
  }
}
