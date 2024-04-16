import 'dart:async';

import 'package:brick_breaker/ui/game/assets.dart';
import 'package:brick_breaker/ui/game/flappy_bird_game.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  @override
  Future<FutureOr<void>> onLoad() async {
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
