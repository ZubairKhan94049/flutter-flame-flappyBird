import 'package:brick_breaker/ui/game/assets.dart';
import 'package:brick_breaker/ui/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'game_over_viewmodel.dart';

class GameOverView extends StackedView<GameOverViewModel> {
  static const String id = 'GameOverView';
  final FlappyBirdGame game;
  const GameOverView({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GameOverViewModel viewModel,
    Widget? child,
  ) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Score : ${game.bird.score}",
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Game',
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
              onPressed: onRestart,
              child: const Text(
                "Restart",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('GameOverView');
    game.resumeEngine();
  }

  @override
  GameOverViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GameOverViewModel();
}
