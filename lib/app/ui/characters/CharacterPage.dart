import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubit/app/ui/characters/CharactersCubit.dart';
import 'package:rick_morty_cubit/app/ui/characters/CharactersListView.dart';
import 'package:rick_morty_cubit/config/ServiceLocator.dart';

class CharacterPage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => CharacterPage());
  }

  @override
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CharactersCubit>()..loadCharacters(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Rick & Morty'),
          ),
          body: CharactersListView(),
        ),
      ),
    );
  }
}
