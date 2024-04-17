// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:brick_breaker/ui/game/flappy_bird_game.dart' as _i7;
import 'package:brick_breaker/ui/views/game_over/game_over_view.dart' as _i5;
import 'package:brick_breaker/ui/views/home/home_view.dart' as _i2;
import 'package:brick_breaker/ui/views/main_menu/main_menu_view.dart' as _i4;
import 'package:brick_breaker/ui/views/startup/startup_view.dart' as _i3;
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const mainMenuView = '/main-menu-view';

  static const gameOverView = '/game-over-view';

  static const all = <String>{
    homeView,
    startupView,
    mainMenuView,
    gameOverView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.mainMenuView,
      page: _i4.MainMenuView,
    ),
    _i1.RouteDef(
      Routes.gameOverView,
      page: _i5.GameOverView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.MainMenuView: (data) {
      final args = data.getArgs<MainMenuViewArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.MainMenuView(key: args.key, game: args.game),
        settings: data,
      );
    },
    _i5.GameOverView: (data) {
      final args = data.getArgs<GameOverViewArguments>(nullOk: false);
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.GameOverView(key: args.key, game: args.game),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MainMenuViewArguments {
  const MainMenuViewArguments({
    this.key,
    required this.game,
  });

  final _i6.Key? key;

  final _i7.FlappyBirdGame game;

  @override
  String toString() {
    return '{"key": "$key", "game": "$game"}';
  }

  @override
  bool operator ==(covariant MainMenuViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.game == game;
  }

  @override
  int get hashCode {
    return key.hashCode ^ game.hashCode;
  }
}

class GameOverViewArguments {
  const GameOverViewArguments({
    this.key,
    required this.game,
  });

  final _i6.Key? key;

  final _i7.FlappyBirdGame game;

  @override
  String toString() {
    return '{"key": "$key", "game": "$game"}';
  }

  @override
  bool operator ==(covariant GameOverViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.game == game;
  }

  @override
  int get hashCode {
    return key.hashCode ^ game.hashCode;
  }
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainMenuView({
    _i6.Key? key,
    required _i7.FlappyBirdGame game,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mainMenuView,
        arguments: MainMenuViewArguments(key: key, game: game),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGameOverView({
    _i6.Key? key,
    required _i7.FlappyBirdGame game,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.gameOverView,
        arguments: GameOverViewArguments(key: key, game: game),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainMenuView({
    _i6.Key? key,
    required _i7.FlappyBirdGame game,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.mainMenuView,
        arguments: MainMenuViewArguments(key: key, game: game),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGameOverView({
    _i6.Key? key,
    required _i7.FlappyBirdGame game,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.gameOverView,
        arguments: GameOverViewArguments(key: key, game: game),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
