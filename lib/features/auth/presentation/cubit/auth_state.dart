part of 'auth_cubit.dart';

class AuthState {
  final CubitStatus status;
  final Failure? failure;

  const AuthState({
    this.status = CubitStatus.initial,
    this.failure,
  });

  AuthState copyWith({
    CubitStatus? status,
    Failure? failure,
  }) {
    return AuthState(
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
