import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubit/app/ui/authentication/AuthenticationCubit.dart';
import 'package:rick_morty_cubit/app/ui/login/LoginCubit.dart';

class LoginFormView extends StatefulWidget {
  @override
  _LoginFormViewState createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<LoginFormView> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
            ),
          );
        }

        if (state.status == LoginStatus.success) {
          context.read<AuthenticationCubit>().loggedIn(state.token!);
        }
      },
      builder: (context, state) => Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  validator: _requiredValidator,
                  onSaved: (value) => username = value,
                  decoration:
                      const InputDecoration(hintText: 'Nombre de usuario'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  validator: _requiredValidator,
                  onSaved: (value) => password = value,
                  decoration: const InputDecoration(hintText: 'Contraseña'),
                ),
                const SizedBox(height: 16),
                MaterialButton(
                  minWidth: double.infinity,
                  height: 40,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Iniciar sesión'),
                  onPressed:
                      state.status == LoginStatus.loading ? null : _doLogin,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _requiredValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Campo Obligatorio';
    }
    return null;
  }

  void _doLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      context.read<LoginCubit>().login(username!, password!);
    }
  }
}
