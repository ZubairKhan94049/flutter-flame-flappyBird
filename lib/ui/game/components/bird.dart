import 'dart:async';

import 'package:brick_breaker/ui/game/assets.dart';
import 'package:brick_breaker/enums/bird_movement.dart';
import 'package:brick_breaker/ui/game/config.dart';
import 'package:brick_breaker/ui/game/flappy_bird_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  // /
  Bird();
  int score = 0;
  @override
  Future<void> onLoad() async {
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    size = Vector2(50, 40);
    //Position in the center of screen vertically
    position = Vector2((gameRef.size.x / 2 - size.x / 2) / 4, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: birdMidFlap,
      BirdMovement.down: birdDownFlap,
      BirdMovement.up: birdUpFlap,
    };

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += Config.birdVelocity * dt;
    if (position.y < 1) {
      gameOver();
    }
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, Config.gravity), //Offset
        EffectController(duration: 0.5, curve: Curves.decelerate), // Controller
        onComplete: () => current = BirdMovement.down, // Callback
      ),
    );
    current = BirdMovement.up;
    FlameAudio.play(Assets.flying);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    debugPrint('Bird collided with $other');
    gameOver();
  }

  void gameOver() {
    FlameAudio.play(Assets.collision);
    gameRef.overlays.add(
      'GameOverView',
    );
    gameRef.pauseEngine();
    game.isHit = true;
  }

  void reset() {
    // position = Vector2(50, gameRef.size.y/2 - size.y / 2);
    position = Vector2((gameRef.size.x / 2 - size.x / 2) / 4, gameRef.size.y / 2 - size.y / 2);
    score = 0;
  }
}
