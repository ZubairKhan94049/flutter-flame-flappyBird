import 'dart:async';
import 'dart:math';

import 'package:brick_breaker/enums/pipe_position.dart';
import 'package:brick_breaker/ui/game/assets.dart';
import 'package:brick_breaker/ui/game/components/pipe.dart';
import 'package:brick_breaker/ui/game/config.dart';
import 'package:brick_breaker/ui/game/flappy_bird_game.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  final _random = Random();
  PipeGroup();

  @override
  FutureOr<void> onLoad() {
    position.x = gameRef.size.x;
    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);

    addAll(
      [
        Pipe(height: centerY - spacing / 2, pipePosition: PipePosition.top),
        Pipe(
          height: heightMinusGround - (centerY + spacing / 2),
          pipePosition: PipePosition.bottom,
        ),
      ],
    );
  }

  @override
  void update(double dt) {
    position.x -= Config.gameSpeed * dt;
    super.update(dt);
    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.point);
  }
}
