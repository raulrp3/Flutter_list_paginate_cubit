import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubit/app/ui/authentication/AuthenticationCubit.dart';
import 'package:rick_morty_cubit/app/ui/login/LoginPage.dart';
import 'package:rick_morty_cubit/config/ServiceLocator.dart';

class AuthenticationWidget extends StatefulWidget {
  final Widget child;

  const AuthenticationWidget({required this.child});

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => AuthenticationWidget(
              child: LoginPage(),
            ));
  }

  @override
  _AuthenticationWidgetState createState() => _AuthenticationWidgetState();
}

class _AuthenticationWidgetState extends State<AuthenticationWidget> {
  Widget _child = LoginPage();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthenticationCubit>(),
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthenticationStatus.authenticated:
              _child = widget.child;
              setState(() {});
              print('Authenticated: ${_child.runtimeType}');
              break;
            case AuthenticationStatus.unauthenticaded:
              print('Unauthenticated: ${_child.runtimeType}');
              break;
            default:
              break;
          }
        },
        child: _child,
      ),
    );
  }
}
