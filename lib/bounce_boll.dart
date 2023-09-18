import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import 'managers/managers.dart';

class BounceBoll extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
  BounceBoll({super.children});

  // final World _world = World();
  // LevelManager levelManager = LevelManager();
  GameManager gameManager = GameManager();
  // int screenBufferSpace = 300;
  // ObjectManager objectManager = ObjectManager();

  @override
  Future<void> onLoad() async {
    // await add(_world);

    await add(gameManager);

    overlays.add('gameOverlay');

    // await add(levelManager);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameManager.isIntro) {
      overlays.add('mainMenuOverlay');
      return;
    }

    if (gameManager.isPlaying) {
      checkLevelUp();

      // final Rect worldBounds = Rect.fromLTRB(
      //   0,
      //   camera.position.y - screenBufferSpace,
      //   camera.gameSize.x,
      //   camera.position.y + _world.size.y,
      // );
      // camera.worldBounds = worldBounds;
    }
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 241, 247, 249);
  }

  void initializeGameStart() {
    // setCharacter();

    gameManager.reset();

    // if (children.contains(objectManager)) objectManager.removeFromParent();

    // levelManager.reset();

    // player.reset();
    // camera.worldBounds = Rect.fromLTRB(
    //   0,
    //   -_world.size.y,
    //   camera.gameSize.x,
    //   _world.size.y + screenBufferSpace,
    // );
    // camera.followComponent(player);

    // player.resetPosition();

    // // Add a Player to the game: Reset Dash's position back to the start

    // objectManager = ObjectManager(
    //     minVerticalDistanceToNextPlatform: levelManager.minDistance,
    //     maxVerticalDistanceToNextPlatform: levelManager.maxDistance);

    // add(objectManager);

    // objectManager.configure(levelManager.level, levelManager.difficulty);
  }

  void startGame() {
    initializeGameStart();
    gameManager.state = GameState.playing;
    overlays.remove('mainMenuOverlay');
  }

  void resetGame() {
    startGame();
    overlays.remove('gameOverOverlay');
  }

  void togglePauseState() {
    if (paused) {
      resumeEngine();
    } else {
      pauseEngine();
    }
  }

  void checkLevelUp() {
    // if (levelManager.shouldLevelUp(gameManager.score.value)) {
    //   levelManager.increaseLevel();

    //   objectManager.configure(levelManager.level, levelManager.difficulty);

    //   player.setJumpSpeed(levelManager.jumpSpeed);
    // }
  }
}
