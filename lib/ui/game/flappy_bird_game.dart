import 'dart:async';

import 'package:brick_breaker/ui/game/components/background.dart';
import 'package:brick_breaker/ui/game/components/bird.dart';
import 'package:brick_breaker/ui/game/components/ground.dart';
import 'package:brick_breaker/ui/game/components/pipe_group.dart';
import 'package:brick_breaker/ui/game/config.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  bool isHit = false;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
      score = buildScore(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score : 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Game',
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score : ${bird.score}';
  }

  @override
  void onTap() {
    bird.fly();
    super.onTap();
  }
}
