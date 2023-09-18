import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bounce_boll.dart';
import 'widgets.dart';

class GameOverlay extends HookWidget {
  const GameOverlay(this.game, {super.key});

  final BounceBoll game;

  @override
  Widget build(BuildContext context) {
    final isPaused = useState(false);

    return Material(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScoreDisplay(game: game),
                  ElevatedButton(
                    child: isPaused.value
                        ? const Icon(
                            Icons.play_arrow,
                            size: 48,
                          )
                        : const Icon(
                            Icons.pause,
                            size: 48,
                          ),
                    onPressed: () {
                      game.togglePauseState();
                      isPaused.value = !isPaused.value;
                    },
                  ),
                ],
              ),
            ),
            if (isPaused.value)
              const Expanded(
                child: Icon(
                  Icons.pause_circle,
                  size: 144.0,
                  color: Colors.black12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
