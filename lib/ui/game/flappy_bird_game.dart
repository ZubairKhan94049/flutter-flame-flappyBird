import 'dart:async';

import 'package:brick_breaker/ui/game/components/background.dart';
import 'package:brick_breaker/ui/game/components/bird.dart';
import 'package:brick_breaker/ui/game/components/ground.dart';
import 'package:brick_breaker/ui/game/components/pipe_group.dart';
import 'package:brick_breaker/ui/game/config.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }

  @override
  void onTap() {
    bird.fly();
    super.onTap();
  }
}
