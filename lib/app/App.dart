import 'package:flutter/material.dart';
import 'package:rick_morty_cubit/app/ui/characters/CharacterPage.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: const Color(0xFF13B9FF),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      ),
      onGenerateRoute: (_) => CharacterPage.route(),
    );
  }
}
