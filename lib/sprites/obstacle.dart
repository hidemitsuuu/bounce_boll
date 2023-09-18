import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../bounce_boll.dart';

abstract class Obstacle<T> extends SpriteGroupComponent<T>
    with HasGameRef<BounceBoll>, CollisionCallbacks {
  final hitbox = RectangleHitbox();
  bool isMoving = false;

  double direction = 1;
  final Vector2 _velocity = Vector2.zero();
  double speed = 35;

  Obstacle({
    super.position,
  }) : super(
          size: Vector2.all(100),
          priority: 2,
        );

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    await add(hitbox);

    final int rand = Random().nextInt(100);
    if (rand > 80) isMoving = true;
  }

  void _move(double dt) {
    if (!isMoving) return;

    final double gameWidth = gameRef.size.x;

    if (position.x <= 0) {
      direction = 1;
    } else if (position.x >= gameWidth - size.x) {
      direction = -1;
    }

    _velocity.x = direction * speed;

    position += _velocity * dt;
  }

  @override
  void update(double dt) {
    _move(dt);
    super.update(dt);
  }
}

enum NormalObstacleState { only }

class NormalObstacle extends Obstacle<NormalObstacleState> {
  NormalObstacle({super.position});

  final Map<String, Vector2> spriteOptions = {
    'obstacle_circle': Vector2(24, 24),
  };

  @override
  Future<void>? onLoad() async {
    var randSpriteIndex = Random().nextInt(spriteOptions.length);

    String randSprite = spriteOptions.keys.elementAt(randSpriteIndex);

    sprites = {
      NormalObstacleState.only: await gameRef.loadSprite('dummy_obstract.png')
    };

    current = NormalObstacleState.only;

    size = spriteOptions[randSprite]!;
    await super.onLoad();
  }
}
