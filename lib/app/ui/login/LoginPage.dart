import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubit/app/ui/login/LoginCubit.dart';
import 'package:rick_morty_cubit/app/ui/login/LoginFormView.dart';
import 'package:rick_morty_cubit/config/ServiceLocator.dart';

class LoginPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Iniciar sesión'),
        ),
        body: LoginFormView(),
      ),
    );
  }
}
