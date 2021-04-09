import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_morty_cubit/app/data/ApiAuthenticationRepository.dart';
import 'package:rick_morty_cubit/app/data/ApiCharacterRepository.dart';
import 'package:rick_morty_cubit/app/data/ApiUserRepository.dart';
import 'package:rick_morty_cubit/app/data/DioHelper.dart';
import 'package:rick_morty_cubit/app/domain/repository/AuthenticationRepository.dart';
import 'package:rick_morty_cubit/app/domain/repository/CharacterRepository.dart';
import 'package:rick_morty_cubit/app/domain/repository/UserRepository.dart';
import 'package:rick_morty_cubit/app/ui/authentication/AuthenticationCubit.dart';
import 'package:rick_morty_cubit/app/ui/characters/CharactersCubit.dart';
import 'package:rick_morty_cubit/app/ui/login/LoginCubit.dart';
import 'package:rick_morty_cubit/config/Environment.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  static void setup(Environment environment) {
    getIt.registerSingleton<Dio>(DioHelper.build(environment.baseApiUrl));

    getIt.registerFactory<CharacterRepository>(
        () => ApiCharacterRepositoy(getIt<Dio>()));
    getIt.registerFactory<UserRepository>(() => ApiUserRepository());
    getIt.registerFactory<AuthenticationRepository>(
        () => ApiAuthenticationRepository());

    getIt.registerFactory<CharactersCubit>(
        () => CharactersCubit(getIt<CharacterRepository>()));
    getIt.registerFactory<AuthenticationCubit>(
        () => AuthenticationCubit(getIt<UserRepository>()));
    getIt.registerFactory<LoginCubit>(
        () => LoginCubit(getIt<AuthenticationRepository>()));
  }
}
