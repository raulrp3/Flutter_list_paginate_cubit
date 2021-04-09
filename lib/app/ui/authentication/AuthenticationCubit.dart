import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubit/app/data/Prefs.dart';
import 'package:rick_morty_cubit/app/domain/repository/UserRepository.dart';

part 'AuthenticationState.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final UserRepository _userRepository;
  String? _token;

  AuthenticationCubit(this._userRepository)
      : super(AuthenticationState.unknown()) {
    Prefs.getToken().then(
      (value) {
        _token = value.isEmpty ? null : value;
        _checkStatus();
      },
    );
  }

  Future<void> loggedIn(String token) async {
    _token = token;
    Prefs.setToken(token);
    await _checkStatus();
  }

  Future<void> loggedOut() async {
    _token = null;
    Prefs.setToken('');
    await _checkStatus();
  }

  Future<void> _checkStatus() async {
    if (_token == null) {
      return Future.delayed(Duration(seconds: 1),
          () => emit(AuthenticationState.unauthenticated()));
    }

    final user = await _userRepository.getUser();
    if (user == null) {
      emit(AuthenticationState.unauthenticated());
    } else {
      emit(AuthenticationState.authenticated(user));
    }
  }
}
