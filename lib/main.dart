import 'package:brick_breaker/ui/game/flappy_bird_game.dart';
import 'package:brick_breaker/ui/views/game_over/game_over_view.dart';
import 'package:brick_breaker/ui/views/main_menu/main_menu_view.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:brick_breaker/app/app.bottomsheets.dart';
import 'package:brick_breaker/app/app.dialogs.dart';
import 'package:brick_breaker/app/app.locator.dart';
import 'package:brick_breaker/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  final game = FlappyBirdGame();
  runApp(
    GameWidget(
      initialActiveOverlays: const [MainMenuView.id],
      overlayBuilderMap: {
        'MainMenuView': (context, _) => MainMenuView(game: game),
        'GameOverView': (context, _) => GameOverView(game: game),
      },
      game: game,
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
