import 'package:flutter/material.dart';

import '../bounce_boll.dart';

class MainMenuOverlay extends StatelessWidget {
  const MainMenuOverlay(this.game, {super.key});

  final BounceBoll game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Bounce Boll',
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 120),
                ElevatedButton(
                  onPressed: () async => game.startGame(),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      const Size(100, 50),
                    ),
                    textStyle: MaterialStateProperty.all(
                        Theme.of(context).textTheme.titleLarge),
                  ),
                  child: const Text('Start'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
