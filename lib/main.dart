import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'bounce_boll.dart';
import 'util/util.dart';
import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bounce Boll',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

final Game game = BounceBoll();

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GameWidget(
        game: game,
        overlayBuilderMap: <String, Widget Function(BuildContext, Game)>{
          'gameOverlay': (context, game) => GameOverlay(game as BounceBoll),
          'mainMenuOverlay': (context, game) =>
              MainMenuOverlay(game as BounceBoll),
          'gameOverOverlay': (context, game) =>
              GameOverOverlay(game as BounceBoll),
        },
      ),
    );
  }
}
