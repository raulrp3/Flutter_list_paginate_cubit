part of 'AuthenticationCubit.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticaded }

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;

  const AuthenticationState._({this.status = AuthenticationStatus.unknown});

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(String user)
      : this._(status: AuthenticationStatus.authenticated);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticaded);

  @override
  List<Object?> get props => [status];
}
