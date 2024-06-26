import 'package:brick_breaker/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:brick_breaker/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:brick_breaker/ui/views/home/home_view.dart';
import 'package:brick_breaker/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:brick_breaker/ui/views/main_menu/main_menu_view.dart';
import 'package:brick_breaker/ui/views/game_over/game_over_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: MainMenuView),
    MaterialRoute(page: GameOverView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
