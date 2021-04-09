import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty_cubit/app/App.dart';
import 'package:rick_morty_cubit/app/AppBlocObserver.dart';
import 'package:rick_morty_cubit/config/Config.dart';
import 'package:rick_morty_cubit/config/Environment.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  Config.setup(BuildVariant.main);
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
