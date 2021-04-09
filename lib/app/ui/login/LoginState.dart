part of 'LoginCubit.dart';

enum LoginStatus { initial, loading, success, error }

class LoginState extends Equatable {
  final LoginStatus status;
  final String? token;
  final String? error;

  const LoginState._(
      {this.status = LoginStatus.initial, this.token, this.error});

  const LoginState.initial() : this._();
  const LoginState.loading() : this._(status: LoginStatus.loading);
  const LoginState.success(String token)
      : this._(status: LoginStatus.success, token: token);
  const LoginState.error(String error)
      : this._(status: LoginStatus.error, error: error);

  @override
  List<Object?> get props => [status];
}
