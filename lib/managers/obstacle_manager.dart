import 'dart:math';

import 'package:bounce_boll/sprites/obstacle.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../bounce_boll.dart';
import '../util/util.dart';

final Random _rand = Random();

class ObstacleManager extends Component with HasGameRef<BounceBoll> {
  ObstacleManager({
    this.minVerticalDistanceToNextPlatform = 200,
    this.maxVerticalDistanceToNextPlatform = 300,
  });

  double minVerticalDistanceToNextPlatform;
  double maxVerticalDistanceToNextPlatform;
  final probGen = ProbabilityGenerator();
  final List<Obstacle> _obstacles = [];

  @override
  void onMount() {
    super.onMount();

    var currentX = (gameRef.size.x.floor() / 2).toDouble() - 50;

    var currentY =
        gameRef.size.y - (_rand.nextInt(gameRef.size.y.floor()) / 3) - 50;

    for (var i = 0; i < 9; i++) {
      if (i != 0) {
        currentX = _generateNextX(48);
        currentY = _generateNextY(48);
      }
      _obstacles.add(
        NormalObstacle(position: Vector2(currentX, currentY)),
      );

      add(_obstacles[i]);
    }
  }

  @override
  void update(double dt) {
    debugPrint(_obstacles.length.toString());
    final topOfLowestPlatform = _obstacles.first.position.y + 48;

    super.update(dt);
  }

  // あとでちゃんと考える
  double _generateNextX(int platformWidth) {
    final previousPlatformXRange = Range(
      _obstacles.last.position.x,
      _obstacles.last.position.x + platformWidth,
    );

    double nextPlatformAnchorX;

    do {
      nextPlatformAnchorX =
          _rand.nextInt(gameRef.size.x.floor() - platformWidth).toDouble();
    } while (previousPlatformXRange.overlaps(
        Range(nextPlatformAnchorX, nextPlatformAnchorX + platformWidth)));

    return nextPlatformAnchorX;
  }

  // あとでちゃんと考える
  double _generateNextY(int platformHeight) {
    final currentHighestPlatformY = _obstacles.last.center.y + platformHeight;

    final distanceToNextY = minVerticalDistanceToNextPlatform.toInt() +
        _rand
            .nextInt((maxVerticalDistanceToNextPlatform -
                    minVerticalDistanceToNextPlatform)
                .floor())
            .toDouble();

    return currentHighestPlatformY - distanceToNextY;
  }
}
