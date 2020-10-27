import 'package:auto_route/auto_route_annotations.dart';
import 'package:my_app/ui/smartWidgets/bottomNavRouter/bottomNavRouterView.dart';
import 'package:my_app/ui/views/cgpaCalc/cgpaCalcView.dart';
import 'package:my_app/ui/views/gpaCalc/gpaCalcView.dart';
import 'package:my_app/ui/views/home/homeView.dart';
import 'package:my_app/ui/views/signUp/signUpView.dart';
import 'package:my_app/ui/views/startUp/startupView.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: StartupView, initial: true, name: 'startupViewRoute'),
    MaterialRoute(
        page: HomeView, fullscreenDialog: true, name: 'homeViewRoute'),
    MaterialRoute(
        page: SignUpView, fullscreenDialog: true, name: 'signUpViewRoute'),
    MaterialRoute(
        page: BottomNavRouterView,
        fullscreenDialog: true,
        name: 'bottomNavViewRoute'),
    MaterialRoute(
        page: CgpaCalcView, fullscreenDialog: true, name: 'cgpaCalcViewRoute'),
    MaterialRoute(
        page: GpaClacView, fullscreenDialog: true, name: 'gpaCalcViewRoute'),
  ],
)
class $Router {}
