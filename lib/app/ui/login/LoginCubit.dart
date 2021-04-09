import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_cubit/app/domain/repository/AuthenticationRepository.dart';

part 'LoginState.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginCubit(this._authenticationRepository) : super(LoginState.initial());

  Future<void> login(String username, String password) async {
    emit(LoginState.loading());
    try {
      final token = await _authenticationRepository.login(username, password);
      emit(LoginState.success(token));
    } on Exception catch (error) {
      emit(LoginState.error('$error'));
    }
  }
}
