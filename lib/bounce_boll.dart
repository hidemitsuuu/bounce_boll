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
  ObstacleManager obstacleManager = ObstacleManager();

  @override
  Future<void> onLoad() async {
    await add(gameManager);

    overlays.add('gameOverlay');
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
    }
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(255, 241, 247, 249);
  }

  void initializeGameStart() {
    gameManager.reset();

    if (children.contains(obstacleManager)) obstacleManager.removeFromParent();

    obstacleManager = ObstacleManager();

    add(obstacleManager);

    // obstacleManager.configure(levelManager.level, levelManager.difficulty);
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
