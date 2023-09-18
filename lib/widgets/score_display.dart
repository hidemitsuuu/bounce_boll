import 'package:flutter/material.dart';

import '../bounce_boll.dart';

class ScoreDisplay extends StatelessWidget {
  const ScoreDisplay({super.key, required this.game});

  final BounceBoll game;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: game.gameManager.score,
      builder: (context, value, child) {
        return Text('Score: $value',
            style: Theme.of(context).textTheme.displaySmall);
      },
    );
  }
}
