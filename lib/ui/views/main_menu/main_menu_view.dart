import 'package:brick_breaker/ui/game/assets.dart';
import 'package:brick_breaker/ui/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'main_menu_viewmodel.dart';

class MainMenuView extends StackedView<MainMenuViewModel> {
  static const String id = 'MainMenuView';
  final FlappyBirdGame game;
  const MainMenuView({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MainMenuViewModel viewModel,
    Widget? child,
  ) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove('MainMenuView');
          game.resumeEngine();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.fill,
            ),
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }

  @override
  MainMenuViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainMenuViewModel();
}
